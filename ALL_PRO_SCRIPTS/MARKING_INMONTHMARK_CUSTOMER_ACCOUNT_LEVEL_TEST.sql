--------------------------------------------------------
--  DDL for Procedure MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" /*=======================================
AUTHER : TRILOKI KHANNA
CREATE DATE : 27-11-2019
MODIFY DATE : 27-11-2019
DESCRIPTION : MARKING OF IN MONTH MARK AT CUSTOMER LEVEL
--EXEC [PRO].[Marking_InMonthMark_Customer_Account_level]  @timekey=25140
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         v_PROCESSDATE VARCHAR2(200) := ( SELECT Date_ 
           FROM SysDayMatrix 
          WHERE  TimeKey = v_timekey );
         v_PROC_FREQ CHAR(1) := ( SELECT RefValue 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'PROC_FREQ' );
         v_PROC_CONDITION NUMBER := ( SELECT UTILS.CONVERT_TO_NUMBER(RefValue,18,2) 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'PROC_CONDITION' );

      BEGIN
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL_test
            SET INMONTHMARK = 'N';
         IF v_PROC_FREQ = 'D'
           AND v_PROCESSDATE <> EOMONTH(v_PROCESSDATE) THEN

         BEGIN
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, 'Y'
            FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                   JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.INMONTHMARK = 'Y';
            UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL_test
               SET INMONTHMARK = 'N'
             WHERE  ( INMONTHMARK IS NULL );

         END;
         ELSE
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, 'Y'
            FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.INMONTHMARK = 'Y';
         END IF;
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus_TEST
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Marking_InMonthMark_Customer_Account_level';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      -----------------Added for DashBoard 04-03-2021
      --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus_TEST
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'Marking_InMonthMark_Customer_Account_level';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_INMONTHMARK_CUSTOMER_ACCOUNT_LEVEL_TEST" TO "ADF_CDR_RBL_STGDB";
