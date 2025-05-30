--------------------------------------------------------
--  DDL for Procedure GETFISDATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."GETFISDATA" 
AS
   v_TimeKey NUMBER(10,0) := ( SELECT TimeKey 
     FROM Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
   v_Date VARCHAR2(200) := ( SELECT DISTINCT Date_ 
     FROM Automate_Advances 
    WHERE  TimeKey = v_TimeKey );
   v_PreviousDate VARCHAR2(200) := ( SELECT Date_ 
     FROM Automate_Advances 
    WHERE  Timekey = v_TimeKey - 2 );
   v_cursor SYS_REFCURSOR;

BEGIN

   --------------FIS
   ----------Added on 04/04/2022  
   IF utils.object_id('TempDB..tt_FIS') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_FIS ';
   END IF;
   DELETE FROM tt_FIS;
   UTILS.IDENTITY_RESET('tt_FIS');

   INSERT INTO tt_FIS ( 
   	SELECT A.RefCustomerID CustomerID  ,
           A.CustomerAcID AccountID  ,
           A.FinalAssetClassAlt_Key FinalAssetClassAlt_Key  ,
           A.FinalNpaDt NPADate  
   	  FROM ReverseFeedDataInsertSync Sync
             JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL A   ON A.CustomerAcID = SYNC.CustomerAcID
             AND A.EffectiveFromTimeKey <= v_Timekey
             AND A.EffectiveToTimeKey >= v_Timekey
             AND SYNC.ProcessDate = v_Date
   	 WHERE  A.SourceAlt_Key = 5 );
   ----------------------------  
   IF  --SQLDEV: NOT RECOGNIZED
   IF tt_TEMP_20  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_TEMP_20;
   UTILS.IDENTITY_RESET('tt_TEMP_20');

   INSERT INTO tt_TEMP_20 ( 
   	SELECT * 
   	  FROM ( SELECT UTILS.CONVERT_TO_VARCHAR2(UTILS.CONVERT_TO_NUMBER(SUBSTR(CustomerID, 2, 50),18),30) || '|' || AccountID || '|' || CASE 
                                                                                                                                           WHEN A.FinalAssetClassAlt_Key = 1 THEN '01/01/1900'
                    ELSE NVL(UTILS.CONVERT_TO_VARCHAR2(NPADate,10,p_style=>103), '   ')
                       END || '|' || (CASE 
                                           WHEN A.FinalAssetClassAlt_Key = 1 THEN '0'
                                           WHEN A.FinalAssetClassAlt_Key = 2 THEN '4'
                                           WHEN A.FinalAssetClassAlt_Key = 3 THEN '5'
                                           WHEN A.FinalAssetClassAlt_Key = 4 THEN '6'
                                           WHEN A.FinalAssetClassAlt_Key = 5 THEN '7'
                                           WHEN A.FinalAssetClassAlt_Key = 6 THEN '8'
                                           WHEN A.FinalAssetClassAlt_Key = 7 THEN '9'
                    ELSE '10'
                       END) DATA  
             FROM tt_FIS A ) T );
   OPEN  v_cursor FOR
      SELECT DISTINCT * 
        FROM tt_TEMP_20  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETFISDATA" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETFISDATA" TO "ADF_CDR_RBL_STGDB";
