--------------------------------------------------------
--  DDL for Procedure DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" 
--===============================================================================================
 -- Created by       : Triloki Khanna
 -- Created Date     : 30-Jul-2020
 -- Description      : 
 -- Form/Report Name :	For insert data in Premoc customer and account table for moc timekey 
 --						(only once - if processe execute more than once then only first time 
 --						will be insert data in premoc) 
 --===============================================================================================
 --===============================================================================================
 --===============================  ALTER HISTORY ================================================
 --===============================================================================================
 --       Name             Date                    Reason                       Change
 -- 1.  
 -- 2.  
 -- 3.  
 --===============================================================================================
 /*
  Hard Coded Fields Description: 
                                  Feild Name              Value             Significance
                               1. 
                               2. 
                               3. 


*/
-- 

(
  v_TimeKey IN NUMBER
)
AS
   v_cursor SYS_REFCURSOR;
---DECLARE @TimeKey INT=25992

BEGIN

   BEGIN

      BEGIN
         INSERT INTO PreMoc_RBL_MISDB_PROD.ACCOUNTCAL
           ( AccountEntityID, UcifEntityID, CustomerEntityID, CustomerAcID, RefCustomerID, SourceSystemCustomerID, UCIF_ID, BranchCode, FacilityType, AcOpenDt, FirstDtOfDisb, ProductAlt_Key, SchemeAlt_key, SubSectorAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SourceAlt_Key, ActSegmentCode, InttRate, Balance, BalanceInCrncy, CurrencyAlt_Key, DrawingPower, CurrentLimit, CurrentLimitDt, ContiExcessDt, StockStDt, DebitSinceDt, LastCrDate, PreQtrCredit, PrvQtrInt, CurQtrCredit, CurQtrInt, InttServiced, IntNotServicedDt, OverdueAmt, OverDueSinceDt, ReviewDueDt, SecurityValue, DFVAmt, GovtGtyAmt, CoverGovGur, WriteOffAmount, UnAdjSubSidy, CreditsinceDt
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
         , RelationshipNumber, AccountFlag, CommercialFlag_AltKey, Liability, CD, AccountStatus, AccountBlkCode1, AccountBlkCode2, ExposureType, Mtm_Value, BankAssetClass, NpaType, SecApp, BorrowerTypeID, LineCode, ProvPerSecured, ProvPerUnSecured, MOCReason, AddlProvisionPer, FlgINFRA, RepossessionDate, DerecognisedInterest1, DerecognisedInterest2, ProductCode, FlgLCBG, unserviedint, AdvanceRecovery, NotionalInttAmt, OriginalBranchcode, PrvAssetClassAlt_Key, MOCTYPE, FlgSecured, RePossession, RCPending, PaymentPending, WheelCase, CustomerLevelMaxPer, FinalProvisionPer, IsIBPC, IsSecuritised, RFA, IsNonCooperative, Sarfaesi, WeakAccount, PUI, FlgRestructure, RestructureDate, WeakAccountDate, SarfaesiDate, FlgUnusualBounce, UnusualBounceDate, FlgUnClearedEffect, UnClearedEffectDate, FlgFraud, FraudDate )
           ( SELECT AcCal.AccountEntityID ,
                    AcCal.UcifEntityID ,
                    AcCal.CustomerEntityID ,
                    AcCal.CustomerAcID ,
                    AcCal.RefCustomerID ,
                    AcCal.SourceSystemCustomerID ,
                    AcCal.UCIF_ID ,
                    AcCal.BranchCode ,
                    AcCal.FacilityType ,
                    AcCal.AcOpenDt ,
                    AcCal.FirstDtOfDisb ,
                    AcCal.ProductAlt_Key ,
                    AcCal.SchemeAlt_key ,
                    AcCal.SubSectorAlt_Key ,
                    AcCal.SplCatg1Alt_Key ,
                    AcCal.SplCatg2Alt_Key ,
                    AcCal.SplCatg3Alt_Key ,
                    AcCal.SplCatg4Alt_Key ,
                    AcCal.SourceAlt_Key ,
                    AcCal.ActSegmentCode ,
                    AcCal.InttRate ,
                    AcCal.Balance ,
                    AcCal.BalanceInCrncy ,
                    AcCal.CurrencyAlt_Key ,
                    AcCal.DrawingPower ,
                    AcCal.CurrentLimit ,
                    AcCal.CurrentLimitDt ,
                    AcCal.ContiExcessDt ,
                    AcCal.StockStDt ,
                    AcCal.DebitSinceDt ,
                    AcCal.LastCrDate ,
                    AcCal.PreQtrCredit ,
                    AcCal.PrvQtrInt ,
                    AcCal.CurQtrCredit ,
                    AcCal.CurQtrInt ,
                    AcCal.InttServiced ,
                    AcCal.IntNotServicedDt ,
                    AcCal.OverdueAmt ,
                    AcCal.OverDueSinceDt ,
                    AcCal.ReviewDueDt ,
                    AcCal.SecurityValue ,
                    AcCal.DFVAmt ,
                    AcCal.GovtGtyAmt ,
                    AcCal.CoverGovGur ,
                    AcCal.WriteOffAmount ,
                    AcCal.UnAdjSubSidy ,
                    AcCal.CreditsinceDt ,
                    --,AcCal.DPD_IntService
                    --,AcCal.DPD_NoCredit
                    ----,AcCal.DPD_Overdrawn
                    --,AcCal.DPD_Overdue
                    --,AcCal.DPD_Renewal
                    --,AcCal.DPD_StockStmt
                    --,AcCal.DPD_Max
                    --,AcCal.DPD_FinMaxType
                    AcCal.DegReason ,
                    AcCal.Asset_Norm ,
                    AcCal.REFPeriodMax ,
                    AcCal.RefPeriodOverdue ,
                    AcCal.RefPeriodOverDrawn ,
                    AcCal.RefPeriodNoCredit ,
                    AcCal.RefPeriodIntService ,
                    AcCal.RefPeriodStkStatement ,
                    AcCal.RefPeriodReview ,
                    AcCal.NetBalance ,
                    AcCal.ApprRV ,
                    AcCal.SecuredAmt ,
                    AcCal.UnSecuredAmt ,
                    AcCal.ProvDFV ,
                    AcCal.Provsecured ,
                    AcCal.ProvUnsecured ,
                    AcCal.ProvCoverGovGur ,
                    AcCal.AddlProvision ,
                    AcCal.TotalProvision ,
                    AcCal.BankProvsecured ,
                    AcCal.BankProvUnsecured ,
                    AcCal.BankTotalProvision ,
                    AcCal.RBIProvsecured ,
                    AcCal.RBIProvUnsecured ,
                    AcCal.RBITotalProvision ,
                    AcCal.InitialNpaDt ,
                    AcCal.FinalNpaDt ,
                    AcCal.SMA_Dt ,
                    AcCal.UpgDate ,
                    AcCal.InitialAssetClassAlt_Key ,
                    AcCal.FinalAssetClassAlt_Key ,
                    AcCal.ProvisionAlt_Key ,
                    AcCal.PNPA_Reason ,
                    AcCal.SMA_Class ,
                    AcCal.SMA_Reason ,
                    AcCal.FlgMoc ,
                    AcCal.MOC_Dt ,
                    AcCal.CommonMocTypeAlt_Key ,
                    --,AcCal.DPD_SMA
                    AcCal.FlgDeg ,
                    AcCal.FlgDirtyRow ,
                    AcCal.FlgInMonth ,
                    AcCal.FlgSMA ,
                    AcCal.FlgPNPA ,
                    AcCal.FlgUpg ,
                    AcCal.FlgFITL ,
                    AcCal.FlgAbinitio ,
                    AcCal.NPA_Days ,
                    AcCal.RefPeriodOverdueUPG ,
                    AcCal.RefPeriodOverDrawnUPG ,
                    AcCal.RefPeriodNoCreditUPG ,
                    AcCal.RefPeriodIntServiceUPG ,
                    AcCal.RefPeriodStkStatementUPG ,
                    AcCal.RefPeriodReviewUPG ,
                    v_TimeKey EffectiveFromTimeKey  ,
                    v_TimeKey EffectiveToTimeKey  ,
                    AcCal.AppGovGur ,
                    AcCal.UsedRV ,
                    AcCal.ComputedClaim ,
                    AcCal.UPG_RELAX_MSME ,
                    AcCal.DEG_RELAX_MSME ,
                    AcCal.PNPA_DATE ,
                    AcCal.NPA_Reason ,
                    AcCal.PnpaAssetClassAlt_key ,
                    AcCal.DisbAmount ,
                    AcCal.PrincOutStd ,
                    AcCal.PrincOverdue ,
                    AcCal.PrincOverdueSinceDt ,
                    --,AcCal.DPD_PrincOverdue
                    AcCal.IntOverdue ,
                    AcCal.IntOverdueSinceDt ,
                    --,AcCal.DPD_IntOverdueSince
                    AcCal.OtherOverdue ,
                    AcCal.OtherOverdueSinceDt ,
                    --,AcCal.DPD_OtherOverdueSince
                    AcCal.RelationshipNumber ,
                    AcCal.AccountFlag ,
                    AcCal.CommercialFlag_AltKey ,
                    AcCal.Liability ,
                    AcCal.CD ,
                    AcCal.AccountStatus ,
                    AcCal.AccountBlkCode1 ,
                    AcCal.AccountBlkCode2 ,
                    AcCal.ExposureType ,
                    AcCal.Mtm_Value ,
                    AcCal.BankAssetClass ,
                    AcCal.NpaType ,
                    AcCal.SecApp ,
                    AcCal.BorrowerTypeID ,
                    AcCal.LineCode ,
                    AcCal.ProvPerSecured ,
                    AcCal.ProvPerUnSecured ,
                    AcCal.MOCReason ,
                    AcCal.AddlProvisionPer ,
                    AcCal.FlgINFRA ,
                    AcCal.RepossessionDate ,
                    AcCal.DerecognisedInterest1 ,
                    AcCal.DerecognisedInterest2 ,
                    AcCal.ProductCode ,
                    AcCal.FlgLCBG ,
                    AcCal.unserviedint ,
                    AcCal.AdvanceRecovery ,
                    AcCal.NotionalInttAmt ,
                    AcCal.OriginalBranchcode ,
                    AcCal.PrvAssetClassAlt_Key ,
                    AcCal.MOCTYPE ,
                    ACCAL.FlgSecured ,
                    ACCAL.RePossession ,
                    ACCAL.RCPending ,
                    ACCAL.PaymentPending ,
                    ACCAL.WheelCase ,
                    ACCAL.CustomerLevelMaxPer ,
                    ACCAL.FinalProvisionPer ,
                    ACCAL.IsIBPC ,
                    ACCAL.IsSecuritised ,
                    ACCAL.RFA ,
                    ACCAL.IsNonCooperative ,
                    ACCAL.Sarfaesi ,
                    ACCAL.WeakAccount ,
                    ACCAL.PUI ,
                    ACCAL.FlgRestructure ,
                    ACCAL.RestructureDate ,
                    ACCAL.WeakAccountDate ,
                    ACCAL.SarfaesiDate ,
                    ACCAL.FlgUnusualBounce ,
                    ACCAL.UnusualBounceDate ,
                    ACCAL.FlgUnClearedEffect ,
                    ACCAL.UnClearedEffectDate ,
                    ACCAL.FlgFraud ,
                    ACCAL.FraudDate 
             FROM PRO_RBL_MISDB_PROD.AccountCal_Hist AcCal
                    JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL AcCurnt   ON AcCal.EffectiveFromTimeKey <= v_TimeKey
                    AND AcCal.EffectiveToTimeKey >= v_TimeKey
                    AND AcCal.AccountEntityID = AcCurnt.AccountEntityID
              WHERE  NOT EXISTS ( SELECT 1 Expr1  
                                  FROM PreMoc_RBL_MISDB_PROD.ACCOUNTCAL 
                                   WHERE  ( AccountEntityID = AcCal.AccountEntityID )
                                            AND ( EffectiveFromTimeKey <= v_TimeKey )
                                            AND ( EffectiveToTimeKey >= v_TimeKey ) ) );
         ---=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=INSERT DATA IN PREMOC CUSTOMERCALCAL-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
         INSERT INTO PreMoc_RBL_MISDB_PROD.CUSTOMERCAL
           ( BranchCode, UCIF_ID, UcifEntityID, CustomerEntityID, ParentCustomerID, RefCustomerID, SourceSystemCustomerID, CustomerName, CustSegmentCode, ConstitutionAlt_Key, PANNO, AadharCardNO, SrcAssetClassAlt_Key, SysAssetClassAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SMA_Class_Key, PNPA_Class_Key, PrvQtrRV, CurntQtrRv, TotProvision, RBITotProvision, BankTotProvision, SrcNPA_Dt, SysNPA_Dt, DbtDt, DbtDt2, DbtDt3, LossDt, MOC_Dt, ErosionDt, SMA_Dt, PNPA_Dt, Asset_Norm, FlgDeg, FlgUpg, FlgMoc, FlgSMA, FlgProcessing, FlgErosion, FlgPNPA, FlgPercolation, FlgInMonth, FlgDirtyRow, DegDate, EffectiveFromTimeKey, EffectiveToTimeKey, CommonMocTypeAlt_Key, InMonthMark, MocStatusMark, SourceAlt_Key, BankAssetClass, Cust_Expo, MOCReason, AddlProvisionPer, FraudDt, FraudAmount, DegReason, CustMoveDescription, TotOsCust, MOCTYPE )
           ( SELECT CustCal.BranchCode ,
                    CustCal.UCIF_ID ,
                    CustCal.UcifEntityID ,
                    CustCal.CustomerEntityID ,
                    CustCal.ParentCustomerID ,
                    CustCal.RefCustomerID ,
                    CustCal.SourceSystemCustomerID ,
                    CustCal.CustomerName ,
                    CustCal.CustSegmentCode ,
                    CustCal.ConstitutionAlt_Key ,
                    CustCal.PANNO ,
                    CustCal.AadharCardNO ,
                    CustCal.SrcAssetClassAlt_Key ,
                    CustCal.SysAssetClassAlt_Key ,
                    CustCal.SplCatg1Alt_Key ,
                    CustCal.SplCatg2Alt_Key ,
                    CustCal.SplCatg3Alt_Key ,
                    CustCal.SplCatg4Alt_Key ,
                    CustCal.SMA_Class_Key ,
                    CustCal.PNPA_Class_Key ,
                    CustCal.PrvQtrRV ,
                    CustCal.CurntQtrRv ,
                    CustCal.TotProvision ,
                    CustCal.RBITotProvision ,
                    CustCal.BankTotProvision ,
                    CustCal.SrcNPA_Dt ,
                    CustCal.SysNPA_Dt ,
                    CustCal.DbtDt ,
                    CustCal.DbtDt2 ,
                    CustCal.DbtDt3 ,
                    CustCal.LossDt ,
                    CustCal.MOC_Dt ,
                    CustCal.ErosionDt ,
                    CustCal.SMA_Dt ,
                    CustCal.PNPA_Dt ,
                    CustCal.Asset_Norm ,
                    CustCal.FlgDeg ,
                    CustCal.FlgUpg ,
                    CustCal.FlgMoc ,
                    CustCal.FlgSMA ,
                    CustCal.FlgProcessing ,
                    CustCal.FlgErosion ,
                    CustCal.FlgPNPA ,
                    CustCal.FlgPercolation ,
                    CustCal.FlgInMonth ,
                    CustCal.FlgDirtyRow ,
                    CustCal.DegDate ,
                    v_TimeKey EffectiveFromTimeKey  ,
                    v_TimeKey EffectiveToTimeKey  ,
                    CustCal.CommonMocTypeAlt_Key ,
                    CustCal.InMonthMark ,
                    CustCal.MocStatusMark ,
                    CustCal.SourceAlt_Key ,
                    CustCal.BankAssetClass ,
                    CustCal.Cust_Expo ,
                    CustCal.MOCReason ,
                    CustCal.AddlProvisionPer ,
                    CustCal.FraudDt ,
                    CustCal.FraudAmount ,
                    CustCal.DegReason ,
                    CustCal.CustMoveDescription ,
                    CustCal.TotOsCust ,
                    CustCal.MOCTYPE 
             FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist CustCal
                    JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL CustCurnt   ON CustCal.EffectiveFromTimeKey <= v_TimeKey
                    AND CustCal.EffectiveToTimeKey >= v_TimeKey
                    AND CustCal.CustomerEntityID = CustCurnt.CustomerEntityID
              WHERE  NOT EXISTS ( SELECT 1 Expr1  
                                  FROM PreMoc_RBL_MISDB_PROD.CUSTOMERCAL 
                                   WHERE  ( CustomerEntityID = CustCal.CustomerEntityID )
                                            AND ( EffectiveFromTimeKey <= v_TimeKey )
                                            AND ( EffectiveToTimeKey >= v_TimeKey ) ) );

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      /*

      INSERT INTO [PreMoc].[ADVACCAL] 
      						(
      AccountEntityID
      ,CustomerEntityID
      ,CustomerAcID
      ,RefSystemACID
      ,RefCustomerID
      ,BranchCode
      ,SecurityValue
      ,DFVAmt
      ,OthAdjRec
      ,GovtGtyAmt
      ,CoverGovGur
      ,UnAdjSubSidy
      ,MarginAmt
      --,DPD_IntService
      --,DPD_NoCredit
      --,DPD_Overdrawn
      --,DPD_Overdue
      --,DPD_Renewal
      --,DPD_StockStmt
      --,DPD_Max
      ,NetBalance
      ,ApprRV
      ,SecuredAmt
      ,UnSecuredAmt
      ,ProvDFV
      ,Provsecured
      ,ProvUnsecured
      ,ProvCoverGovGur
      ,TotalProvision
      ,AddlProvision
      ,SMA_Dt
      ,UpgDate
      ,DegReason
      ,Asset_Norm
      ,ExposureAmt
      ,PNPA_Reason
      ,ProvisionAlt_Key
      ,PrvAssetClassAlt_Key
      ,RefPeriodOverdue
      ,RefPeriodOverDrawn
      ,RefPeriodNoCredit
      ,RefPeriodIntService
      ,RefPeriodStkStatement
      ,RefPeriodReview
      ,SMA_Class
      ,SMA_Reason
      ,SourceAlt_Key
      ,FlgDeg
      ,FlgDirtyRow
      ,FlgInMonth
      ,FlgSMA
      ,FlgPNPA
      ,FlgUpg
      --,DPD_FinMaxType
      ,REFPeriodMax
      ,FinalNpaDt
      ,FlgFITL
      ,FlgAbinitio
      ,FinalAssetClassAlt_Key
      ,NPA_Days
      --,RuleAlt_Key_IntService
      --,RuleAlt_Key_NoCredit
      --,RuleAlt_Key_Overdrawn
      --,RuleAlt_Key_Overdue
      --,RuleAlt_Key_Renewal
      --,RuleAlt_Key_StockStmt
      ,RefPeriodOverdueUPG
      ,RefPeriodOverDrawnUPG
      ,RefPeriodNoCreditUPG
      ,RefPeriodIntServiceUPG
      ,RefPeriodStkStatementUPG
      ,RefPeriodReviewUPG
      ,CommonMocTypeAlt_Key
      ,EffectiveFromTimeKey
      ,EffectiveToTimeKey
      ,FlgMoc
      ,MOC_Dt
      )
      					SELECT      

       accal.AccountEntityID
      ,accal.CustomerEntityID
      ,accal.CustomerAcID
      ,accal.CustomerAcID as RefSystemACID
      ,accal.RefCustomerID
      ,accal.BranchCode
      ,accal.SecurityValue
      ,accal.DFVAmt
      ,0 as OthAdjRec
      ,accal.GovtGtyAmt
      ,accal.CoverGovGur
      ,accal.UnAdjSubSidy
      ,0 as MarginAmt
      --,accal.DPD_IntService
      --,accal.DPD_NoCredit
      --,accal.DPD_Overdrawn
      --,accal.DPD_Overdue
      --,accal.DPD_Renewal
      --,accal.DPD_StockStmt
      --,accal.DPD_Max
      ,accal.NetBalance
      ,accal.ApprRV
      ,accal.SecuredAmt
      ,accal.UnSecuredAmt
      ,accal.ProvDFV
      ,accal.Provsecured
      ,accal.ProvUnsecured
      ,accal.ProvCoverGovGur
      ,accal.TotalProvision
      ,accal.AddlProvision
      ,accal.SMA_Dt
      ,accal.UpgDate
      ,accal.DegReason
      ,accal.Asset_Norm
      ,0 as ExposureAmt
      ,accal.PNPA_Reason
      ,accal.ProvisionAlt_Key
      ,null  as PrvAssetClassAlt_Key
      ,accal.RefPeriodOverdue
      ,accal.RefPeriodOverDrawn
      ,accal.RefPeriodNoCredit
      ,accal.RefPeriodIntService
      ,accal.RefPeriodStkStatement
      ,accal.RefPeriodReview
      ,accal.SMA_Class
      ,accal.SMA_Reason
      ,accal.SourceAlt_Key
      ,accal.FlgDeg
      ,accal.FlgDirtyRow
      ,accal.FlgInMonth
      ,accal.FlgSMA
      ,accal.FlgPNPA
      ,accal.FlgUpg
      --,accal.DPD_FinMaxType
      ,accal.REFPeriodMax
      ,accal.FinalNpaDt
      ,accal.FlgFITL
      ,accal.FlgAbinitio
      ,accal.FinalAssetClassAlt_Key
      ,accal.NPA_Days
      --,0 as RuleAlt_Key_IntService
      --,0 as RuleAlt_Key_NoCredit
      --,0 as RuleAlt_Key_Overdrawn
      --,0 as RuleAlt_Key_Overdue
      --,0 as RuleAlt_Key_Renewal
      --,0 as RuleAlt_Key_StockStmt
      ,accal.RefPeriodOverdueUPG
      ,accal.RefPeriodOverDrawnUPG
      ,accal.RefPeriodNoCreditUPG
      ,accal.RefPeriodIntServiceUPG
      ,accal.RefPeriodStkStatementUPG
      ,accal.RefPeriodReviewUPG
      ,accal.CommonMocTypeAlt_Key
      ,accal.EffectiveFromTimeKey
      ,accal.EffectiveToTimeKey
      ,accal.FlgMoc
      ,accal.MOC_Dt
      FROM    PRO.AccountCal_Hist AS AcCal INNER JOIN
      		PRO.AccountCal AS AcCurnt ON AcCal.EffectiveFromTimeKey <= @TimeKey AND AcCal.EffectiveToTimeKey >= @TimeKey AND AcCal.AccountEntityID = AcCurnt.AccountEntityID
      WHERE       NOT EXISTS
      (SELECT        1 AS Expr1
      FROM            PreMoc.ADVACCAL
      WHERE        (AccountEntityID = AcCal.AccountEntityID) AND (EffectiveFromTimeKey <= @TimeKey) AND (EffectiveToTimeKey >= @TimeKey))

       					---=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=INSERT DATA IN PREMOC CUSTOMERCALCAL-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
      INSERT INTO [PreMoc].[ADVCUSTCAL]
      							(
      BranchCode
      ,UCIF_ID
      ,CustomerEntityID
      ,ParentCustomerID
      ,RefCustomerID
      ,CustSegmentCode
      ,SrcAssetClassAlt_Key
      ,SysAssetClassAlt_Key
      ,SMA_Class_Key
      ,PNPA_Class_Key
      ,PrvQtrRV
      ,CurntQtrRv
      ,TotProvision
      ,SrcNPA_Dt
      ,SysNPA_Dt
      ,DbtDt
      ,LossDt
      ,MOC_Dt
      ,ErosionDt
      ,SMA_Dt
      ,PNPA_Dt
      ,Asset_Norm
      ,FlgDeg
      ,FlgUpg
      ,FlgMoc
      ,FlgSMA
      ,FlgProcessing
      ,FlgErosion
      ,FlgPNPA
      ,FlgPercolation
      ,FlgInMonth
      ,FlgDirtyRow
      ,DegDate
      ,EffectiveFromTimeKey
      ,EffectiveToTimeKey
      ,CommonMocTypeAlt_Key
      	)
      SELECT   

       custcal.BranchCode
      ,custcal.UCIF_ID
      ,custcal.CustomerEntityID
      ,custcal.ParentCustomerID
      ,custcal.RefCustomerID
      ,custcal.CustSegmentCode
      ,custcal.SrcAssetClassAlt_Key
      ,custcal.SysAssetClassAlt_Key
      ,custcal.SMA_Class_Key
      ,custcal.PNPA_Class_Key
      ,custcal.PrvQtrRV
      ,custcal.CurntQtrRv
      ,custcal.TotProvision
      ,custcal.SrcNPA_Dt
      ,custcal.SysNPA_Dt
      ,custcal.DbtDt
      ,custcal.LossDt
      ,custcal.MOC_Dt
      ,custcal.ErosionDt
      ,custcal.SMA_Dt
      ,custcal.PNPA_Dt
      ,custcal.Asset_Norm
      ,custcal.FlgDeg
      ,custcal.FlgUpg
      ,custcal.FlgMoc
      ,custcal.FlgSMA
      ,custcal.FlgProcessing
      ,custcal.FlgErosion
      ,custcal.FlgPNPA
      ,custcal.FlgPercolation
      ,custcal.FlgInMonth
      ,custcal.FlgDirtyRow
      ,custcal.DegDate
      ,custcal.EffectiveFromTimeKey
      ,custcal.EffectiveToTimeKey
      ,custcal.CommonMocTypeAlt_Key
        FROM   PRO.CustomerCal_Hist AS CustCal INNER JOIN
      PRO.CustomerCal AS CustCurnt ON CustCal.EffectiveFromTimeKey <= @TimeKey AND CustCal.EffectiveToTimeKey >= @TimeKey AND CustCal.CustomerEntityID = CustCurnt.CustomerEntityID
      WHERE        NOT EXISTS
      (SELECT        1 AS Expr1
      FROM            PreMoc.ADVCUSTCAL
      WHERE        (CustomerEntityID = CustCal.CustomerEntityID) AND (EffectiveFromTimeKey <= @TimeKey) AND (EffectiveToTimeKey >= @TimeKey))

      */
      OPEN  v_cursor FOR
         SELECT 'Proc Name: ' || NVL(utils.error_procedure, ' ') || ' ErrorMsg: ' || NVL(SQLERRM, ' ') --SELECT * INTO PREMOC.CUSTOMERCAL FROM PRO.CUSTOMERCAL_Hist WHERE 2=1
           FROM DUAL  ;
         DBMS_SQL.RETURN_RESULT(v_cursor);

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DATASHIFTINGINTOARCHIVEANDPREMOCTABLE_11042023" TO "ADF_CDR_RBL_STGDB";
