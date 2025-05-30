--------------------------------------------------------
--  DDL for Procedure INSERTDATAINTOHIST_TABLE_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" 
(
  v_TIMEKEY IN NUMBER
)
AS
   /* RESTRUCTURE DETAIL	*/
   IF  --SQLDEV: NOT RECOGNIZED
   IF tt_AdvAcRestructureDetail_5  --SQLDEV: NOT RECOGNIZED
   v_Procdate VARCHAR2(200) := ( SELECT DATE_ 
     FROM SysDayMatrix 
    WHERE  TIMEKEY = v_TIMEKEY );
   v_PrevTimeKey NUMBER(10,0) := ( SELECT MAX(EffectiveFromTimeKey)  
     FROM PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist 
    WHERE  EffectiveFromTimeKey < v_TIMEKEY );

BEGIN

   DELETE PRO_RBL_MISDB_PROD.CustomerCal_Hist

    WHERE  EffectiveFromTimeKey = v_TIMEKEY
             AND EffectiveToTimeKey = v_TIMEKEY;
   INSERT INTO PRO_RBL_MISDB_PROD.CustomerCal_Hist
     ( BranchCode, UCIF_ID, UcifEntityID, CustomerEntityID, ParentCustomerID, RefCustomerID, SourceSystemCustomerID, CustomerName, CustSegmentCode, ConstitutionAlt_Key, PANNO, AadharCardNO, SrcAssetClassAlt_Key, SysAssetClassAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SMA_Class_Key, PNPA_Class_Key, PrvQtrRV, CurntQtrRv, TotProvision, RBITotProvision, BankTotProvision, SrcNPA_Dt, SysNPA_Dt, DbtDt, DbtDt2, DbtDt3, LossDt, MOC_Dt, ErosionDt, SMA_Dt, PNPA_Dt, Asset_Norm, FlgDeg, FlgUpg, FlgMoc, FlgSMA, FlgProcessing, FlgErosion, FlgPNPA, FlgPercolation, FlgInMonth, FlgDirtyRow, DegDate, EffectiveFromTimeKey, EffectiveToTimeKey, CommonMocTypeAlt_Key, InMonthMark, MocStatusMark, SourceAlt_Key, BankAssetClass, Cust_Expo, MOCReason, AddlProvisionPer, FraudDt, FraudAmount, DegReason, CustMoveDescription, TotOsCust, MOCTYPE )
     ( SELECT BranchCode ,
              UCIF_ID ,
              UcifEntityID ,
              CustomerEntityID ,
              ParentCustomerID ,
              RefCustomerID ,
              SourceSystemCustomerID ,
              CustomerName ,
              CustSegmentCode ,
              ConstitutionAlt_Key ,
              PANNO ,
              AadharCardNO ,
              SrcAssetClassAlt_Key ,
              SysAssetClassAlt_Key ,
              SplCatg1Alt_Key ,
              SplCatg2Alt_Key ,
              SplCatg3Alt_Key ,
              SplCatg4Alt_Key ,
              SMA_Class_Key ,
              PNPA_Class_Key ,
              PrvQtrRV ,
              CurntQtrRv ,
              TotProvision ,
              RBITotProvision ,
              BankTotProvision ,
              SrcNPA_Dt ,
              SysNPA_Dt ,
              DbtDt ,
              DbtDt2 ,
              DbtDt3 ,
              LossDt ,
              MOC_Dt ,
              ErosionDt ,
              SMA_Dt ,
              PNPA_Dt ,
              Asset_Norm ,
              FlgDeg ,
              FlgUpg ,
              FlgMoc ,
              FlgSMA ,
              FlgProcessing ,
              FlgErosion ,
              FlgPNPA ,
              FlgPercolation ,
              FlgInMonth ,
              FlgDirtyRow ,
              DegDate ,
              EffectiveFromTimeKey ,
              EffectiveToTimeKey ,
              CommonMocTypeAlt_Key ,
              InMonthMark ,
              MocStatusMark ,
              SourceAlt_Key ,
              BankAssetClass ,
              Cust_Expo ,
              MOCReason ,
              AddlProvisionPer ,
              FraudDt ,
              FraudAmount ,
              DegReason ,
              CustMoveDescription ,
              TotOsCust ,
              MOCTYPE 
       FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL  );
   DELETE PRO_RBL_MISDB_PROD.AccountCal_Hist

    WHERE  EffectiveFromTimeKey = v_TIMEKEY
             AND EffectiveToTimeKey = v_TIMEKEY;
   INSERT INTO PRO_RBL_MISDB_PROD.AccountCal_Hist
     ( AccountEntityID, UcifEntityID, CustomerEntityID, CustomerAcID, RefCustomerID, SourceSystemCustomerID, UCIF_ID, BranchCode, FacilityType, AcOpenDt, FirstDtOfDisb, ProductAlt_Key, SchemeAlt_key, SubSectorAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SourceAlt_Key, ActSegmentCode, InttRate, Balance, BalanceInCrncy, CurrencyAlt_Key, DrawingPower, CurrentLimit, CurrentLimitDt, ContiExcessDt, StockStDt, DebitSinceDt, LastCrDate, InttServiced, IntNotServicedDt, OverdueAmt, OverDueSinceDt, ReviewDueDt, SecurityValue, DFVAmt, GovtGtyAmt, CoverGovGur, WriteOffAmount, UnAdjSubSidy, CreditsinceDt
   --,DPD_IntService
    --,DPD_NoCredit
    --,DPD_Overdrawn
    --,DPD_Overdue
    --,DPD_Renewal
    --,DPD_StockStmt
    --,DPD_Max
    --,DPD_FinMaxType
   , DegReason, Asset_Norm, REFPeriodMax, RefPeriodOverdue, RefPeriodOverDrawn, RefPeriodNoCredit, RefPeriodIntService, RefPeriodStkStatement, RefPeriodReview, NetBalance, ApprRV, SecuredAmt, UnSecuredAmt, ProvDFV, Provsecured, ProvUnsecured, ProvCoverGovGur, AddlProvision, TotalProvision, BankProvsecured, BankProvUnsecured, BankTotalProvision, RBIProvsecured, RBIProvUnsecured, RBITotalProvision, InitialNpaDt, FinalNpaDt, SMA_Dt, UpgDate, InitialAssetClassAlt_Key, FinalAssetClassAlt_Key, ProvisionAlt_Key, PNPA_Reason, SMA_Class, SMA_Reason, FlgMoc, MOC_Dt, CommonMocTypeAlt_Key
   --,DPD_SMA
   , FlgDeg, FlgDirtyRow, FlgInMonth, FlgSMA, FlgPNPA, FlgUpg, FlgFITL, FlgAbinitio, NPA_Days, RefPeriodOverdueUPG, RefPeriodOverDrawnUPG, RefPeriodNoCreditUPG, RefPeriodIntServiceUPG, RefPeriodStkStatementUPG, RefPeriodReviewUPG, EffectiveFromTimeKey, EffectiveToTimeKey, AppGovGur, UsedRV, ComputedClaim, UPG_RELAX_MSME, DEG_RELAX_MSME, PNPA_DATE, NPA_Reason, PnpaAssetClassAlt_key, DisbAmount, PrincOutStd, PrincOverdue, PrincOverdueSinceDt
   --,DPD_PrincOverdue
   , IntOverdue, IntOverdueSinceDt
   --,DPD_IntOverdueSince
   , OtherOverdue, OtherOverdueSinceDt
   --,DPD_OtherOverdueSince
   , RelationshipNumber, AccountFlag, CommercialFlag_AltKey, Liability, CD, AccountStatus, AccountBlkCode1, AccountBlkCode2, ExposureType, Mtm_Value, BankAssetClass, NpaType, SecApp, BorrowerTypeID, LineCode, ProvPerSecured, ProvPerUnSecured, MOCReason, AddlProvisionPer, FlgINFRA, RepossessionDate, DerecognisedInterest1, DerecognisedInterest2, ProductCode, FlgLCBG, UnserviedInt, PreQtrCredit, PrvQtrInt, CurQtrCredit, CurQtrInt, AdvanceRecovery, NotionalInttAmt, OriginalBranchcode, PrvAssetClassAlt_Key, MOCTYPE, FlgSecured )
     ( SELECT AccountEntityID ,
              UcifEntityID ,
              CustomerEntityID ,
              CustomerAcID ,
              RefCustomerID ,
              SourceSystemCustomerID ,
              UCIF_ID ,
              BranchCode ,
              FacilityType ,
              AcOpenDt ,
              FirstDtOfDisb ,
              ProductAlt_Key ,
              SchemeAlt_key ,
              SubSectorAlt_Key ,
              SplCatg1Alt_Key ,
              SplCatg2Alt_Key ,
              SplCatg3Alt_Key ,
              SplCatg4Alt_Key ,
              SourceAlt_Key ,
              ActSegmentCode ,
              InttRate ,
              Balance ,
              BalanceInCrncy ,
              CurrencyAlt_Key ,
              DrawingPower ,
              CurrentLimit ,
              CurrentLimitDt ,
              ContiExcessDt ,
              StockStDt ,
              DebitSinceDt ,
              LastCrDate ,
              InttServiced ,
              IntNotServicedDt ,
              OverdueAmt ,
              OverDueSinceDt ,
              ReviewDueDt ,
              SecurityValue ,
              DFVAmt ,
              GovtGtyAmt ,
              CoverGovGur ,
              WriteOffAmount ,
              UnAdjSubSidy ,
              CreditsinceDt ,
              --,DPD_IntService
              --,DPD_NoCredit
              --,DPD_Overdrawn
              --,DPD_Overdue
              --,DPD_Renewal
              --,DPD_StockStmt
              --,DPD_Max
              --,DPD_FinMaxType
              DegReason ,
              Asset_Norm ,
              REFPeriodMax ,
              RefPeriodOverdue ,
              RefPeriodOverDrawn ,
              RefPeriodNoCredit ,
              RefPeriodIntService ,
              RefPeriodStkStatement ,
              RefPeriodReview ,
              NetBalance ,
              ApprRV ,
              SecuredAmt ,
              UnSecuredAmt ,
              ProvDFV ,
              Provsecured ,
              ProvUnsecured ,
              ProvCoverGovGur ,
              AddlProvision ,
              TotalProvision ,
              BankProvsecured ,
              BankProvUnsecured ,
              BankTotalProvision ,
              RBIProvsecured ,
              RBIProvUnsecured ,
              RBITotalProvision ,
              InitialNpaDt ,
              FinalNpaDt ,
              SMA_Dt ,
              UpgDate ,
              InitialAssetClassAlt_Key ,
              FinalAssetClassAlt_Key ,
              ProvisionAlt_Key ,
              PNPA_Reason ,
              SMA_Class ,
              SMA_Reason ,
              FlgMoc ,
              MOC_Dt ,
              CommonMocTypeAlt_Key ,
              --,DPD_SMA
              FlgDeg ,
              FlgDirtyRow ,
              FlgInMonth ,
              FlgSMA ,
              FlgPNPA ,
              FlgUpg ,
              FlgFITL ,
              FlgAbinitio ,
              NPA_Days ,
              RefPeriodOverdueUPG ,
              RefPeriodOverDrawnUPG ,
              RefPeriodNoCreditUPG ,
              RefPeriodIntServiceUPG ,
              RefPeriodStkStatementUPG ,
              RefPeriodReviewUPG ,
              EffectiveFromTimeKey ,
              EffectiveToTimeKey ,
              AppGovGur ,
              UsedRV ,
              ComputedClaim ,
              UPG_RELAX_MSME ,
              DEG_RELAX_MSME ,
              PNPA_DATE ,
              NPA_Reason ,
              PnpaAssetClassAlt_key ,
              DisbAmount ,
              PrincOutStd ,
              PrincOverdue ,
              PrincOverdueSinceDt ,
              --,DPD_PrincOverdue
              IntOverdue ,
              IntOverdueSinceDt ,
              --,DPD_IntOverdueSince
              OtherOverdue ,
              OtherOverdueSinceDt ,
              --,DPD_OtherOverdueSince
              RelationshipNumber ,
              AccountFlag ,
              CommercialFlag_AltKey ,
              Liability ,
              CD ,
              AccountStatus ,
              AccountBlkCode1 ,
              AccountBlkCode2 ,
              ExposureType ,
              Mtm_Value ,
              BankAssetClass ,
              NpaType ,
              SecApp ,
              BorrowerTypeID ,
              LineCode ,
              ProvPerSecured ,
              ProvPerUnSecured ,
              MOCReason ,
              AddlProvisionPer ,
              FlgINFRA ,
              RepossessionDate ,
              DerecognisedInterest1 ,
              DerecognisedInterest2 ,
              ProductCode ,
              FlgLCBG ,
              UnserviedInt ,
              PreQtrCredit ,
              PrvQtrInt ,
              CurQtrCredit ,
              CurQtrInt ,
              AdvanceRecovery ,
              NotionalInttAmt ,
              OriginalBranchcode ,
              PrvAssetClassAlt_Key ,
              MOCTYPE ,
              FlgSecured 
       FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL  );
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_IntService 
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_NoCredit 
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_Overdrawn 
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_Overdue 
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_Renewal 
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_StockStmt 
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_Max  
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_FinMaxType 
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_SMA  
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_PrincOverdue 
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_IntOverdueSince 
   --ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_OtherOverdueSince 
   PRO_RBL_MISDB_PROD.CustAccountMerge() ;
   /* RESTRUCTURE WORK */
   DELETE PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist

    WHERE  EffectiveFromTimeKey = v_TIMEKEY
             AND EffectiveToTimeKey = v_TIMEKEY;
   INSERT INTO PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist
     ( AccountEntityId, AssetClassAlt_KeyOnInvocation, PreRestructureAssetClassAlt_Key, PreRestructureNPA_Date, ProvPerOnRestrucure, RestructureTypeAlt_Key, COVID_OTR_CatgAlt_Key, RestructureDt, SP_ExpiryDate, DPD_AsOnRestructure, RestructureFailureDate, DPD_Breach_Date, ZeroDPD_Date, SP_ExpiryExtendedDate, CurrentPOS, CurrentTOS, RestructurePOS, Res_POS_to_CurrentPOS_Per, CurrentDPD, TotalDPD, VDPD, AddlProvPer, ProvReleasePer, AppliedNormalProvPer, FinalProvPer, PreDegProvPer, UpgradeDate, SurvPeriodEndDate
   --------,DegDurSP_PeriodProvPer
   , NonFinDPD, InitialAssetClassAlt_Key, FinalAssetClassAlt_Key, RestructureProvision, SecuredProvision, UnSecuredProvision, FlgDeg, FlgUpg, DegDate, RC_Pending, FinalNpaDt, RestructureStage, EffectiveFromTimeKey, EffectiveToTimeKey, FlgMorat, InvestmentGrade, POS_10PerPaidDate, RestructureFacilityTypeAlt_Key )
     ( SELECT AccountEntityId ,
              AssetClassAlt_KeyOnInvocation ,
              PreRestructureAssetClassAlt_Key ,
              PreRestructureNPA_Date ,
              ProvPerOnRestrucure ,
              RestructureTypeAlt_Key ,
              COVID_OTR_CatgAlt_Key ,
              RestructureDt ,
              SP_ExpiryDate ,
              DPD_AsOnRestructure ,
              RestructureFailureDate ,
              DPD_Breach_Date ,
              ZeroDPD_Date ,
              SP_ExpiryExtendedDate ,
              CurrentPOS ,
              CurrentTOS ,
              RestructurePOS ,
              Res_POS_to_CurrentPOS_Per ,
              CurrentDPD ,
              TotalDPD ,
              VDPD ,
              AddlProvPer ,
              ProvReleasePer ,
              AppliedNormalProvPer ,
              FinalProvPer ,
              PreDegProvPer ,
              UpgradeDate ,
              SurvPeriodEndDate ,
              --------,DegDurSP_PeriodProvPer
              NonFinDPD ,
              InitialAssetClassAlt_Key ,
              FinalAssetClassAlt_Key ,
              RestructureProvision ,
              SecuredProvision ,
              UnSecuredProvision ,
              FlgDeg ,
              FlgUpg ,
              DegDate ,
              RC_Pending ,
              FinalNpaDt ,
              RestructureStage ,
              EffectiveFromTimeKey ,
              EffectiveToTimeKey ,
              FlgMorat ,
              InvestmentGrade ,
              POS_10PerPaidDate ,
              RestructureFacilityTypeAlt_Key 
       FROM PRO_RBL_MISDB_PROD.AdvAcRestructureCal  );
   DELETE FROM tt_AdvAcRestructureDetail_5;
   UTILS.IDENTITY_RESET('tt_AdvAcRestructureDetail_5');

   INSERT INTO tt_AdvAcRestructureDetail_5 ( 
   	SELECT * ,
           ' ' IsChanged  
   	  FROM AdvAcRestructureDetail 
   	 WHERE  EffectiveFromTimeKey <= v_TIMEKEY
              AND EffectiveToTimeKey >= v_TIMEKEY );
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, NVL(B.AppliedNormalProvPer, 0) + NVL(B.FinalProvPer, 0) AS PreDegProvPer
   FROM A ,tt_AdvAcRestructureDetail_5 A
          JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist B   ON A.AccountEntityId = B.AccountEntityId
          AND ( B.EffectiveFromTimeKey <= v_PrevTimeKey
          AND B.EffectiveToTimeKey >= v_PrevTimeKey )
          JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal C   ON A.AccountEntityId = C.AccountEntityId
          AND C.InitialAssetClassAlt_Key = 1
          AND C.FinalAssetClassAlt_Key > 1 ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.PreDegProvPer = src.PreDegProvPer;
   /* 1- UPDATE DPD_30_90_Breach_Date IN RESTRCTURE CAL - IF ACCOUNT IS NPA AND DPD >90,   UPDATE ZERO_DPD_DATE =NULL, SP_ExpiryExtendedDate = NULL */
   MERGE INTO a 
   USING (SELECT a.ROWID row_id, b.DPD_Breach_Date, b.ZeroDPD_Date, b.SP_ExpiryExtendedDate, B.RestructureStage, b.POS_10PerPaidDate, b.SurvPeriodEndDate, b.UpgradeDate
   FROM a ,tt_AdvAcRestructureDetail_5 a
          JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal b   ON a.AccountEntityId = b.AccountEntityId ) src
   ON ( a.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET a.DPD_Breach_Date = src.DPD_Breach_Date,
                                a.ZeroDPD_Date = src.ZeroDPD_Date,
                                a.SP_ExpiryExtendedDate = src.SP_ExpiryExtendedDate,
                                A.RestructureStage = src.RestructureStage,
                                A.POS_10PerPaidDate = src.POS_10PerPaidDate,
                                A.SurvPeriodEndDate = src.SurvPeriodEndDate,
                                A.UpgradeDate = src.UpgradeDate;
   /* MERGE DATA IN ADVACRESTRUCTURE DETAIL-IN CASE OF EFFECTIVEFROMTIKE IS LESS THAN @TIMEKEY*/
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, v_TIMEKEY - 1 AS pos_2, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'ACL-PROCESS' AS pos_4
   FROM O ,CurDat_RBL_MISDB_PROD.AdvAcRestructureDetail O
          JOIN tt_AdvAcRestructureDetail_5 T   ON O.AccountEntityID = T.AccountEntityID
          AND O.EffectiveToTimeKey = 49999
          AND T.EffectiveToTimeKey = 49999
          AND O.EffectiveFromTimeKey < v_TIMEKEY 
    WHERE ( NVL(O.RestructureStage, '1990-01-01') <> NVL(T.RestructureStage, '1990-01-01')
     OR NVL(O.ZeroDPD_Date, '1990-01-01') <> NVL(T.ZeroDPD_Date, '1990-01-01')
     OR NVL(O.SP_ExpiryExtendedDate, '1990-01-01') <> NVL(T.SP_ExpiryExtendedDate, '1990-01-01')
     OR NVL(O.DPD_Breach_Date, '1990-01-01') <> NVL(T.DPD_Breach_Date, '1990-01-01')
     OR NVL(O.UpgradeDate, '1990-01-01') <> NVL(T.UpgradeDate, '1990-01-01')
     OR NVL(O.POS_10PerPaidDate, '1990-01-01') <> NVL(T.POS_10PerPaidDate, '1990-01-01')
     OR NVL(O.SurvPeriodEndDate, '1990-01-01') <> NVL(T.SurvPeriodEndDate, '1990-01-01')
     OR NVL(O.RestructureStage, ' ') <> NVL(T.RestructureStage, ' ')
     OR NVL(O.PreDegProvPer, 0) <> NVL(T.PreDegProvPer, 0) )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = pos_2,
                                O.DateModified = pos_3,
                                O.ModifiedBy = pos_4;
   /* UPODATE DATA FOR SAME TIMEKEY */
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.RestructureStage, B.ZeroDPD_Date, B.SP_ExpiryExtendedDate, B.DPD_Breach_Date, B.UpgradeDate, B.SurvPeriodEndDate, B.POS_10PerPaidDate, B.PreDegProvPer
   FROM A ,CurDat_RBL_MISDB_PROD.AdvAcRestructureDetail A
          JOIN tt_AdvAcRestructureDetail_5 B   ON A.AccountEntityId = B.AccountEntityId
          AND A.EffectiveFromTimeKey <= v_TIMEKEY
          AND A.EffectiveToTimeKey >= v_TIMEKEY
          AND A.EffectiveFromTimeKey = v_TIMEKEY ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.RestructureStage = src.RestructureStage,
                                A.ZeroDPD_Date = src.ZeroDPD_Date,
                                A.SP_ExpiryExtendedDate = src.SP_ExpiryExtendedDate,
                                A.DPD_Breach_Date = src.DPD_Breach_Date,
                                A.UpgradeDate = src.UpgradeDate,
                                A.SurvPeriodEndDate = src.SurvPeriodEndDate,
                                A.POS_10PerPaidDate = src.POS_10PerPaidDate,
                                A.PreDegProvPer = src.PreDegProvPer;
   ----------For Changes Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'C'
   FROM A ,tt_AdvAcRestructureDetail_5 A
          JOIN CurDat_RBL_MISDB_PROD.AdvAcRestructureDetail B   ON B.AccountEntityId = A.AccountEntityId 
    WHERE B.EffectiveToTimeKey = v_TIMEKEY - 1
     AND B.ModifiedBy = 'ACL-PROCESS') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged
                                ----Select * 
                                 = 'C';
   /***************************************************************************************************************/
   INSERT INTO CurDat_RBL_MISDB_PROD.AdvAcRestructureDetail
     ( AccountEntityId, RestructureTypeAlt_Key, RestructureProposalDt, RestructureDt, RestructureAmt, RestructureApprovalDt, RestructureSequenceRefNo, DiminutionAmount, RestructureByAlt_Key, RefCustomerId, RefSystemAcId, SDR_INVOKED, SDR_REFER_DATE, Remark, RestructureFacilityTypeAlt_Key, BankingRelationTypeAlt_Key, InvocationDate, AssetClassAlt_KeyOnInvocation, EquityConversionYN, ConversionDate, PrincRepayStartDate, InttRepayStartDate, PreRestructureAssetClassAlt_Key, PreRestructureNPA_Date, ProvPerOnRestrucure, COVID_OTR_CatgAlt_Key, RestructureApprovingAuthority, RestructreTOS, UnserviceInttAsOnRestructure, RestructurePOS, RestructureStage, RestructureStatus, DPD_AsOnRestructure, DPD_Breach_Date, ZeroDPD_Date, SurvPeriodEndDate, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, RestructureFailureDate, UpgradeDate, PreDegProvPer, SP_ExpiryExtendedDate, FlgMorat, InvestmentGrade, POS_10PerPaidDate )
     ( SELECT AccountEntityId ,
              RestructureTypeAlt_Key ,
              RestructureProposalDt ,
              RestructureDt ,
              RestructureAmt ,
              RestructureApprovalDt ,
              RestructureSequenceRefNo ,
              DiminutionAmount ,
              RestructureByAlt_Key ,
              RefCustomerId ,
              RefSystemAcId ,
              SDR_INVOKED ,
              SDR_REFER_DATE ,
              Remark ,
              RestructureFacilityTypeAlt_Key ,
              BankingRelationTypeAlt_Key ,
              InvocationDate ,
              AssetClassAlt_KeyOnInvocation ,
              EquityConversionYN ,
              ConversionDate ,
              PrincRepayStartDate ,
              InttRepayStartDate ,
              PreRestructureAssetClassAlt_Key ,
              PreRestructureNPA_Date ,
              ProvPerOnRestrucure ,
              COVID_OTR_CatgAlt_Key ,
              RestructureApprovingAuthority ,
              RestructreTOS ,
              UnserviceInttAsOnRestructure ,
              RestructurePOS ,
              RestructureStage ,
              RestructureStatus ,
              DPD_AsOnRestructure ,
              DPD_Breach_Date ,
              ZeroDPD_Date ,
              SurvPeriodEndDate ,
              AuthorisationStatus ,
              v_TIMEKEY EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              CreatedBy ,
              DateCreated ,
              'ACL-PROCESS' ModifiedBy  ,
              SYSDATE DateModified  ,
              ApprovedBy ,
              DateApproved ,
              RestructureFailureDate ,
              UpgradeDate ,
              PreDegProvPer ,
              SP_ExpiryExtendedDate ,
              FlgMorat ,
              InvestmentGrade ,
              POS_10PerPaidDate 
       FROM tt_AdvAcRestructureDetail_5 T
        WHERE  NVL(T.IsChanged, 'U') = 'C' );
   /* END OF RESTR */
   UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
      SET COMPLETED = 'Y',
          ERRORDATE = NULL,
          ERRORDESCRIPTION = NULL,
          COUNT = NVL(COUNT, 0) + 1
    WHERE  RUNNINGPROCESSNAME = 'InsertDataIntoHistTable';

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_04122023" TO "ADF_CDR_RBL_STGDB";
