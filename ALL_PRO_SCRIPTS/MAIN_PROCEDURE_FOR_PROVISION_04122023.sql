--------------------------------------------------------
--  DDL for Procedure MAIN_PROCEDURE_FOR_PROVISION_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" /*============================================================
	AUTHER : SANJEEV KUMAR SHARMA
	CREATE DATE : 21-11-2017
	MODIFY DATE : 21-11-2017
	DESCRIPTION : MAIN PROCESS FOR ASSET CLASSFIFCATION
	EXEC [PRO].[MAIN_PROCEDURE_FOR_PROVISION]  24864
=============================================================*/
(
  v_TIMEKEY IN NUMBER
)
AS
   /*--------------------PROCESS START FOR PROVISION--------------------------------------*/
   v_SetID NUMBER(10,0) := ( SELECT NVL(MAX(NVL(SETID, 0)) , 0) + 1 
     FROM PRO_RBL_MISDB_PROD.ProcessMonitor 
    WHERE  TimeKey = v_TIMEKEY );
   v_temp NUMBER(1, 0) := 0;

BEGIN

   BEGIN
      SELECT 1 INTO v_temp
        FROM DUAL
       WHERE EXISTS ( SELECT 1 
                      FROM PRO_RBL_MISDB_PROD.ProcessMonitor 
                       WHERE  TimeKey = v_TIMEKEY );
   EXCEPTION
      WHEN OTHERS THEN
         NULL;
   END;

   IF v_temp = 1 THEN

   BEGIN
      DELETE PRO_RBL_MISDB_PROD.ProcessMonitor

       WHERE  TIMEKEY = v_TIMEKEY;

   END;
   END IF;
   /*-------------Getting DPD AccountWise NPADAYS-------------------------------------------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
     ( SELECT USER ,
              'Getting_DPD_AccountWise_NPADAYS' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SetID 
         FROM DUAL  );
   PRO_RBL_MISDB_PROD.Getting_DPD_AccountWise_NPADAYS(v_TIMEKEY => v_TIMEKEY) ;
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'Getting_DPD_AccountWise_NPADAYS';
   /*-------------Update ProvisionKey AccountWise------------------------------------------------------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
     ( SELECT USER ,
              'UpdateProvisionKey_AccountWise' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SetID 
         FROM DUAL  );
   PRO_RBL_MISDB_PROD.UpdateProvisionKey_AccountWise(v_TimeKey => v_TIMEKEY) ;
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'UpdateProvisionKey_AccountWise';
   /*-------------Update NetBalance AccountWise------------------------------------------------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
     ( SELECT USER ,
              'UpdateNetBalance_AccountWise' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SetID 
         FROM DUAL  );
   PRO_RBL_MISDB_PROD.UpdateNetBalance_AccountWise(v_TimeKey => v_TIMEKEY) ;
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'UpdateNetBalance_AccountWise';
   /*------------ Security Appropriation------------------------------------------------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
     ( SELECT USER ,
              'SecurityAppropriation' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SetID 
         FROM DUAL  );
   PRO_RBL_MISDB_PROD.SecurityAppropriation(v_TimeKey => v_TIMEKEY) ;
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'SecurityAppropriation';
   /*-------------Provision Computation Secured-------------------------------------------------------------------------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
     ( SELECT USER ,
              'ProvisionComputationSecured' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SetID 
         FROM DUAL  );
   PRO_RBL_MISDB_PROD.ProvisionComputationSecured(v_TimeKey => v_TIMEKEY) ;
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'ProvisionComputationSecured';
   /*-------------Updation Provision Computation UnSecured -------------------------------------------------------------------------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
     ( SELECT USER ,
              'UpdationProvisionComputationUnSecured' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SetID 
         FROM DUAL  );
   PRO_RBL_MISDB_PROD.UpdationProvisionComputationUnSecured(v_TimeKey => v_TIMEKEY) ;
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'UpdationProvisionComputationUnSecured';
   /*----------------------------Updation Total Provision-------------------------------------------------------------------------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
     ( SELECT USER ,
              'UpdationTotalProvision' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SetID 
         FROM DUAL  );
   PRO_RBL_MISDB_PROD.UpdationTotalProvision(v_TimeKey => v_TIMEKEY) ;
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'UpdationTotalProvision';
   /*----------------------------MARKING OF FLG PROCESS-------------------------------------------------------------------------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
     ( SELECT USER ,
              'MarkingFlgProcessing' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SetID 
         FROM DUAL  );
   PRO_RBL_MISDB_PROD.MarkingFlgProcessing(v_TIMEKEY => v_TIMEKEY) ;
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'MarkingFlgProcessing';/*-------------------------------------------------PROCESS END FOR PROVISION----------------------------------------------------------------*/

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAIN_PROCEDURE_FOR_PROVISION_04122023" TO "ADF_CDR_RBL_STGDB";
