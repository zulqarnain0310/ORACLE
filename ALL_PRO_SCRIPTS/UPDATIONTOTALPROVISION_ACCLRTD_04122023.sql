--------------------------------------------------------
--  DDL for Procedure UPDATIONTOTALPROVISION_ACCLRTD_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" /*==============================            
Author : TRILOKI KHANNA     
CREATE DATE : 27-11-2019            
MODIFY DATE : 27-11-2019           
DESCRIPTION : UPDATE TOTAL PROVISION            
--EXEC [pro].[UpdationTotalProvision] @TimeKey =25410              
=========================================*/
(
  v_TimeKey IN NUMBER DEFAULT 26388 ,
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
         --IF @ProcessType='MAINPROC'     
         --BEGIN    
         -- EXEC [PRO].[AcceleratedProvisionDataPrepare]   @TIMEKEY=@TIMEKEY , @BackDtdProcess='N'   
         --END    
         PRO_RBL_MISDB_PROD.AcceleratedProvisionDataProc(v_TimeKey => v_TIMEKEY) ;
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
         /* RESTRUCTURE PROV WORK */
         ----Select *   
         -- UPDATE A SET   
         --   A.FinalAssetClassAlt_Key=b.FinalAssetClassAlt_Key  
         --  ,A.InitialAssetClassAlt_Key=B.InitialAssetClassAlt_Key  
         --  ,A.AppliedNormalProvPer=CASE WHEN B.FinalAssetClassAlt_Key =1 THEN SP.ProvisionSecured  
         --            ELSE np.ProvisionSecured END  
         --  ,A.FinalNpaDt=b.FinalNpaDt  
         --  ,A.RestructureStage=A.RestructureStage  
         --        + (CASE WHEN  B.FinalAssetClassAlt_Key>1  and RIGHT(RestructureStage,3)='STD'  
         --          THEN '-NPA'  
         --         WHEN  B.FinalAssetClassAlt_Key=1  and RIGHT(RestructureStage,3)='NPA'  
         --          THEN '-STD'  
         --         ELSE ''  
         --          END)  
         --  ,A.UpgradeDate=CASE WHEN B.UpgDate IS NOT NULL THEN  B.UpgDate ELSE A.UpgradeDate END  
         --  ,A.SurvPeriodEndDate=CASE WHEN B.UpgDate IS NOT NULL THEN DATEADD(yy,1,b.UpgDate) ELSE A.SurvPeriodEndDate END  
         -- FROM [PRO].[AdvAcRestructureCal] A  
         --  INNER JOIN PRO.ACCOUNTCAL B ON A.AccountEntityId=B.AccountEntityId  
         --  LEFT JOIN DimProvision_SegStd SP  
         --   ON SP.EffectiveFromTimeKey<=@TimeKey AND SP.EffectiveToTimeKey>=@TimeKey  
         --   AND SP.ProvisionAlt_Key=B.ProvisionAlt_Key  
         --  LEFT JOIN DimProvision_Seg NP  
         --   ON NP.EffectiveFromTimeKey<=@TimeKey AND NP.EffectiveToTimeKey>=@TimeKey  
         --   AND NP.ProvisionAlt_Key=B.ProvisionAlt_Key  
         -- WHERE A.EffectiveFromTimeKey<=@TimeKey And A.EffectiveToTimeKey>=@TimeKey  
         -- UPDATE A SET  
         --  A.RestructureStage='STD-STD-NPA-STD'  
         -- FROM [PRO].[AdvAcRestructureCal] A  
         --  WHERE RestructureStage='STD-STD-NPA-STD-NPA-STD'  
         -- UPDATE A SET  
         --  A.RestructureStage='NPA-STD-NPA-STD'  
         -- FROM [PRO].[AdvAcRestructureCal] A  
         --  WHERE RestructureStage='NPA-STD-NPA-STD-NPA-STD'  
         -- /* 1- RESOLUTION FRAMEWORK - CALCUCATE PROV  */  
         --  UPDATE A SET  
         --    AddlProvPer=(CASE WHEN isnull(PreRestructureAssetClassAlt_Key,0)>1   
         --         THEN isnull(PreRestructureNPA_Prov,0)   
         --        ELSE 10   
         --       END)  
         --   FROM PRO.AdvAcRestructureCal A  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --   AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --   AND D.DimParameterName='TypeofRestructuring'   
         --   AND d.ParameterShortNameEnum IN('COVID_OTR_RF','COVID_OTR_RF_2')  
         --  WHERE FinalAssetClassAlt_Key =1    
         --  ---and RestructureStage in('NPA-STD','STD-STD')   
         --  UPDATE A SET  
         --    ProvReleasePer= CASE WHEN E.ParameterShortNameEnum='Personal'  
         --          THEN   
         --           CASE WHEN Res_POS_to_CurrentPOS_Per<=30   
         --            THEN AddlProvPer/2  
         --           ELSE   
         --            AddlProvPer  
         --           END  
         --         WHEN E.ParameterShortNameEnum='Other' --AND D.ParameterShortNameEnum ='COVID_OTR_RF'  
         --          and SP_ExpiryDate<@DATE  
         --          THEN  
         --           CASE WHEN Res_POS_to_CurrentPOS_Per<=30   
         --            THEN AddlProvPer/2  
         --           ELSE   
         --            AddlProvPer  
         --           END  
         --        END  
         --  FROM PRO.AdvAcRestructureCal A  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --   AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --   AND D.DimParameterName='TypeofRestructuring'   
         --   AND d.ParameterShortNameEnum IN('COVID_OTR_RF','COVID_OTR_RF_2')  
         --  INNER JOIN DimParameter E ON E.EffectiveFromTimeKey <=@timekey AND E.EffectiveToTimeKey>=@timekey   
         --    AND E.ParameterAlt_Key=A.COVID_OTR_CatgAlt_Key  
         --    AND E.DimParameterName='Covid - OTR Category'     
         --  WHERE FinalAssetClassAlt_Key =1    
         --  AND  ISNULL(Res_POS_to_CurrentPOS_Per,0)>=20   
         --  ---and RestructureStage in('NPA-STD','STD-STD')   
         --/* 1- MSME_OLD AND MSME_COVID FRAMEWORK  */  
         --  UPDATE A SET  
         --    AddlProvPer= (CASE WHEN  FinalAssetClassAlt_Key>1 -- CURRENT NPA  
         --           THEN  5  
         --           WHEN A.FinalAssetClassAlt_Key=1 AND isnull(PreRestructureAssetClassAlt_Key,0)>1  -- CURRENT STD -PRE RESTR NPA  
         --          THEN isnull(PreRestructureNPA_Prov,0)+5  
         --           WHEN  A.FinalAssetClassAlt_Key=1 AND isnull(PreRestructureAssetClassAlt_Key,0)=1  -- CURRENT STD AND PRE RESTR NPA  
         --          THEN (CASE WHEN FlgMorat ='Y' THEN 15 ELSE 5 END)  
         --        END)  
         --  FROM PRO.AdvAcRestructureCal A  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --   AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --   AND D.DimParameterName='TypeofRestructuring'   
         --   AND d.ParameterShortNameEnum IN('MSME_COVID','MSME_OLD')  
         --  UPDATE A SET  
         --    AddlProvPer= (CASE WHEN A.FinalAssetClassAlt_Key=1 AND isnull(PreRestructureAssetClassAlt_Key,0)>1  -- CURRENT STD -PRE RESTR NPA  
         --          THEN isnull(PreRestructureNPA_Prov,0)+10  
         --         ELSE  10   
         --        END)  
         --  FROM PRO.AdvAcRestructureCal A  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --   AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --   AND D.DimParameterName='TypeofRestructuring'   
         --   AND d.ParameterShortNameEnum IN('MSME_COVID_RF2')  
         --  --UPDATE A SET  
         --  --  AddlProvPer= (CASE WHEN ParameterShortNameEnum='MSME_COVID_RF2' THEN 10 ELSE 5 END )  
         --  --     +(CASE WHEN  A.FinalAssetClassAlt_Key=1 AND isnull(PreRestructureAssetClassAlt_Key,0)>1   
         --  --       THEN isnull(PreRestructureNPA_Prov,0)   
         --  --        WHEN  A.FinalAssetClassAlt_Key>1   
         --  --        THEN 0 --ppliedNormalProvPer  
         --  --       ELSE 0   
         --  --      END)  
         --  --FROM PRO.AdvAcRestructureCal A  
         --  --INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --  -- AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --  -- AND D.DimParameterName='TypeofRestructuring'   
         --  -- AND d.ParameterShortNameEnum IN('MSME_COVID','MSME_OLD','MSME_COVID_RF2')  
         --  ---WHERE --DPD_Breach_Date IS NULL OR DPD_Breach_Date>SP_ExpiryDate  
         --   --FinalAssetClassAlt_Key=1  
         -- /* RELEASE */  
         --  UPDATE A SET  
         --    ProvReleasePer=AddlProvPer  
         --  FROM PRO.AdvAcRestructureCal A  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --   AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --   AND D.DimParameterName='TypeofRestructuring'   
         --   AND d.ParameterShortNameEnum IN('MSME_COVID','MSME_OLD')  
         --  WHERE( DPD_Breach_Date IS NULL AND SP_ExpiryDate<@DATE)  
         --   AND FinalAssetClassAlt_Key=1 -----???  
         --  ------/* MSME_COVID_RF2 */   
         --  ------UPDATE A SET  
         --  ------  AddlProvPer=10 +isnull(AppliedNormalProvPer,0)  
         --  ------FROM PRO.AdvAcRestructureCal A  
         --  ------INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --  ------ AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --  ------ AND D.DimParameterName='TypeofRestructuring'   
         --  ------ AND d.ParameterShortNameEnum IN('MSME_COVID_RF2')  
         -- /* RELASE MSME_COVID_RF2 */   
         --  UPDATE A SET  
         --    ProvReleasePer=AddlProvPer  
         --  FROM PRO.AdvAcRestructureCal A  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --   AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --   AND D.DimParameterName='TypeofRestructuring'   
         --   AND d.ParameterShortNameEnum IN('MSME_COVID_RF2')  
         --  WHERE ( DPD_Breach_Date IS NULL AND SP_ExpiryDate<@DATE)  
         -- /* PRUDENTIAL */  
         --  UPDATE A SET  
         --    AddlProvPer=15  
         --  FROM PRO.AdvAcRestructureCal A  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --   AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --   AND D.DimParameterName='TypeofRestructuring'   
         --   AND d.ParameterShortNameEnum IN('PRUDENTIAL')  
         --  WHERE ((DPD_Breach_Date IS NOT NULL and SP_ExpiryDate>=@DATE) OR POS_10PerPaidDate IS NULL )  
         --   AND FinalAssetClassAlt_Key >1  
         --  UPDATE A SET  
         --    AddlProvPer=5  
         --  FROM PRO.AdvAcRestructureCal A  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --   AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --   AND D.DimParameterName='TypeofRestructuring'   
         --   AND d.ParameterShortNameEnum IN('PRUDENTIAL')  
         --  WHERE SurvPeriodEndDate>@DATE  
         --   AND FinalAssetClassAlt_Key =1  
         --/* IRAC / OTHER */  
         --  UPDATE A SET  
         --    AddlProvPer=5  
         --  FROM PRO.AdvAcRestructureCal A  
         --  INNER JOIN ADVACRESTRUCTUREDETAIL B  
         --   ON B.EffectiveFromTimeKey<=@TimeKey AND B.EffectiveToTimeKey>=@TimeKey  
         --   AND A.AccountEntityId =B.AccountEntityId  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --   AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --   AND D.DimParameterName='TypeofRestructuring'   
         --   AND d.ParameterShortNameEnum IN('IRAC','OTHER')  
         --  WHERE FinalAssetClassAlt_Key=1  
         --   AND A.SurvPeriodEndDate IS NOT NULL AND A.SurvPeriodEndDate>=@DATE  
         --   --??? DCCO  CONDITION  
         -- /* CALCULATE FINAL PROVISION PERCENTAGE */  
         -- UPDATE A SET FinalProvPer=(isnull(AddlProvPer,0)-isnull(ProvReleasePer,0))-  
         --    (CASE WHEN (ISNULL(D.ParameterShortNameEnum,'') ='PRUDENTIAL' AND A.FinalAssetClassAlt_Key>1 )  
         --      OR (ISNULL(D.ParameterShortNameEnum,'') IN('MSME_COVID','MSME_OLD','MSME_COVID_RF2') AND FinalAssetClassAlt_Key <>1 )  
         --       THEN 0  
         --      ELSE ISNULL(AppliedNormalProvPer,0)  
         --    END)  
         --  FROM pro.AdvAcRestructureCal A  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --  AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --  AND D.DimParameterName='TypeofRestructuring'   
         -- --UPDATE A SET FinalProvPer=(isnull(AddlProvPer,0)-isnull(ProvReleasePer,0))-ISNULL(AppliedNormalProvPer,0)  
         -- -- FROM pro.AdvAcRestructureCal A  
         --  UPDATE A SET FinalProvPer=100  
         --  FROM pro.AdvAcRestructureCal A WHERE FinalProvPer>=100  
         --  UPDATE A SET FinalProvPer=0  
         --  FROM pro.AdvAcRestructureCal A WHERE FinalProvPer<=0  
         --  /* FOR RESTR FACILITY - FITL  THEN NO PROVISION WILL COMPUTED - AS PEPR EMAIL DTD 23-09-2021 OBS POINT MO.17(LAS OBS) IN ATTACHED EXCEL FILE */  
         --  UPDATE A  
         --   SET A.AddlProvPer=0,ProvReleasePer =0,FinalProvPer =0  
         --  FROM pro.AdvAcRestructureCal A  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --  AND D.ParameterAlt_Key=A.RestructureFacilityTypeAlt_Key  
         --  AND D.DimParameterName='RestructureFacility'   
         --  and d.ParameterShortNameEnum='FITL'  
         -- /*  CALCULATE RESTRUCTURE PROVISION */  
         -- UPDATE A SET A.SecuredProvision=isnull(B.SecuredAmt,0)*isnull((FinalProvPer),0)/100   
         --    ,A.UnSecuredProvision=isnull(B.UnSecuredAmt,0)*isnull((FinalProvPer),0)/100   
         --  from pro.AdvAcRestructureCal A  
         --   inner join PRO.ACCOUNTCAL B  
         --    ON A.AccountEntityId=B.AccountEntityID  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --  AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --  and D.DimParameterName='TypeofRestructuring'   
         --  AND ISNULL(D.ParameterShortNameEnum,'')<>'MSME_OLD'   
         -- UPDATE A SET A.RestructureProvision=isnull(SecuredProvision,0)+isnull(UnSecuredProvision,0)  
         --  from pro.AdvAcRestructureCal A  
         --  /* IN CASE OF MSME OLD PROVISION CALCULATION ON CURRENT POS  */   
         -- UPDATE A SET A.RestructureProvision=ISNULL(RestructureProvision,0)+isnull(A.CurrentPOS,0)*isnull((FinalProvPer),0)/100   
         --  from pro.AdvAcRestructureCal A  
         --   inner join PRO.ACCOUNTCAL B  
         --    ON A.AccountEntityId=B.AccountEntityID  
         --  INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey   
         --  AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key  
         --  and D.DimParameterName='TypeofRestructuring'   
         --  AND ISNULL(D.ParameterShortNameEnum,'')='MSME_OLD'   
         /* ADD RESTRUCTURE PROVIISION IN TOTAL PROVIISION */
         -----------------Added 26092023 for Restructure Provision-------------------------------------------
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(TotalProvision, 0) + NVL(RestructureProvision, 0) AS TotalProvision
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist B   ON A.AccountEntityID = B.AccountEntityId
                AND B.EffectiveFromTimeKey <= v_TimeKey
                AND B.EffectiveToTimeKey >= v_TimeKey ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.TotalProvision = src.TotalProvision;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
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
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL b   ON a.AccountEntityId = b.AccountEntityID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (5 - NVL(p.ProvisionSecured, 0)) AS PUI_ProvPer
         FROM A ,PRO_RBL_MISDB_PROD.PUI_CAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL b   ON a.AccountEntityId = b.AccountEntityID
                LEFT JOIN DimProvision_SegStd p   ON ( p.EffectiveFromTimeKey <= v_TimeKey
                AND p.EffectiveToTimeKey >= v_TimeKey )
                AND P.ProvisionAlt_Key = b.ProvisionAlt_Key 
          WHERE RESTRUCTURING = 'Y'
           AND utils.dateadd('YY', 2, a.RestructureDate) >= v_DATE
           AND a.FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET PUI_ProvPer = src.PUI_ProvPer;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SecuredAmt, 0) * NVL((PUI_ProvPer), 0) / 100 AS pos_2, NVL(B.UnSecuredAmt, 0) * NVL((PUI_ProvPer), 0) / 100 AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.PUI_CAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL b   ON a.AccountEntityId = b.AccountEntityID 
          WHERE NVL(PUI_ProvPer, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SecuredProvision = pos_2,
                                      A.UnSecuredProvision = pos_3;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(TotalProvision, 0) + (NVL(b.SecuredProvision, 0) + NVL(b.UnSecuredProvision, 0)) AS TotalProvision
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.PUI_CAL B   ON A.AccountEntityID = B.AccountEntityId 
          WHERE NVL(PUI_ProvPer, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.TotalProvision = src.TotalProvision;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET TOTALPROVISION = NetBalance
          WHERE  NVL(TOTALPROVISION, 0) > NetBalance
           AND NVL(NetBalance, 0) > 0;
         /* END OF PUI PROV WORK */
         IF utils.object_id('TEMPDB..tt_TOTALPROVCUST_12') IS NOT NULL THEN
          ------DELETE  FROM  CURDAT.AdvCustNPAdetail WHERE EffectiveFromTimeKey<=@TIMEKEY and EffectiveToTimeKey>=@TIMEKEY  
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TOTALPROVCUST_12 ';
         END IF;
         DELETE FROM tt_TOTALPROVCUST_12;
         UTILS.IDENTITY_RESET('tt_TOTALPROVCUST_12');

         INSERT INTO tt_TOTALPROVCUST_12 ( 
         	SELECT CUSTOMERENTITYID ,
                 SUM(NVL(TOTALPROVISION, 0))  TOTALPROVISION  ,
                 SUM(NVL(BANKTOTALPROVISION, 0))  BANKTOTPROVISION  ,
                 SUM(NVL(RBITOTALPROVISION, 0))  RBITOTPROVISION  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
         	  GROUP BY CUSTOMERENTITYID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.TOTALPROVISION, B.BANKTOTPROVISION, B.RBITOTPROVISION
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_TOTALPROVCUST_12 B   ON A.CustomerEntityID = B.CUSTOMERENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.TOTPROVISION = src.TOTALPROVISION,
                                      A.BANKTOTPROVISION = src.BANKTOTPROVISION,
                                      A.RBITOTPROVISION = src.RBITOTPROVISION;
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TOTALPROVCUST_12 ';
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

  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATIONTOTALPROVISION_ACCLRTD_04122023" TO "ADF_CDR_RBL_STGDB";
