--------------------------------------------------------
--  DDL for Procedure UPDATIONTOTALPROVISION_29062024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" /*==============================          
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
         UPDATE tt_ACCOUNTCAL_59
            SET TOTALPROVISION = 0,
                BANKTOTALPROVISION = 0,
                RBITOTALPROVISION = 0;
         UPDATE tt_CUSTOMERCAL_58
            SET TOTPROVISION = 0,
                BANKTOTPROVISION = 0,
                RBITOTPROVISION = 0;
         -------- ----Start--added by Amar for Accelerated Provision 
         ----END--added by Amar for Accelerated Provision---
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (NVL(A.PROVSECURED, 0) + NVL(A.PROVUNSECURED, 0) + (NVL(A.ADDLPROVISION, 0)) + NVL(A.PROVCOVERGOVGUR, 0) + NVL(A.PROVDFV, 0)) AS pos_2, (NVL(A.BANKPROVSECURED, 0) + NVL(A.BANKPROVUNSECURED, 0) + (NVL(A.ADDLPROVISION, 0)) + NVL(A.PROVCOVERGOVGUR, 0) + NVL(A.PROVDFV, 0)) AS pos_3, (NVL(A.RBIPROVSECURED, 0) + NVL(A.RBIPROVUNSECURED, 0) + (NVL(A.ADDLPROVISION, 0)) + NVL(A.PROVCOVERGOVGUR, 0) + NVL(A.PROVDFV, 0)) AS pos_4
         FROM A ,tt_ACCOUNTCAL_59 A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.TOTALPROVISION = pos_2,
                                      A.BANKTOTALPROVISION = pos_3,
                                      A.RBITOTALPROVISION = pos_4;
         UPDATE tt_ACCOUNTCAL_59
            SET TOTALPROVISION = 0
          WHERE  NVL(TOTALPROVISION, 0) < 0;
         UPDATE tt_ACCOUNTCAL_59
            SET BANKTOTALPROVISION = 0
          WHERE  NVL(BANKTOTALPROVISION, 0) < 0;
         UPDATE tt_ACCOUNTCAL_59
            SET RBITOTALPROVISION = 0
          WHERE  NVL(RBITOTALPROVISION, 0) < 0;
         --UPDATE PRO.ACCOUNTCAL SET TOTALPROVISION=NetBalance WHERE ISNULL(TOTALPROVISION,0)>NetBalance AND ISNULL(NetBalance,0)>0
         --UPDATE PRO.ACCOUNTCAL SET BANKTOTALPROVISION=NetBalance WHERE ISNULL(BANKTOTALPROVISION,0)>NetBalance AND ISNULL(NetBalance,0)>0
         --UPDATE PRO.ACCOUNTCAL SET RBITOTALPROVISION=NetBalance WHERE ISNULL(RBITOTALPROVISION,0)>NetBalance AND ISNULL(NetBalance,0)>0
         /** Condition changesd made by liyaqat after confirmation with Amar sir on 20230727 **/
         UPDATE tt_ACCOUNTCAL_59
            SET TOTALPROVISION = NetBalance
          WHERE  NVL(TOTALPROVISION, 0) > NetBalance;---AND ISNULL(NetBalance,0)>0
         UPDATE tt_ACCOUNTCAL_59
            SET BANKTOTALPROVISION = NetBalance
          WHERE  NVL(BANKTOTALPROVISION, 0) > NetBalance;--- AND ISNULL(NetBalance,0)>0
         UPDATE tt_ACCOUNTCAL_59
            SET RBITOTALPROVISION = NetBalance
          WHERE  NVL(RBITOTALPROVISION, 0) > NetBalance;---AND ISNULL(NetBalance,0)>0
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, RBITOTALPROVISION, RBIPROVSECURED, RBIPROVUNSECURED, ADDLPROVISION, PROVCOVERGOVGUR, PROVDFV
         FROM A ,tt_ACCOUNTCAL_59 A 
          WHERE NVL(A.RBITOTALPROVISION, 0) > NVL(A.BANKTOTALPROVISION, 0)) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.TOTALPROVISION = RBITOTALPROVISION,
                                      A.PROVSECURED = RBIPROVSECURED,
                                      A.PROVUNSECURED = RBIPROVUNSECURED,
                                      A.ADDLPROVISION = ADDLPROVISION,
                                      A.PROVCOVERGOVGUR = PROVCOVERGOVGUR,
                                      A.PROVDFV = PROVDFV;
         /* RESTRUCTURE PROV WORK */
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
                JOIN tt_ACCOUNTCAL_59 B   ON A.AccountEntityId = B.AccountEntityId
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
         /* 1- RESOLUTION FRAMEWORK - CALCUCATE PROV  */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN NVL(PreRestructureAssetClassAlt_Key, 0) > 1 THEN NVL(PreRestructureNPA_Prov, 0)
         ELSE 10
            END) AS AddlProvPer
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND D.ParameterShortNameEnum IN ( 'COVID_OTR_RF','COVID_OTR_RF_2' )

          WHERE FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.AddlProvPer = src.AddlProvPer;
         ---and RestructureStage in('NPA-STD','STD-STD') 
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN E.ParameterShortNameEnum = 'Personal' THEN CASE 
                                                              WHEN Res_POS_to_CurrentPOS_Per <= 30 THEN AddlProvPer / 2
         ELSE AddlProvPer
            END
         WHEN E.ParameterShortNameEnum = 'Other'
           AND SP_ExpiryDate < v_DATE THEN CASE 
                                                WHEN Res_POS_to_CurrentPOS_Per <= 30 THEN AddlProvPer / 2
         ELSE AddlProvPer
            END   END AS ProvReleasePer
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND D.ParameterShortNameEnum IN ( 'COVID_OTR_RF','COVID_OTR_RF_2' )

                JOIN DimParameter E   ON E.EffectiveFromTimeKey <= v_timekey
                AND E.EffectiveToTimeKey >= v_timekey
                AND E.ParameterAlt_Key = A.COVID_OTR_CatgAlt_Key
                AND E.DimParameterName = 'Covid - OTR Category' 
          WHERE FinalAssetClassAlt_Key = 1
           AND NVL(Res_POS_to_CurrentPOS_Per, 0) >= 20) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.ProvReleasePer --AND D.ParameterShortNameEnum ='COVID_OTR_RF'
                                       = src.ProvReleasePer;
         ---and RestructureStage in('NPA-STD','STD-STD') 
         /* 1- MSME_OLD AND MSME_COVID FRAMEWORK  */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN FinalAssetClassAlt_Key > 1 THEN 5
         WHEN A.FinalAssetClassAlt_Key = 1
           AND NVL(PreRestructureAssetClassAlt_Key, 0) > 1 THEN NVL(PreRestructureNPA_Prov, 0) + 5
         WHEN A.FinalAssetClassAlt_Key = 1
           AND NVL(PreRestructureAssetClassAlt_Key, 0) = 1 THEN (CASE 
                                                                      WHEN FlgMorat = 'Y' THEN 15
         ELSE 5
            END)   END) AS AddlProvPer
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND D.ParameterShortNameEnum IN ( 'MSME_COVID','MSME_OLD' )
               ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.AddlProvPer -- CURRENT NPA
                                       -- CURRENT STD -PRE RESTR NPA
                                       -- CURRENT STD AND PRE RESTR NPA
                                       = src.AddlProvPer;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN A.FinalAssetClassAlt_Key = 1
           AND NVL(PreRestructureAssetClassAlt_Key, 0) > 1 THEN NVL(PreRestructureNPA_Prov, 0) + 10
         ELSE 10
            END) AS AddlProvPer
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND D.ParameterShortNameEnum IN ( 'MSME_COVID_RF2' )
               ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.AddlProvPer -- CURRENT STD -PRE RESTR NPA
                                       = src.AddlProvPer;
         --UPDATE A SET
         --		AddlProvPer= (CASE WHEN ParameterShortNameEnum='MSME_COVID_RF2' THEN 10 ELSE 5 END )
         --					+(CASE WHEN  A.FinalAssetClassAlt_Key=1 AND isnull(PreRestructureAssetClassAlt_Key,0)>1 
         --							THEN isnull(PreRestructureNPA_Prov,0) 
         --						  WHEN  A.FinalAssetClassAlt_Key>1 
         --								THEN 0 --ppliedNormalProvPer
         --							ELSE 0 
         --						END)
         --FROM PRO.AdvAcRestructureCal A
         --INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey 
         --	AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key
         --	AND D.DimParameterName='TypeofRestructuring' 
         --	AND d.ParameterShortNameEnum IN('MSME_COVID','MSME_OLD','MSME_COVID_RF2')
         ---WHERE --DPD_Breach_Date IS NULL OR DPD_Breach_Date>SP_ExpiryDate
         --FinalAssetClassAlt_Key=1
         /* RELEASE */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, AddlProvPer
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND D.ParameterShortNameEnum IN ( 'MSME_COVID','MSME_OLD' )

          WHERE ( DPD_Breach_Date IS NULL
           AND SP_ExpiryDate < v_DATE )
           AND FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.ProvReleasePer = AddlProvPer;-----???
         ------/* MSME_COVID_RF2 */	
         ------UPDATE A SET
         ------		AddlProvPer=10 +isnull(AppliedNormalProvPer,0)
         ------FROM PRO.AdvAcRestructureCal A
         ------INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey 
         ------	AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key
         ------	AND D.DimParameterName='TypeofRestructuring' 
         ------	AND d.ParameterShortNameEnum IN('MSME_COVID_RF2')
         /* RELASE MSME_COVID_RF2 */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, AddlProvPer
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND D.ParameterShortNameEnum IN ( 'MSME_COVID_RF2' )

          WHERE ( DPD_Breach_Date IS NULL
           AND SP_ExpiryDate < v_DATE )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.ProvReleasePer = AddlProvPer;
         /* PRUDENTIAL */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 15
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND D.ParameterShortNameEnum IN ( 'PRUDENTIAL' )

          WHERE ( ( DPD_Breach_Date IS NOT NULL
           AND SP_ExpiryDate >= v_DATE )
           OR POS_10PerPaidDate IS NULL )
           AND FinalAssetClassAlt_Key > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.AddlProvPer = 15;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 5
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND D.ParameterShortNameEnum IN ( 'PRUDENTIAL' )

          WHERE SurvPeriodEndDate > v_DATE
           AND FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.AddlProvPer = 5;
         /* IRAC / OTHER */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 5
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN ADVACRESTRUCTUREDETAIL B   ON B.EffectiveFromTimeKey <= v_TimeKey
                AND B.EffectiveToTimeKey >= v_TimeKey
                AND A.AccountEntityId = B.AccountEntityId
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND D.ParameterShortNameEnum IN ( 'IRAC','OTHER' )

          WHERE FinalAssetClassAlt_Key = 1
           AND A.SurvPeriodEndDate IS NOT NULL
           AND A.SurvPeriodEndDate >= v_DATE) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.AddlProvPer = 5;
         --??? DCCO  CONDITION
         /* CALCULATE FINAL PROVISION PERCENTAGE */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (NVL(AddlProvPer, 0) - NVL(ProvReleasePer, 0)) - (CASE 
         WHEN ( NVL(D.ParameterShortNameEnum, ' ') = 'PRUDENTIAL'
           AND A.FinalAssetClassAlt_Key > 1 )
           OR ( NVL(D.ParameterShortNameEnum, ' ') IN ( 'MSME_COVID','MSME_OLD','MSME_COVID_RF2' )

           AND FinalAssetClassAlt_Key <> 1 ) THEN 0
         ELSE NVL(AppliedNormalProvPer, 0)
            END) AS FinalProvPer
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring' ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.FinalProvPer = src.FinalProvPer;
         --UPDATE A SET FinalProvPer=(isnull(AddlProvPer,0)-isnull(ProvReleasePer,0))-ISNULL(AppliedNormalProvPer,0)
         --	FROM pro.AdvAcRestructureCal A
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 100
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A 
          WHERE FinalProvPer >= 100) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET FinalProvPer = 100;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 0
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A 
          WHERE FinalProvPer <= 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET FinalProvPer = 0;
         /* FOR RESTR FACILITY - FITL  THEN NO PROVISION WILL COMPUTED - AS PEPR EMAIL DTD 23-09-2021 OBS POINT MO.17(LAS OBS) IN ATTACHED EXCEL FILE */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 0, 0, 0
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureFacilityTypeAlt_Key
                AND D.DimParameterName = 'RestructureFacility'
                AND D.ParameterShortNameEnum = 'FITL' ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.AddlProvPer = 0,
                                      D.ProvReleasePer = 0,
                                      D.FinalProvPer = 0;
         /*  CALCULATE RESTRUCTURE PROVISION */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SecuredAmt, 0) * NVL((FinalProvPer), 0) / 100 AS pos_2, NVL(B.UnSecuredAmt, 0) * NVL((FinalProvPer), 0) / 100 AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN tt_ACCOUNTCAL_59 B   ON A.AccountEntityId = B.AccountEntityID
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND NVL(D.ParameterShortNameEnum, ' ') <> 'MSME_OLD' ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SecuredProvision = pos_2,
                                      A.UnSecuredProvision = pos_3;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(SecuredProvision, 0) + NVL(UnSecuredProvision, 0) AS RestructureProvision
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RestructureProvision = src.RestructureProvision;
         /* IN CASE OF MSME OLD PROVISION CALCULATION ON CURRENT POS  */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(RestructureProvision, 0) + NVL(A.CurrentPOS, 0) * NVL((FinalProvPer), 0) / 100 AS RestructureProvision
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN tt_ACCOUNTCAL_59 B   ON A.AccountEntityId = B.AccountEntityID
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND NVL(D.ParameterShortNameEnum, ' ') = 'MSME_OLD' ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RestructureProvision = src.RestructureProvision;
         /* ADD RESTRUCTURE PROVIISION IN TOTAL PROVIISION */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(TotalProvision, 0) + NVL(RestructureProvision, 0) AS TotalProvision
         FROM A ,tt_ACCOUNTCAL_59 A
                JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal B   ON A.AccountEntityID = B.AccountEntityId ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.TotalProvision = src.TotalProvision;
         UPDATE tt_ACCOUNTCAL_59
            SET TOTALPROVISION = NetBalance
          WHERE  NVL(TOTALPROVISION, 0) > NetBalance
           AND NVL(NetBalance, 0) > 0;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N'
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_tIMEKEY
                AND D.EffectiveToTimeKey >= v_tIMEKEY
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND A.FlgDeg = 'Y' 
          WHERE D.DimParameterName = 'TypeofRestructuring'
           AND ParameterShortNameEnum NOT IN ( 'PRUDENTIAL','IRAC','OTHER' )
         ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgDeg = 'N';
         /* END OF RESTRUCTURE */
         /* PUI PROVISION WORK */
         /* PROVISION */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, b.FinalAssetClassAlt_Key
         FROM A ,PRO_RBL_MISDB_PROD.PUI_CAL A
                JOIN tt_ACCOUNTCAL_59 b   ON a.AccountEntityId = b.AccountEntityId ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (5 - NVL(p.ProvisionSecured, 0)) AS PUI_ProvPer
         FROM A ,PRO_RBL_MISDB_PROD.PUI_CAL A
                JOIN tt_ACCOUNTCAL_59 b   ON a.AccountEntityId = b.AccountEntityId
                LEFT JOIN DimProvision_SegStd p   ON ( p.EffectiveFromTimeKey <= v_TimeKey
                AND p.EffectiveToTimeKey >= v_TimeKey )
                AND P.ProvisionAlt_Key = b.ProvisionAlt_Key 
          WHERE RESTRUCTURING = 'Y'
           AND utils.dateadd('YY', 2, a.RestructureDate) >= v_DATE
           AND a.FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET b.PUI_ProvPer = src.PUI_ProvPer;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SecuredAmt, 0) * NVL((PUI_ProvPer), 0) / 100 AS pos_2, NVL(B.UnSecuredAmt, 0) * NVL((PUI_ProvPer), 0) / 100 AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.PUI_CAL A
                JOIN tt_ACCOUNTCAL_59 b   ON a.AccountEntityId = b.AccountEntityId 
          WHERE NVL(PUI_ProvPer, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SecuredProvision = pos_2,
                                      A.UnSecuredProvision = pos_3;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(TotalProvision, 0) + (NVL(b.SecuredProvision, 0) + NVL(b.UnSecuredProvision, 0)) AS TotalProvision
         FROM A ,tt_ACCOUNTCAL_59 A
                JOIN PRO_RBL_MISDB_PROD.PUI_CAL B   ON A.AccountEntityID = B.AccountEntityId 
          WHERE NVL(PUI_ProvPer, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.TotalProvision = src.TotalProvision;
         UPDATE tt_ACCOUNTCAL_59
            SET TOTALPROVISION = NetBalance
          WHERE  NVL(TOTALPROVISION, 0) > NetBalance
           AND NVL(NetBalance, 0) > 0;
         /* END OF PUI PROV WORK */
         IF utils.object_id('TEMPDB..tt_TOTALPROVCUST_11') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TOTALPROVCUST_11 ';
         END IF;
         DELETE FROM tt_TOTALPROVCUST_11;
         UTILS.IDENTITY_RESET('tt_TOTALPROVCUST_11');

         INSERT INTO tt_TOTALPROVCUST_11 ( 
         	SELECT CUSTOMERENTITYID ,
                 SUM(NVL(TOTALPROVISION, 0))  TOTALPROVISION  ,
                 SUM(NVL(BANKTOTALPROVISION, 0))  BANKTOTPROVISION  ,
                 SUM(NVL(RBITOTALPROVISION, 0))  RBITOTPROVISION  
         	  FROM tt_ACCOUNTCAL_59 
         	  GROUP BY CUSTOMERENTITYID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.TOTALPROVISION, B.BANKTOTPROVISION, B.RBITOTPROVISION
         FROM A ,tt_CUSTOMERCAL_58 A
                JOIN tt_TOTALPROVCUST_11 B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.TOTPROVISION = src.TOTALPROVISION,
                                      A.BANKTOTPROVISION = src.BANKTOTPROVISION,
                                      A.RBITOTPROVISION = src.RBITOTPROVISION;
         ------DELETE  FROM  CURDAT.AdvCustNPAdetail WHERE EffectiveFromTimeKey<=@TIMEKEY and EffectiveToTimeKey>=@TIMEKEY
         -----------------------------Added by Prashant as discussed with Jaydev and Amar Sir-----------------------------------------
         DELETE A
          WHERE ROWID IN 
         ( SELECT A.ROWID
           FROM tt_ACCOUNTCAL_59 a
                  JOIN ExceptionFinalStatusType b   ON a.CustomerAcID = b.ACID,
                A
          WHERE  b.EffectiveFromTimeKey <= v_TimeKey
                   AND b.EffectiveToTimeKey >= v_TimeKey
                   AND b.StatusType = 'Charge Off' );
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TOTALPROVCUST_11 ';
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

  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_29062024" TO "ADF_CDR_RBL_STGDB";
