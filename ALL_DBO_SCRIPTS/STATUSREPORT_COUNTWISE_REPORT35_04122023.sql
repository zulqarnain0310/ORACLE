--------------------------------------------------------
--  DDL for Procedure STATUSREPORT_COUNTWISE_REPORT35_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" 
AS
   v_Date VARCHAR2(200) := ( SELECT Date_ 
     FROM Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
   v_Date1 VARCHAR2(10) := ( SELECT v_Date 
     FROM DUAL  );
   v_DateFrom VARCHAR2(15) := v_Date1;
   v_DateTo VARCHAR2(15) := v_Date1;
   v_From1 VARCHAR2(200) := ( SELECT Rdate 
     FROM TABLE(DateConvert(v_DateFrom))  );
   v_To1 VARCHAR2(200) := ( SELECT Rdate 
     FROM TABLE(DateConvert(v_DateTo))  );

BEGIN

   IF utils.object_id('TEMPDB..tt_AA_40') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_AA_40 ';
   END IF;
   DELETE FROM tt_AA_40;
   UTILS.IDENTITY_RESET('tt_AA_40');

   INSERT INTO tt_AA_40 SELECT DateofData ,
                               SourceSystemName Host_System  ,
                               COUNT(1)  COUNT  
        FROM ReverseFeedData 
       WHERE  AssetClass > 1
                AND UTILS.CONVERT_TO_VARCHAR2(dateofdata,200) BETWEEN v_From1 AND v_To1
        GROUP BY DateofData,SourceSystemName
        ORDER BY DateofData,
                 SourceSystemName;
   ---------Degrade Report-------------------
   IF utils.object_id('TEMPDB..tt_BB_9') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_BB_9 ';
   END IF;
   DELETE FROM tt_BB_9;
   UTILS.IDENTITY_RESET('tt_BB_9');

   INSERT INTO tt_BB_9 SELECT UTILS.CONVERT_TO_VARCHAR2(Process_Date,200,p_style=>105) Process_date  ,
                              B.SourceName Host_System  ,
                              COUNT(1)  COUNT  
        FROM ACL_NPA_DATA B
               LEFT JOIN DIMSOURCEDB src   ON B.SourceName = src.SourceName
               AND SRC.EffectiveToTimeKey = 49999
       WHERE  InitialAssetClassAlt_Key = 1
                AND FinalAssetClassAlt_Key > 1
                AND UTILS.CONVERT_TO_VARCHAR2(Process_Date,200,p_style=>105) BETWEEN v_From1 AND v_To1
        GROUP BY UTILS.CONVERT_TO_VARCHAR2(Process_Date,200,p_style=>105),B.SourceName
        ORDER BY UTILS.CONVERT_TO_VARCHAR2(Process_Date,200,p_style=>105),
                 B.SourceName;
   --OPTION(RECOMPILE)
   --SELECT 
   --CONVERT(VARCHAR(20),DateofData,103)     AS DATE,
   --A.[Host System],
   --A.COUNT                          AS DegradeRFCount,
   --B.COUNT                          AS DegradeReportCount,
   --(CASE WHEN A.COUNT = B.COUNT 
   --      THEN 'TRUE' 
   --	  ELSE 'FALSE' 
   --	  END)                       AS Status
   --FROM tt_AA_40 A 
   --INNER JOIN   tt_BB_9 B            ON CONVERT(DATE,DateofData,105) = CONVERT(DATE,Process_date,105)  
   --                                 AND A.[Host System] = B.[Host System]
   --ORDER BY CONVERT(DATE,DateofData,105) 
   --OPTION(RECOMPILE)
   MERGE INTO D 
   USING (SELECT D.ROWID row_id, A.COUNT, b.COUNT
   FROM D ,tt_AA_40 a
          JOIN tt_BB_9 b   ON a.Host_System = b.Host_System
          JOIN DIMSOURCEDB c   ON b.Host_System = c.SourceName
          JOIN StatusReport D   ON c.SourceAlt_Key = D.SourceAlt_Key ) src
   ON ( D.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET D.Degrade_Report_35 = src.COUNT,
                                D.Degrade_RF_Report_35 = src.COUNT;
   UPDATE StatusReport
      SET Degrade_Report_35 = 0
    WHERE  Degrade_Report_35 IS NULL;
   UPDATE StatusReport
      SET Degrade_RF_Report_35 = 0
    WHERE  Degrade_RF_Report_35 IS NULL;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."STATUSREPORT_COUNTWISE_REPORT35_04122023" TO "ADF_CDR_RBL_STGDB";
