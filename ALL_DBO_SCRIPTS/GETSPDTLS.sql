--------------------------------------------------------
--  DDL for Procedure GETSPDTLS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."GETSPDTLS" /* CREATED BY DF627 ON 18-07-24 FOR GETTING DATE WISE SP SCRIPTS */
AS
   -- Select data from SpDtls where the ProcessDate is today's date
   v_cursor SYS_REFCURSOR;

BEGIN

   OPEN  v_cursor FOR
      SELECT * 
        FROM RBL_MISDB_PROD.SpDtls 
       WHERE  UTILS.CONVERT_TO_VARCHAR2(ProcessDate,200) = utils.dateadd('DD', -1, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200))
        ORDER BY Spname,
                 ProcessDate DESC ;
      DBMS_SQL.RETURN_RESULT(v_cursor);

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPDTLS" TO "ADF_CDR_RBL_STGDB";
