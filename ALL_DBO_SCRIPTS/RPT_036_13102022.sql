--------------------------------------------------------
--  DDL for Procedure RPT_036_13102022
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."RPT_036_13102022" /*
Report Name -  Upgrade Status Report
Create by   -  Manmohan Sharma
Date        -  10 NOV 2021
*/
(
  v_DateFrom IN VARCHAR2,
  v_DateTo IN VARCHAR2
)
AS
   --DECLARE 
   --@DateFrom	AS VARCHAR(15)='01/01/2021',
   --@DateTo		AS VARCHAR(15)='12/11/2021'
   ------------------------------------
   v_From1 VARCHAR2(200) := ( SELECT Rdate 
     FROM TABLE(DateConvert(v_DateFrom))  );
   v_To1 VARCHAR2(200) := ( SELECT Rdate 
     FROM TABLE(DateConvert(v_DateTo))  );
   v_cursor SYS_REFCURSOR;

BEGIN

   IF utils.object_id('TEMPDB..tt_AA_33') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_AA_33 ';
   END IF;
   DELETE FROM tt_AA_33;
   UTILS.IDENTITY_RESET('tt_AA_33');

   INSERT INTO tt_AA_33 SELECT DISTINCT DateofData ,
                                        SourceSystemName Host_System  ,
                                        COUNT(1)  COUNT  
        FROM RBL_MISDB_PROD.ReverseFeedData 
       WHERE  AssetClass = 1
                AND UTILS.CONVERT_TO_VARCHAR2(dateofdata,200) BETWEEN v_From1 AND v_To1
        GROUP BY DateofData,SourceSystemName
        ORDER BY DateofData,
                 SourceSystemName;
   ---------Upgrade Report-------------------
   IF utils.object_id('TEMPDB..tt_BB_2') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_BB_2 ';
   END IF;
   DELETE FROM tt_BB_2;
   UTILS.IDENTITY_RESET('tt_BB_2');

   INSERT INTO tt_BB_2 SELECT UTILS.CONVERT_TO_VARCHAR2(Process_Date,200,p_style=>105) Process_date  ,
                              B.SourceName Host_System  ,
                              COUNT(1)  COUNT  
        FROM ACL_UPG_DATA B
               LEFT JOIN DIMSOURCEDB src   ON B.SourceName = src.SourceName
               AND SRC.EffectiveToTimeKey = 49999
       WHERE  InitialAssetClassAlt_Key > 1
                AND FinalAssetClassAlt_Key = 1
                AND UTILS.CONVERT_TO_VARCHAR2(Process_Date,200,p_style=>105) BETWEEN v_From1 AND v_To1
        GROUP BY UTILS.CONVERT_TO_VARCHAR2(Process_Date,200,p_style=>105),B.SourceName
        ORDER BY UTILS.CONVERT_TO_VARCHAR2(Process_Date,200,p_style=>105),
                 B.SourceName;
   OPEN  v_cursor FOR
      SELECT UTILS.CONVERT_TO_VARCHAR2(DateofData,20,p_style=>105) DATE_  ,
             A."Host System" ,
             A.COUNT UpgradeRFCount  ,
             B.COUNT UpgradeReportCount  ,
             (CASE 
                   WHEN A.COUNT = B.COUNT THEN 'TRUE'
             ELSE 'FALSE'
                END) STATUS  
        FROM tt_AA_33 A
               JOIN tt_BB_2 B   ON UTILS.CONVERT_TO_VARCHAR2(DateofData,200,p_style=>105) = UTILS.CONVERT_TO_VARCHAR2(Process_date,200,p_style=>105)
               AND A.Host_System = B.Host_System
        ORDER BY UTILS.CONVERT_TO_VARCHAR2(DateofData,200,p_style=>105) ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_AA_33 ';
   EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_BB_2 ';

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."RPT_036_13102022" TO "ADF_CDR_RBL_STGDB";
