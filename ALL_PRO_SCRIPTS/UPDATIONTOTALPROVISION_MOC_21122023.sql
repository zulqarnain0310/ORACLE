--------------------------------------------------------
--  DDL for Procedure UPDATIONTOTALPROVISION_MOC_21122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" /*==============================          
Author : TRILOKI KHANNA   
CREATE DATE : 27-11-2019          
MODIFY DATE : 27-11-2019         
DESCRIPTION : UPDATE TOTAL PROVISION          
--EXEC [pro].[UpdationTotalProvision] @TimeKey =25410            
=========================================*/
(
  v_TimeKey IN NUMBER,
  v_ProcessType IN VARCHAR2 DEFAULT 'MAINPROC' 
)
AS

BEGIN

   BEGIN
      DECLARE
         v_vEffectivefrom NUMBER(10,0);
         v_vEffectiveto NUMBER(10,0);
         v_DATE VARCHAR2(200) := ( SELECT Date_ 
           FROM RBL_MISDB_PROD.Automate_Advances 
          WHERE  EXT_FLG = 'Y' );

      BEGIN
         SELECT TimeKey 

           INTO v_vEffectiveFrom
           FROM RBL_MISDB_PROD.Automate_Advances 
          WHERE  EXT_FLG = 'Y';
         SELECT Timekey - 1 

           INTO v_vEffectiveto
           FROM RBL_MISDB_PROD.Automate_Advances 
          WHERE  EXT_FLG = 'Y';
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET TOTALPROVISION = 0,
                BANKTOTALPROVISION = 0,
                RBITOTALPROVISION = 0;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET TOTPROVISION = 0,
                BANKTOTPROVISION = 0,
                RBITOTPROVISION = 0;
         -------- ----Start--added by Amar for Accelerated Provision 
         ----END--added by Amar for Accelerated Provision---
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (NVL(A.Provsecured, 0) + NVL(A.ProvUnsecured, 0) + (NVL(A.AddlProvision, 0)) + NVL(A.ProvCoverGovGur, 0) + NVL(A.ProvDFV, 0)) AS pos_2, (NVL(A.BankProvsecured, 0) + NVL(A.BankProvUnsecured, 0) + (NVL(A.AddlProvision, 0)) + NVL(A.ProvCoverGovGur, 0) + NVL(A.ProvDFV, 0)) AS pos_3, (NVL(A.RBIProvsecured, 0) + NVL(A.RBIProvUnsecured, 0) + (NVL(A.AddlProvision, 0)) + NVL(A.ProvCoverGovGur, 0) + NVL(A.ProvDFV, 0)) AS pos_4
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET TOTALPROVISION = pos_2,
                                      BANKTOTALPROVISION = pos_3,
                                      RBITOTALPROVISION = pos_4;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET TOTALPROVISION = 0
          WHERE  NVL(TOTALPROVISION, 0) < 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET BANKTOTALPROVISION = 0
          WHERE  NVL(BANKTOTALPROVISION, 0) < 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET RBITOTALPROVISION = 0
          WHERE  NVL(RBITOTALPROVISION, 0) < 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET TOTALPROVISION = NetBalance
          WHERE  NVL(TOTALPROVISION, 0) > NetBalance
           AND NVL(NetBalance, 0) > 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET BANKTOTALPROVISION = NetBalance
          WHERE  NVL(BANKTOTALPROVISION, 0) > NetBalance
           AND NVL(NetBalance, 0) > 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET RBITOTALPROVISION = NetBalance
          WHERE  NVL(RBITOTALPROVISION, 0) > NetBalance
           AND NVL(NetBalance, 0) > 0;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, RBITOTALPROVISION, RBIPROVSECURED, RBIPROVUNSECURED, ADDLPROVISION, PROVCOVERGOVGUR, PROVDFV
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
          WHERE NVL(A.RBITotalProvision, 0) > NVL(A.BankTotalProvision, 0)) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET TOTALPROVISION = RBITOTALPROVISION,
                                      PROVSECURED = RBIPROVSECURED,
                                      PROVUNSECURED = RBIPROVUNSECURED,
                                      ADDLPROVISION = ADDLPROVISION,
                                      PROVCOVERGOVGUR = PROVCOVERGOVGUR,
                                      PROVDFV = PROVDFV;
         EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.AdvAcRestructureCal ';
         INSERT INTO PRO_RBL_MISDB_PROD.AdvAcRestructureCal
         --EntityKey
          --,

           ( AccountEntityId, AssetClassAlt_KeyOnInvocation, PreRestructureAssetClassAlt_Key, PreRestructureNPA_Date, ProvPerOnRestrucure, RestructureTypeAlt_Key, COVID_OTR_CatgAlt_Key, RestructureDt, SP_ExpiryDate, DPD_AsOnRestructure, RestructureFailureDate, DPD_Breach_Date, ZeroDPD_Date, SP_ExpiryExtendedDate, CurrentPOS, CurrentTOS, RestructurePOS, Res_POS_to_CurrentPOS_Per, CurrentDPD, TotalDPD, VDPD, AddlProvPer, ProvReleasePer, AppliedNormalProvPer, FinalProvPer, PreDegProvPer, UpgradeDate, SurvPeriodEndDate
         --------,DegDurSP_PeriodProvPer
         , NonFinDPD, InitialAssetClassAlt_Key, FinalAssetClassAlt_Key, RestructureProvision, SecuredProvision, UnSecuredProvision, FlgDeg, FlgUpg, DegDate, RC_Pending, FinalNpaDt, RestructureStage, EffectiveFromTimeKey, EffectiveToTimeKey, FlgMorat, InvestmentGrade, POS_10PerPaidDate, RestructureFacilityTypeAlt_Key )
           ( SELECT
             --EntityKeyNew
              --,
              A.AccountEntityId ,
              A.AssetClassAlt_KeyOnInvocation ,
              A.PreRestructureAssetClassAlt_Key ,
              A.PreRestructureNPA_Date ,
              A.ProvPerOnRestrucure ,
              A.RestructureTypeAlt_Key ,
              A.COVID_OTR_CatgAlt_Key ,
              A.RestructureDt ,
              A.SP_ExpiryDate ,
              A.DPD_AsOnRestructure ,
              A.RestructureFailureDate ,
              A.DPD_Breach_Date ,
              A.ZeroDPD_Date ,
              A.SP_ExpiryExtendedDate ,
              A.CurrentPOS ,
              A.CurrentTOS ,
              A.RestructurePOS ,
              A.Res_POS_to_CurrentPOS_Per ,
              A.CurrentDPD ,
              A.TotalDPD ,
              A.VDPD ,
              A.AddlProvPer ,
              A.ProvReleasePer ,
              A.AppliedNormalProvPer ,
              A.FinalProvPer ,
              A.PreDegProvPer ,
              A.UpgradeDate ,
              A.SurvPeriodEndDate ,
              --------,DegDurSP_PeriodProvPer
              A.NonFinDPD ,
              A.InitialAssetClassAlt_Key ,
              A.FinalAssetClassAlt_Key ,
              A.RestructureProvision ,
              A.SecuredProvision ,
              A.UnSecuredProvision ,
              A.FlgDeg ,
              A.FlgUpg ,
              A.DegDate ,
              A.RC_Pending ,
              A.FinalNpaDt ,
              A.RestructureStage ,
              v_TIMEKEY EffectiveFromTimeKey  ,
              v_TIMEKEY EffectiveToTimeKey  ,
              A.FlgMorat ,
              A.InvestmentGrade ,
              A.POS_10PerPaidDate ,
              A.RestructureFacilityTypeAlt_Key 
             FROM PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist a
                    JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityId = B.AccountEntityID
              WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                       AND A.EffectiveToTimeKey >= v_TIMEKEY );
         --Select * 
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, b.FinalAssetClassAlt_Key, B.InitialAssetClassAlt_Key, CASE 
         WHEN B.FinalAssetClassAlt_Key = 1 THEN SP.ProvisionSecured
         ELSE np.ProvisionSecured
            END AS pos_4, b.FinalNpaDt, A.RestructureStage || (CASE 
         WHEN B.FinalAssetClassAlt_Key > 1
           AND SUBSTR(RestructureStage, -3, 3) = 'STD' THEN '-NPA'
         WHEN B.FinalAssetClassAlt_Key = 1
           AND SUBSTR(RestructureStage, -3, 3) = 'NPA' THEN '-STD'
         ELSE ' '
            END) AS pos_6, CASE 
         WHEN B.UpgDate IS NOT NULL THEN B.UpgDate
         ELSE A.UpgradeDate
            END AS pos_7, CASE 
         WHEN B.UpgDate IS NOT NULL THEN utils.dateadd('YY', 1, b.UpgDate)
         ELSE A.SurvPeriodEndDate
            END AS pos_8
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityId = B.AccountEntityID
                LEFT JOIN DimProvision_SegStd SP   ON SP.EffectiveFromTimeKey <= v_TimeKey
                AND SP.EffectiveToTimeKey >= v_TimeKey
                AND SP.ProvisionAlt_Key = B.ProvisionAlt_Key
                LEFT JOIN DimProvision_Seg NP   ON NP.EffectiveFromTimeKey <= v_TimeKey
                AND NP.EffectiveToTimeKey >= v_TimeKey
                AND NP.ProvisionAlt_Key = B.ProvisionAlt_Key 
          WHERE A.EffectiveFromTimeKey <= v_TimeKey
           AND A.EffectiveToTimeKey >= v_TimeKey) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                      A.InitialAssetClassAlt_Key = src.InitialAssetClassAlt_Key,
                                      A.AppliedNormalProvPer = pos_4,
                                      A.FinalNpaDt = src.FinalNpaDt,
                                      A.RestructureStage = pos_6,
                                      A.UpgradeDate = pos_7,
                                      A.SurvPeriodEndDate = pos_8;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'STD-STD-NPA-STD' AS RestructureStage
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A 
          WHERE RestructureStage = 'STD-STD-NPA-STD-NPA-STD') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RestructureStage = src.RestructureStage;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'NPA-STD-NPA-STD' AS RestructureStage
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A 
          WHERE RestructureStage = 'NPA-STD-NPA-STD-NPA-STD') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RestructureStage = src.RestructureStage;
         /* ADD RESTRUCTURE PROVIISION IN TOTAL PROVIISION */
         /* CONTINUE RESTRUCTURE ROVISION */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(TotalProvision, 0) + NVL(RestructureProvision, 0) AS TotalProvision
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal B   ON A.AccountEntityID = B.AccountEntityId ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.TotalProvision = src.TotalProvision;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET TOTALPROVISION = NetBalance
          WHERE  NVL(TOTALPROVISION, 0) > NetBalance
           AND NVL(NetBalance, 0) > 0;
         IF utils.object_id('TEMPDB..tt_TOTALPROVCUST_18') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TOTALPROVCUST_18 ';
         END IF;
         DELETE FROM tt_TOTALPROVCUST_18;
         UTILS.IDENTITY_RESET('tt_TOTALPROVCUST_18');

         INSERT INTO tt_TOTALPROVCUST_18 ( 
         	SELECT CUSTOMERENTITYID ,
                 SUM(NVL(TOTALPROVISION, 0))  TOTALPROVISION  ,
                 SUM(NVL(BANKTOTALPROVISION, 0))  BANKTOTPROVISION  ,
                 SUM(NVL(RBITOTALPROVISION, 0))  RBITOTPROVISION  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
         	  GROUP BY CUSTOMERENTITYID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.TOTALPROVISION, B.BANKTOTPROVISION, B.RBITOTPROVISION
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_TOTALPROVCUST_18 B   ON A.CustomerEntityID = B.CUSTOMERENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.TOTPROVISION = src.TOTALPROVISION,
                                      A.BANKTOTPROVISION = src.BANKTOTPROVISION,
                                      A.RBITOTPROVISION = src.RBITOTPROVISION;
         /* RESTRUCTURE PROV WORK */
         /* AMAR -- 21032023 - RESTRUCTURE WORK FOR MOC PROCESSING*/
         ------DELETE  FROM  CURDAT.AdvCustNPAdetail WHERE EffectiveFromTimeKey<=@TIMEKEY and EffectiveToTimeKey>=@TIMEKEY
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TOTALPROVCUST_18 ';
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'UpdationTotalProvision';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      -----------------Added for DashBoard 04-03-2021
      --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'UpdationTotalProvision';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_MOC_21122023" TO "ADF_CDR_RBL_STGDB";
