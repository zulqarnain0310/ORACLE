--------------------------------------------------------
--  DDL for Procedure DEGUPGFINALCOUNTQUERY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" 
AS
   ------Main Table Degrade Count-----------
   v_cursor SYS_REFCURSOR;

BEGIN

   OPEN  v_cursor FOR
      SELECT DegDate ,
             COUNT(1)  COUNT  
        FROM PRO_RBL_MISDB_PROD.AccountCal_Hist A
               JOIN PRO_RBL_MISDB_PROD.CustomerCal_Hist B   ON A.CustomerEntityID = B.CustomerEntityID
               AND A.EffectiveFromTimeKey = B.EffectiveFromTimeKey
       WHERE  FinalAssetClassAlt_Key > 1
                AND InitialAssetClassAlt_Key = 1
                AND DegDate BETWEEN '2021-07-01' AND '2021-07-31'
        GROUP BY DegDate
        ORDER BY DegDate ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   ------Main Table Upgrade Count-----------
   OPEN  v_cursor FOR
      SELECT UpgDate ,
             COUNT(1)  COUNT  
        FROM PRO_RBL_MISDB_PROD.AccountCal_Hist A
               JOIN PRO_RBL_MISDB_PROD.CustomerCal_Hist B   ON A.CustomerEntityID = B.CustomerEntityID
               AND A.EffectiveFromTimeKey = B.EffectiveFromTimeKey
       WHERE  FinalAssetClassAlt_Key > 1
                AND InitialAssetClassAlt_Key = 1
                AND UpgDate BETWEEN '2021-07-01' AND '2021-07-31'
        GROUP BY UpgDate
        ORDER BY UpgDate ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   ---------------------Degrade report
   RBL_MISDB_PROD.Rpt_026('01/08/2021',
                          '26/08/2021',
                          1) ;
   ---------------------Upgrade report
   RBL_MISDB_PROD.Rpt_027('01/08/2021',
                          '26/08/2021',
                          1) ;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGUPGFINALCOUNTQUERY" TO "ADF_CDR_RBL_STGDB";
