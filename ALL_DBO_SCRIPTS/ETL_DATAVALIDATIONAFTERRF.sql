--------------------------------------------------------
--  DDL for Procedure ETL_DATAVALIDATIONAFTERRF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" 
AS
   v_cursor SYS_REFCURSOR;

BEGIN

   OPEN  v_cursor FOR
      SELECT 'Customercal Records' 
        FROM DUAL  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT COUNT(1)  
        FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT 'Accountcal Records' 
        FROM DUAL  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT COUNT(1)  
        FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT 'ACL Degrade Records' 
        FROM DUAL  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT SourceAlt_key ,
             COUNT(1)  
        FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
       WHERE  InitialAssetClassAlt_Key = 1
                AND FinalAssetClassAlt_Key > 1
        GROUP BY SourceAlt_Key ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT 'ACL Upgrade Records' 
        FROM DUAL  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT SourceAlt_key ,
             COUNT(1)  
        FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
       WHERE  InitialAssetClassAlt_Key > 1
                AND FinalAssetClassAlt_Key = 1
        GROUP BY SourceAlt_Key ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT 'Reversefeed records' 
        FROM DUAL  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT SourceAlt_Key ,
             COUNT(1)  COUNT  
        FROM ReverseFeedData 
       WHERE  UTILS.CONVERT_TO_VARCHAR2(dateofData,200) IN ( SELECT Date_ 
                                                             FROM Automate_Advances 
                                                              WHERE  Ext_flg = 'Y' )

        GROUP BY SourceAlt_Key ;
      DBMS_SQL.RETURN_RESULT(v_cursor);--delete from [RBL_STGDB].dbo.Package_Audit where cast(Execution_date as date) = cast(GETDATE() as date)

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ETL_DATAVALIDATIONAFTERRF" TO "ADF_CDR_RBL_STGDB";
