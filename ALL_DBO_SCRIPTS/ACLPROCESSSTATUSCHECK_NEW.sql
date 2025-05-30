--------------------------------------------------------
--  DDL for Procedure ACLPROCESSSTATUSCHECK_NEW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" 
AS
   --DECLARE @TIMEKEY INT=(SELECT Timekey FROM Automate_Advances WHERE EXT_FLG='Y')
   --DECLARE @ProcessDate DATE=(select distinct date_of_data from DWH_STG.dwh.account_data_finacle)
   --DECLARE @TIMEKEY INT=(SELECT Timekey FROM Automate_Advances WHERE CAST(Date AS DATE)=@ProcessDate)
   v_ACLTimekey NUMBER(10,0) := ( SELECT MAX(timekey)  
     FROM ACLProcessInProgressStatus  );
   v_temp NUMBER(1, 0) := 0;
   v_cursor SYS_REFCURSOR;

BEGIN

   BEGIN
      SELECT 1 INTO v_temp
        FROM DUAL
       WHERE EXISTS ( SELECT 1 
                      FROM ACLProcessInProgressStatus 
                       WHERE  STATUS = 'RUNNING'
                                AND StatusFlag = 'N'
                                AND TimeKey = v_ACLTimekey );
   EXCEPTION
      WHEN OTHERS THEN
         NULL;
   END;

   IF v_temp = 1 THEN

   BEGIN
      DBMS_OUTPUT.PUT_LINE('ACL Process is In Progress');
      OPEN  v_cursor FOR
         SELECT * ,
                'ACLProcessingStatus' TableName  
           FROM ACLProcessInProgressStatus 
          WHERE  STATUS = 'RUNNING'
                   AND StatusFlag = 'N'
                   AND TimeKey = v_ACLTimekey ;
         DBMS_SQL.RETURN_RESULT(v_cursor);

   END;
   ELSE

   BEGIN
      DBMS_OUTPUT.PUT_LINE('ACL Process Completed');
      OPEN  v_cursor FOR
         SELECT * ,
                'ACLProcessingStatus' TableName  
           FROM ACLProcessInProgressStatus 
          WHERE  STATUS = 'COMPLETED'
                   AND StatusFlag = 'Y'
                   AND TimeKey = v_ACLTimekey ;
         DBMS_SQL.RETURN_RESULT(v_cursor);

   END;
   END IF;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLPROCESSSTATUSCHECK_NEW" TO "ADF_CDR_RBL_STGDB";
