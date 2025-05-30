--------------------------------------------------------
--  DDL for Procedure GOVTGUARAPPROPRIATION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."GOVTGUARAPPROPRIATION" /*=====================================
AUTHER : TRILOKI KHANNA
CREATE DATE : 27-11-2019
MODIFY DATE : 27-11-2019
DESCRIPTION :Govt Guar Appropriation
EXEC pro.GovtGuarAppropriation   @TIMEKEY=25140
====================================*/
(
  v_TimeKey IN NUMBER
)
AS

BEGIN
    DECLARE V_SQLERRM VARCHAR(150);
   BEGIN

      BEGIN
         /*-----UPDATE AppGovGur =0 --------------------------*/
         MERGE INTO GTT_ACCOUNTCAL A
         USING (SELECT A.ROWID row_id, 0
         FROM GTT_ACCOUNTCAL A
                JOIN GTT_CustomerCal B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE B.FlgProcessing = 'N') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.AppGovGur = 0;
         IF utils.object_id('TEMPDB..GTT_TEMPTABLEAppGovGur') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE GTT_TEMPTABLEAppGovGur ';
         END IF;
         DELETE FROM GTT_TEMPTABLEAppGovGur;
         UTILS.IDENTITY_RESET('GTT_TEMPTABLEAppGovGur');

         INSERT INTO GTT_TEMPTABLEAppGovGur ( 
         	SELECT A.AccountEntityID ,
                 (CASE 
                       WHEN SUM(A.NetBalance) OVER ( PARTITION BY A.CustomerEntityId ) > 0 THEN (A.GovtGtyAmt * (A.NetBalance / SUM(A.NetBalance) OVER ( PARTITION BY A.CustomerEntityId )))   END) GovGur  
         	  FROM GTT_ACCOUNTCAL A
         	 WHERE  A.FacilityType IN ( 'BP','BD' )

                    AND NVL(A.GovtGtyAmt, 0) > 0 );
         MERGE INTO GTT_ACCOUNTCAL A
         USING (SELECT A.ROWID row_id, B.GovGur
         FROM GTT_ACCOUNTCAL A
                JOIN GTT_TEMPTABLEAppGovGur B   ON A.AccountEntityID = B.AccountEntityID 
          WHERE A.FacilityType IN ( 'BP','BD' )
         ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.AppGovGur = src.GovGur;
         MERGE INTO GTT_ACCOUNTCAL A 
         USING (SELECT A.ROWID row_id, GovtGtyAmt
         FROM GTT_ACCOUNTCAL A 
          WHERE NOT ( A.FacilityType IN ( 'BP','BD' )
          )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.AppGovGur = GovtGtyAmt;
         UPDATE MAIN_PRO.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'GovtGuarAppropriation';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE GTT_TEMPTABLEAppGovGur ';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      -----------------Added for DashBoard 04-03-2021
      --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
      V_SQLERRM:=SQLERRM;
      UPDATE MAIN_PRO.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = V_SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'GovtGuarAppropriation';

   END;END;

EXCEPTION WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('NO DATA FOUND');
            WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."GOVTGUARAPPROPRIATION" TO "ADF_CDR_RBL_STGDB";
