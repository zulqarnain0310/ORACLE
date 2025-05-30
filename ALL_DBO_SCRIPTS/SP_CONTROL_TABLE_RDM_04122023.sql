--------------------------------------------------------
--  DDL for Procedure SP_CONTROL_TABLE_RDM_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" 
AS
   v_ACL_Date VARCHAR2(200);
   v_Dateofdata VARCHAR2(200);
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT UTILS.CONVERT_TO_VARCHAR2(Date_,200) 

     INTO v_ACL_Date
     FROM Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   SELECT MAX(DISTINCT dateofdata)  

     INTO v_Dateofdata
     FROM Control_Table_for_RDM_Process 
    WHERE  COUNTER = 0;
   IF ( v_Dateofdata = v_ACL_Date ) THEN

   BEGIN
      OPEN  v_cursor FOR
         SELECT 'Success' ACL  
           FROM DUAL  ;
         DBMS_SQL.RETURN_RESULT(v_cursor);

   END;
   ELSE

   BEGIN
      OPEN  v_cursor FOR
         SELECT 'Failed' ACL  
           FROM DUAL  ;
         DBMS_SQL.RETURN_RESULT(v_cursor);

   END;
   END IF;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_CONTROL_TABLE_RDM_04122023" TO "ADF_CDR_RBL_STGDB";
