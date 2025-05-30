--------------------------------------------------------
--  DDL for Procedure REPORT_MENULIST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."REPORT_MENULIST" 
AS
   v_TimeKey NUMBER(10,0);
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT Timekey 

     INTO v_Timekey
     FROM SysDataMatrix 
    WHERE  CurrentStatus = 'C';
   OPEN  v_cursor FOR
      SELECT ReportID ReportNo  ,
             menucaption ReportName  ,
             'ReportList' TableName  
        FROM SysCRisMacMenu 
       WHERE  parentid = 144
                AND menuid > 24624 --EffectiveFromTimeKey <= @TimeKey  AND EffectiveToTimeKey >= @TimeKey

        ORDER BY ReportID ;
      DBMS_SQL.RETURN_RESULT(v_cursor);--select menucaption,Reportid from syscrismacmenu where parentid=144 and menuid>24624

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REPORT_MENULIST" TO "ADF_CDR_RBL_STGDB";
