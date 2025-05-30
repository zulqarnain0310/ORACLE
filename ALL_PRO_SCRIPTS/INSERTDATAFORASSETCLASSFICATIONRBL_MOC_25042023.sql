--------------------------------------------------------
--  DDL for Procedure INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" 
--USE [RBL_MISDB]
 --GO
 --/****** Object:  StoredProcedure [PRO].[InsertDataforAssetClassficationRBL_MOC]    Script Date: 1/10/2022 1:53:07 PM ******/
 --SET ANSI_NULLS ON
 --GO
 --SET QUOTED_IDENTIFIER ON
 --GO
 --[PRO].[InsertDataforAssetClassficationRBL_MOC] 26298

(
  v_TIMEKEY IN NUMBER
)
AS
   ---declare @timekey int=26298
   v_ProcessingDate VARCHAR2(200) := ( SELECT DATE_ 
     FROM SYSDAYMATRIX 
    WHERE  TIMEKEY = v_TIMEKEY );
   v_SetID NUMBER(10,0) := ( SELECT NVL(MAX(NVL(SETID, 0)) , 0) + 1 
     FROM PRO_RBL_MISDB_PROD.ProcessMonitor 
    WHERE  TimeKey = v_TIMEKEY );

BEGIN

   EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.CUSTOMERCAL ';
   EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.ACCOUNTCAL ';
   EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.AdvAcRestructureCal ';
   EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.PUI_CAL ';
   DROP TABLE IF  --SQLDEV: NOT RECOGNIZED
   IF #Moc_Cust  --SQLDEV: NOT RECOGNIZED
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, CASE 
   WHEN MOCTYPE = 'Manual' THEN '2099-01-01'
   ELSE v_ProcessingDate
      END AS MOC_ExpireDate
   FROM A ,MOC_ChangeDetails A 
    WHERE EffectiveFromTimeKey <= v_TIMEKEY
     AND EffectiveToTimeKey >= v_TIMEKEY
     AND MOCType_Flag = 'CUST') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.MOC_ExpireDate = src.MOC_ExpireDate;
   IF  --SQLDEV: NOT RECOGNIZED
   IF tt_MOC_DATA_29  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_MOC_DATA_29;
   UTILS.IDENTITY_RESET('tt_MOC_DATA_29');

   INSERT INTO tt_MOC_DATA_29 ( 
   	SELECT UcifEntityID ,
           MAX(AssetClassAlt_Key)  SysAssetClassAlt_Key  ,
           MIN(NPA_Date)  SysNPA_Dt  ,
           MIN(MOC_ExpireDate)  MOC_ExpireDate  ,
           'N' AssetClassChanged  
   	  FROM MOC_ChangeDetails A
             JOIN CustomerBasicDetail cbd   ON a.EffectivefromTimeKey <= v_TimeKey
             AND a.EffectiveToTimeKey >= v_TIMEKEY
             AND CBD.EffectivefromTimeKey <= v_TimeKey
             AND CBD.EffectiveToTimeKey >= v_TIMEKEY
             AND cbd.CustomerEntityId = A.CustomerEntityId
   	 WHERE  MOC_Date = v_ProcessingDate
   	  GROUP BY UcifEntityID );
   IF  --SQLDEV: NOT RECOGNIZED
   IF tt_CUST_HIST  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_CUST_HIST;
   UTILS.IDENTITY_RESET('tt_CUST_HIST');

   INSERT INTO tt_CUST_HIST ( 
   	SELECT B.UcifEntityID ,
           MAX(B.SysAssetClassAlt_Key)  SysAssetClassAlt_Key  ,
           MIN(B.SysNPA_Dt)  SysNPA_Dt  
   	  FROM tt_MOC_DATA_29 A
             JOIN PRO_RBL_MISDB_PROD.CustomerCal_Hist B   ON B.EffectiveFromTimeKey <= v_TIMEKEY
             AND B.EffectiveToTimeKey >= v_TIMEKEY
             AND A.UcifEntityID = B.UcifEntityID
   	  GROUP BY B.UcifEntityID );
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, CASE 
   WHEN A.SysAssetClassAlt_Key IS NULL THEN B.SysAssetClassAlt_Key
   ELSE A.SysAssetClassAlt_Key
      END AS pos_2, CASE 
   WHEN A.SysNPA_Dt IS NULL THEN B.SysNPA_Dt
   ELSE A.SysNPA_Dt
      END AS pos_3
   FROM A ,tt_MOC_DATA_29 A
          JOIN tt_CUST_HIST B   ON A.UcifEntityID = B.UcifEntityID ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = pos_2,
                                A.SysNPA_Dt = pos_3;
   ----SELECT CBD.UcifEntityID
   ----	,MAX(isnull(C.AssetClassAlt_Key,isnull(npa.Cust_AssetClassAlt_Key,1))) AS SysAssetClassAlt_Key
   ----	,MIN(isnull(NPA_Date,npa.NPADt)) SysNPA_Dt
   ----	,MIN(MOC_ExpireDate) MOC_ExpireDate
   ----	,'N' AssetClassChanged
   ----INTO #Moc_Cust
   ----FROM CustomerBasicDetail  CBD
   ----	INNER JOIN tt_MOC_DATA_29 B
   ----		ON CBD.EffectiveFromTimeKey<=@TIMEKEY and CBD.EffectiveToTimeKey>=@TIMEKEY 
   ----		AND CBD.UcifEntityID=B.UcifEntityID
   ----	INNER JOIN MOC_ChangeDetails C
   ----		ON C.EffectiveFromTimeKey<=@TIMEKEY and C.EffectiveToTimeKey>=@TIMEKEY 
   ----		AND C.CUSTOMERENTITYID=CBD.CUSTOMERENTITYID	
   ----	left join AdvCustNPADetail npa
   ----		on npa.EffectiveFromTimeKey<=@TIMEKEY and npa.EffectiveToTimeKey>=@TIMEKEY 
   ----		and npa.CustomerEntityId =cbd.CustomerEntityId
   ----GROUP BY CBD.UcifEntityID
   INSERT INTO PRO_RBL_MISDB_PROD.CUSTOMERCAL
     ( BranchCode, UCIF_ID, UcifEntityID, CustomerEntityID, ParentCustomerID, RefCustomerID, SourceSystemCustomerID, CustomerName, CustSegmentCode, ConstitutionAlt_Key, PANNO, AadharCardNO, SrcAssetClassAlt_Key, SysAssetClassAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SMA_Class_Key, PNPA_Class_Key, PrvQtrRV, CurntQtrRv, TotProvision, RBITotProvision, BankTotProvision, SrcNPA_Dt, SysNPA_Dt, DbtDt, DbtDt2, DbtDt3, LossDt, MOC_Dt, ErosionDt, SMA_Dt, PNPA_Dt, Asset_Norm, FlgDeg, FlgUpg, FlgMoc, FlgSMA, FlgProcessing, FlgErosion, FlgPNPA, FlgPercolation, FlgInMonth, FlgDirtyRow, DegDate, EffectiveFromTimeKey, EffectiveToTimeKey, CommonMocTypeAlt_Key, InMonthMark, MocStatusMark, SourceAlt_Key, BankAssetClass, Cust_Expo, MOCReason, AddlProvisionPer, FraudDt, FraudAmount, DegReason
   --,DateOfData
   , CustMoveDescription, TotOsCust, MOCTYPE )
     ( SELECT A.BranchCode ,
              A.UCIF_ID ,
              A.UcifEntityID ,
              A.CustomerEntityID ,
              A.ParentCustomerID ,
              A.RefCustomerID ,
              A.SourceSystemCustomerID ,
              A.CustomerName ,
              A.CustSegmentCode ,
              A.ConstitutionAlt_Key ,
              A.PANNO ,
              A.AadharCardNO ,
              A.SrcAssetClassAlt_Key ,
              A.SysAssetClassAlt_Key ,
              A.SplCatg1Alt_Key ,
              A.SplCatg2Alt_Key ,
              A.SplCatg3Alt_Key ,
              A.SplCatg4Alt_Key ,
              A.SMA_Class_Key ,
              A.PNPA_Class_Key ,
              A.PrvQtrRV ,
              A.CurntQtrRv ,
              0 TotProvision  ,
              0 RBITotProvision  ,
              0 BankTotProvision  ,
              A.SrcNPA_Dt ,
              A.SysNPA_Dt ,
              A.DbtDt ,
              A.DbtDt2 ,
              A.DbtDt3 ,
              A.LossDt ,
              A.MOC_Dt ,
              A.ErosionDt ,
              A.SMA_Dt ,
              A.PNPA_Dt ,
              A.Asset_Norm ,
              A.FlgDeg ,
              A.FlgUpg ,
              'Y' FlgMoc  ,
              A.FlgSMA ,
              A.FlgProcessing ,
              A.FlgErosion ,
              A.FlgPNPA ,
              A.FlgPercolation ,
              A.FlgInMonth ,
              A.FlgDirtyRow ,
              A.DegDate ,
              v_TIMEKEY EffectiveFromTimeKey  ,
              v_TIMEKEY EffectiveToTimeKey  ,
              A.CommonMocTypeAlt_Key ,
              A.InMonthMark ,
              A.MocStatusMark ,
              A.SourceAlt_Key ,
              A.BankAssetClass ,
              A.Cust_Expo ,
              A.MOCReason ,
              A.AddlProvisionPer ,
              A.FraudDt ,
              A.FraudAmount ,
              A.DegReason ,
              --,A.DateOfData
              A.CustMoveDescription ,
              A.TotOsCust ,
              A.MOCTYPE 
       FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist A
              JOIN tt_MOC_DATA_29 B   ON A.UcifEntityID = B.UcifEntityID
        WHERE  EffectiveFromTimeKey <= v_TIMEKEY
                 AND EffectiveToTimeKey >= v_TIMEKEY );
   INSERT INTO PRO_RBL_MISDB_PROD.ACCOUNTCAL
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
   , RelationshipNumber, AccountFlag, CommercialFlag_AltKey, Liability, CD, AccountStatus, AccountBlkCode1, AccountBlkCode2, ExposureType, Mtm_Value, BankAssetClass, NpaType, SecApp, BorrowerTypeID, LineCode, ProvPerSecured, ProvPerUnSecured, MOCReason, AddlProvisionPer, FlgINFRA, RepossessionDate
   --,DateOfData
   , DerecognisedInterest1, DerecognisedInterest2, ProductCode, FlgLCBG, unserviedint, AdvanceRecovery, NotionalInttAmt, OriginalBranchcode, PrvAssetClassAlt_Key, FlgSecured, RePossession, RCPending, PaymentPending, WheelCase, CustomerLevelMaxPer, FinalProvisionPer, IsIBPC, IsSecuritised, RFA, IsNonCooperative, Sarfaesi, WeakAccount, PUI, FlgRestructure, RestructureDate, WeakAccountDate, SarfaesiDate, FlgUnusualBounce, UnusualBounceDate, FlgUnClearedEffect, UnClearedEffectDate, FlgFraud, FraudDate )
     ( SELECT A.AccountEntityID ,
              A.UcifEntityID ,
              A.CustomerEntityID ,
              A.CustomerAcID ,
              A.RefCustomerID ,
              A.SourceSystemCustomerID ,
              A.UCIF_ID ,
              A.BranchCode ,
              A.FacilityType ,
              A.AcOpenDt ,
              A.FirstDtOfDisb ,
              A.ProductAlt_Key ,
              A.SchemeAlt_key ,
              A.SubSectorAlt_Key ,
              A.SplCatg1Alt_Key ,
              A.SplCatg2Alt_Key ,
              A.SplCatg3Alt_Key ,
              A.SplCatg4Alt_Key ,
              A.SourceAlt_Key ,
              A.ActSegmentCode ,
              A.InttRate ,
              A.Balance ,
              A.BalanceInCrncy ,
              A.CurrencyAlt_Key ,
              A.DrawingPower ,
              A.CurrentLimit ,
              A.CurrentLimitDt ,
              A.ContiExcessDt ,
              A.StockStDt ,
              A.DebitSinceDt ,
              A.LastCrDate ,
              A.PreQtrCredit ,
              A.PrvQtrInt ,
              A.CurQtrCredit ,
              A.CurQtrInt ,
              A.InttServiced ,
              A.IntNotServicedDt ,
              A.OverdueAmt ,
              A.OverDueSinceDt ,
              A.ReviewDueDt ,
              A.SecurityValue ,
              A.DFVAmt ,
              A.GovtGtyAmt ,
              A.CoverGovGur ,
              A.WriteOffAmount ,
              A.UnAdjSubSidy ,
              A.CreditsinceDt ,
              --,A.DPD_IntService
              --,A.DPD_NoCredit
              --,A.DPD_Overdrawn
              --,A.DPD_Overdue
              --,A.DPD_Renewal
              --,A.DPD_StockStmt
              --,A.DPD_Max
              --,A.DPD_FinMaxType
              A.DegReason ,
              A.Asset_Norm ,
              A.REFPeriodMax ,
              A.RefPeriodOverdue ,
              A.RefPeriodOverDrawn ,
              A.RefPeriodNoCredit ,
              A.RefPeriodIntService ,
              A.RefPeriodStkStatement ,
              A.RefPeriodReview ,
              A.NetBalance ,
              A.ApprRV ,
              A.SecuredAmt ,
              A.UnSecuredAmt ,
              A.ProvDFV ,
              0 Provsecured  ,
              0 ProvUnsecured  ,
              0 ProvCoverGovGur  ,
              0 AddlProvision  ,
              0 TotalProvision  ,
              0 BankProvsecured  ,
              0 BankProvUnsecured  ,
              0 BankTotalProvision  ,
              0 RBIProvsecured  ,
              0 RBIProvUnsecured  ,
              0 RBITotalProvision  ,
              A.InitialNpaDt ,
              A.FinalNpaDt ,
              A.SMA_Dt ,
              A.UpgDate ,
              A.InitialAssetClassAlt_Key ,
              A.FinalAssetClassAlt_Key ,
              A.ProvisionAlt_Key ,
              A.PNPA_Reason ,
              A.SMA_Class ,
              A.SMA_Reason ,
              'Y' FlgMoc  ,
              A.MOC_Dt ,
              A.CommonMocTypeAlt_Key ,
              --,A.DPD_SMA
              A.FlgDeg ,
              A.FlgDirtyRow ,
              A.FlgInMonth ,
              A.FlgSMA ,
              A.FlgPNPA ,
              A.FlgUpg ,
              A.FlgFITL ,
              A.FlgAbinitio ,
              A.NPA_Days ,
              A.RefPeriodOverdueUPG ,
              A.RefPeriodOverDrawnUPG ,
              A.RefPeriodNoCreditUPG ,
              A.RefPeriodIntServiceUPG ,
              A.RefPeriodStkStatementUPG ,
              A.RefPeriodReviewUPG ,
              v_TIMEKEY EffectiveFromTimeKey  ,
              v_TIMEKEY EffectiveToTimeKey  ,
              A.AppGovGur ,
              A.UsedRV ,
              A.ComputedClaim ,
              A.UPG_RELAX_MSME ,
              A.DEG_RELAX_MSME ,
              A.PNPA_DATE ,
              A.NPA_Reason ,
              A.PnpaAssetClassAlt_key ,
              A.DisbAmount ,
              A.PrincOutStd ,
              A.PrincOverdue ,
              A.PrincOverdueSinceDt ,
              --,A.DPD_PrincOverdue
              A.IntOverdue ,
              A.IntOverdueSinceDt ,
              --,A.DPD_IntOverdueSince
              A.OtherOverdue ,
              A.OtherOverdueSinceDt ,
              --,A.DPD_OtherOverdueSince
              A.RelationshipNumber ,
              A.AccountFlag ,
              A.CommercialFlag_AltKey ,
              A.Liability ,
              A.CD ,
              A.AccountStatus ,
              A.AccountBlkCode1 ,
              A.AccountBlkCode2 ,
              A.ExposureType ,
              A.Mtm_Value ,
              A.BankAssetClass ,
              A.NpaType ,
              A.SecApp ,
              A.BorrowerTypeID ,
              A.LineCode ,
              A.ProvPerSecured ,
              A.ProvPerUnSecured ,
              A.MOCReason ,
              A.AddlProvisionPer ,
              A.FlgINFRA ,
              A.RepossessionDate ,
              --,A.DateOfData
              A.DerecognisedInterest1 ,
              A.DerecognisedInterest2 ,
              A.ProductCode ,
              A.FlgLCBG ,
              A.unserviedint ,
              A.AdvanceRecovery ,
              A.NotionalInttAmt ,
              A.OriginalBranchcode ,
              A.PrvAssetClassAlt_Key ,
              A.FlgSecured ,
              A.RePossession ,
              A.RCPending ,
              A.PaymentPending ,
              A.WheelCase ,
              A.CustomerLevelMaxPer ,
              A.FinalProvisionPer ,
              A.IsIBPC ,
              A.IsSecuritised ,
              A.RFA ,
              A.IsNonCooperative ,
              A.Sarfaesi ,
              A.WeakAccount ,
              A.PUI ,
              A.FlgRestructure ,
              A.RestructureDate ,
              A.WeakAccountDate ,
              A.SarfaesiDate ,
              A.FlgUnusualBounce ,
              A.UnusualBounceDate ,
              A.FlgUnClearedEffect ,
              A.UnClearedEffectDate ,
              A.FlgFraud ,
              A.FraudDate 
       FROM PRO_RBL_MISDB_PROD.AccountCal_Hist A
              JOIN tt_MOC_DATA_29 B   ON A.UcifEntityID = B.UcifEntityID
        WHERE  EffectiveFromTimeKey <= v_TIMEKEY
                 AND EffectiveToTimeKey >= v_TIMEKEY );
   /* UPDATE MOC DATA IN CUSOMER CAL AND ACCOUNTCAL */
   /* UPDATE MOC DATA IN CUSOMER CAL AND ACCOUNTCAL */
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, C.SysAssetClassAlt_Key, CASE 
   WHEN C.SysNPA_Dt IS NULL THEN a.SysNPA_Dt
   ELSE C.SysNPA_Dt
      END AS pos_3, CASE 
   WHEN NVL(C.SysAssetClassAlt_Key, 0) > 1
     AND NVL(A.SysAssetClassAlt_Key, 0) = 1 THEN 'ALWYS_NPA'
   WHEN NVL(C.SysAssetClassAlt_Key, 0) = 1
     AND NVL(A.SysAssetClassAlt_Key, 0) > 1 THEN 'ALWYS_STD'
   WHEN ( NVL(C.SysAssetClassAlt_Key, 0) = 0 )
     OR ( NVL(C.SysAssetClassAlt_Key, 0) > 1
     AND NVL(A.SysAssetClassAlt_Key, 0) > 1 ) THEN 'NORMAL'   END AS pos_4, CASE 
   WHEN c.MOC_ExpireDate = v_ProcessingDate THEN 'AUTO'
   ELSE 'MANUAL'
      END AS pos_5, CASE 
   WHEN NVL(c.SysAssetClassAlt_Key, 0) > A.SysAssetClassAlt_Key THEN 'NPA DUE TO MOC'   END AS pos_6, 'Y'
   --,MOC_Dt =B.MOC_Date		
    --,MOCReason =B.MOC_Reason

   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
        --INNER JOIN MOC_ChangeDetails B
         --	ON  B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveToTimeKey>=@TIMEKEY
         --	AND B.MOC_Date=@ProcessingDate
         --	and B.CustomerEntityId=A.CustomerEntityID
         --	AND MOCType_Flag='CUST'

          JOIN tt_MOC_DATA_29 C   ON C.UcifEntityID = A.UcifEntityID ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = src.SysAssetClassAlt_Key,
                                A.SysNPA_Dt
                                --,A.CurntQtrRv =CASE WHEN ISNULL(B.CurntQtrRv,0)=0 THEN A.CurntQtrRv ELSE B.CurntQtrRv END
                                 = pos_3,
                                A.ASSET_NORM = pos_4,
                                A.MOCTYPE = pos_5,
                                A.DEGREASON
                                --,AddlProvisionPer=B.AddlProvPer
                                 = pos_6,
                                A.FLGMOC = 'Y';
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, CASE 
   WHEN NVL(B.CurntQtrRv, 0) = 0 THEN A.CurntQtrRv
   ELSE B.CurntQtrRv
      END AS pos_2, B.AddlProvPer, B.MOC_Date, B.MOC_Reason
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN MOC_ChangeDetails B   ON B.EffectiveFromTimeKey <= v_TIMEKEY
          AND B.EffectiveToTimeKey >= v_TIMEKEY
          AND B.MOC_Date = v_ProcessingDate
          AND B.CustomerEntityId = A.CustomerEntityID
          AND MOCType_Flag = 'CUST'
          JOIN tt_MOC_DATA_29 C   ON C.UcifEntityID = A.UcifEntityID ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.CurntQtrRv = pos_2,
                                A.AddlProvisionPer = src.AddlProvPer,
                                A.MOC_Dt = src.MOC_Date,
                                A.MOCReason = src.MOC_Reason;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, CASE 
   WHEN NVL(B.AddlProvPer, 0) = 0 THEN A.AddlProvisionPer
   ELSE B.AddlProvPer
      END AS pos_2, CASE 
   WHEN NVL(B.AddlProvAbs, 0) = 0 THEN A.AddlProvision
   ELSE B.AddlProvAbs
      END AS pos_3, CASE 
   WHEN b.PrincOutStd IS NULL THEN A.PrincOutStd
   ELSE B.PrincOutStd
      END AS pos_4, CASE 
   WHEN NVL(B.FlgRestructure, ' ') = ' ' THEN A.FlgRestructure
   ELSE B.FlgRestructure
      END AS pos_5, CASE 
   WHEN B.RestructureDate IS NULL THEN A.RestructureDate
   ELSE B.RestructureDate
      END AS pos_6, CASE 
   WHEN NVL(B.FlgFITL, ' ') = ' ' THEN A.FlgFITL
   ELSE B.FlgFITL
      END AS pos_7, CASE 
   WHEN NVL(B.DFVAmt, 0) = 0 THEN A.DFVAmt
   ELSE B.DFVAmt
      END AS pos_8, CASE 
   WHEN NVL(B.FlgFraud, ' ') = ' ' THEN A.FlgFraud
   ELSE B.FlgFraud
      END AS pos_9, CASE 
   WHEN B.FraudDate IS NULL THEN A.FraudDate
   ELSE B.FraudDate
      END AS pos_10, CASE 
   WHEN b.MOC_ExpireDate = v_ProcessingDate THEN 'AUTO'
   ELSE 'MANUAL'
      END AS pos_11, 'Y', B.MOC_Date, B.MOC_Reason
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN MOC_ChangeDetails B   ON B.EffectiveFromTimeKey <= v_TIMEKEY
          AND b.EffectiveToTimeKey >= v_TIMEKEY
          AND B.Moc_Date = v_ProcessingDate
          AND B.AccountEntityid = A.AccountEntityID
          AND MOCType_Flag = 'ACCT' ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET AddlProvisionPer = pos_2,
                                AddlProvision
                                ---		 ,PrincOutStd			=CASE WHEN  ISNULL(B.PrincOutStd,0)  =0			THEN A.PrincOutStd			ELSE B.PrincOutStd			END
                                 = pos_3,
                                PrincOutStd
                                --,UnserviedInt			=CASE WHEN ISNULL(B.UnServicedInt,0)=0			THEN A.UnserviedInt			ELSE B.UnServicedInt		END
                                 = pos_4,
                                FlgRestructure = pos_5,
                                RestructureDate = pos_6,
                                FlgFITL = pos_7,
                                DFVAmt
                                --,Repossession			=CASE WHEN ISNULL(B.Repossession,'')=''			THEN A.Repossession			ELSE B.Repossession			END
                                 --,RepossessionDate		=CASE WHEN B.RepossessionDate	 IS NULL		THEN A.RepossessionDate		ELSE B.RepossessionDate		END
                                 --,WeakAccount			=CASE WHEN ISNULL(B.WeakAccount,'')=''			THEN A.WeakAccount			ELSE B.WeakAccount			END
                                 --,WeakAccountDate		=CASE WHEN B.WeakAccountDate	 IS NULL		THEN A.WeakAccountDate		ELSE B.WeakAccountDate		END
                                 --,Sarfaesi				=CASE WHEN ISNULL(B.Sarfaesi,'') =''			THEN A.Sarfaesi				ELSE B.Sarfaesi				END
                                 --,SarfaesiDate			=CASE WHEN B.SarfaesiDate		 IS NULL		THEN A.SarfaesiDate			ELSE B.SarfaesiDate			END
                                 --,FlgUnusualBounce		=CASE WHEN ISNULL(B.FlgUnusualBounce,'')=''		THEN A.FlgUnusualBounce		ELSE B.FlgUnusualBounce		END
                                 --,UnusualBounceDate		=CASE WHEN B.UnusualBounceDate	 IS NULL		THEN A.UnusualBounceDate	ELSE B.UnusualBounceDate	END
                                 --,FlgUnClearedEffect	=CASE WHEN ISNULL(B.FlgUnClearedEffect,'')=''	THEN A.FlgUnClearedEffect	ELSE B.FlgUnClearedEffect	END
                                 --,UnClearedEffectDate	=CASE WHEN B.UnClearedEffectDate IS NULL		THEN A.UnClearedEffectDate	ELSE B.UnClearedEffectDate	END
                                 = pos_8,
                                FlgFraud = pos_9,
                                FraudDate
                                --,BenamiLoansFlag		=CASE WHEN ISNULL(B.BenamiLoansFlag,'')	=''		THEN A.BenamiLoansFlag		ELSE B.BenamiLoansFlag		END
                                 --,MarkBenamiDate		=CASE WHEN B.MarkBenamiDate		 IS NULL		THEN A.MarkBenamiDate		ELSE B.MarkBenamiDate		END
                                 --,SubLendingFlag		=CASE WHEN ISNULL(B.SubLendingFlag,'')=''		THEN A.SubLendingFlag		ELSE B.SubLendingFlag		END
                                 --,MarkSubLendingDate	=CASE WHEN B.MarkSubLendingDate	 IS NULL		THEN A.MarkSubLendingDate	ELSE B.MarkSubLendingDate	END
                                 --,AbscondingFlag		=CASE WHEN ISNULL(B.AbscondingFlag,'') =''		THEN A.AbscondingFlag		ELSE B.AbscondingFlag		END
                                 --,MarkAbscondingDate	=CASE WHEN B.MarkAbscondingDate	 IS NULL		THEN A.MarkAbscondingDate	ELSE B.MarkAbscondingDate	END
                                 --,TwoFlag				=CASE WHEN ISNULL(B.TwoFlag,'')	 IS NULL		THEN A.TwoFlag				ELSE B.TwoFlag				END
                                 --,TwoDate				=CASE WHEN B.TwoDate			 IS NULL		THEN A.TwoDate				ELSE B.TwoDate				END
                                 = pos_10,
                                MOCTYPE = pos_11,
                                FLGMOC = 'Y',
                                MOC_Dt = src.MOC_Date,
                                MOCReason = src.MOC_Reason;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, NULL, NULL, NULL, NULL
   --,A.FLGMOC='Y'
    --,A.ASSET_NORM=CASE WHEN B.MocType='Manual' THEN  'ALWYS_STD' ELSE 'NORMAL'  END
    ---,A.MOCREASON=B.MOCREASON  --- NEED TO UPDATE IN MOC SCREEN SP
   , 'STD DUE TO MOC' AS pos_6
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
        --INNER JOIN #Moc_Cust B ON A.UcifEntityID=B.UcifEntityID
         --INNER JOIN DimAssetClass C
         --		ON C.EffectiveFromTimeKey<=@TIMEKEY and c.EffectiveToTimeKey>=@TIMEKEY
         --		and c.AssetClassAlt_Key=b.PreMoc_SysAssetClassAlt_Key

          JOIN DimAssetClass D   ON D.EffectiveFromTimeKey <= v_TIMEKEY
          AND D.EffectiveToTimeKey >= v_TIMEKEY
          AND D.AssetClassAlt_Key = A.SysAssetClassAlt_Key ---C.AssetClassGroup='NPA' AND 

    WHERE D.AssetClassGroup = 'STD'
     AND A.Asset_Norm = 'ALWYS_STD') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET
   --A.SYSASSETCLASSALT_KEY=B.SysAssetClassAlt_Key
    --,A.SYSNPA_DT=NULL
    A.DbtDt = NULL,
    A.DbtDt2 = NULL,
    A.DbtDt3 = NULL,
    A.LossDt = NULL,
    A.DEGREASON
    ---,A.MOC_DT=B.DATECREATED  
     --,A.MOCTYPE=B.MOCTYPE  
     = pos_6;
   MERGE INTO ACL 
   USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', 2, CASE 
   WHEN TwoDate IS NOT NULL THEN TwoDate
   ELSE v_ProcessingDate
      END AS pos_4, 'NPA DUE TO WRITEOFF MARKING THROUGH MOC' AS pos_5, B.TwoAmount
   FROM ACL ,PRO_RBL_MISDB_PROD.ACCOUNTCAL ACL
          JOIN MOC_ChangeDetails b   ON ACL.AccountEntityID = b.AccountEntityID
          AND B.MOCType_Flag = 'ACCT'
          AND B.MOC_Date = v_ProcessingDate
          AND b.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND b.EffectiveToTimeKey >= v_TIMEKEY 
    WHERE b.TwoFlag = 'Y'
     AND FinalAssetClassAlt_Key = 1) src
   ON ( ACL.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                ACL.FinalAssetClassAlt_Key = 2,
                                ACL.FinalNpaDt = pos_4,
                                ACL.NPA_Reason = pos_5,
                                ACL.WriteOffAmount = src.TwoAmount;
   MERGE INTO ACL 
   USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO WRITEOFF MARKING THROUGH MOC' AS pos_3, B.TwoAmount
   FROM ACL ,PRO_RBL_MISDB_PROD.ACCOUNTCAL ACL
          JOIN MOC_ChangeDetails b   ON ACL.AccountEntityID = b.AccountEntityID
          AND B.MOCType_Flag = 'ACCT'
          AND B.MOC_Date = v_ProcessingDate
          AND b.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND b.EffectiveToTimeKey >= v_TIMEKEY 
    WHERE b.TwoFlag = 'Y'
     AND FinalAssetClassAlt_Key > 1) src
   ON ( ACL.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                ACL.NPA_Reason = pos_3,
                                ACL.WriteOffAmount = src.TwoAmount;
   /* CUSTOMER WRITEOFF UPDATE */
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO WRITEOFF MARKING THROUGH MOC' AS pos_3, 2, CASE 
   WHEN TwoDate IS NOT NULL THEN TwoDate
   ELSE v_ProcessingDate
      END AS pos_5
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL AC   ON AC.CustomerEntityID = A.CustomerEntityID
          JOIN MOC_ChangeDetails b   ON AC.AccountEntityID = b.AccountEntityID
          AND B.MOCType_Flag = 'ACCT'
          AND B.MOC_Date = v_ProcessingDate
          AND b.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND b.EffectiveToTimeKey >= v_TIMEKEY 
    WHERE b.TwoFlag = 'Y'
     AND SysAssetClassAlt_Key = 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.DegReason = pos_3,
                                A.SysAssetClassAlt_Key = 2,
                                A.SysNPA_Dt = pos_5;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO WRITEOFF MARKING THROUGH MOC' AS pos_3
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL AC   ON AC.CustomerEntityID = A.CustomerEntityID
          JOIN MOC_ChangeDetails b   ON AC.AccountEntityID = b.AccountEntityID
          AND B.MOCType_Flag = 'ACCT'
          AND B.MOC_Date = v_ProcessingDate
          AND b.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND b.EffectiveToTimeKey >= v_TIMEKEY 
    WHERE b.TwoFlag = 'Y'
     AND A.SysAssetClassAlt_Key > 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.DegReason = pos_3;
   /* added on 29122021 as discussed 29122021 for update MOC npa date and reason for other moc effected customer/accounts */
   UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
      SET MOC_Dt = v_ProcessingDate
    WHERE  MOC_DT IS NULL;
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET MOC_Dt = v_ProcessingDate
    WHERE  MOC_DT IS NULL;
   ------UPDATE A
   ------	SET A.MOCReason=ltrim(rtrim(isnull(A.MOCReason,'')))+' '+ltrim(rtrim(isnull(B.MOCReason,'')))+' CIF ID '+b.RefCustomerID
   ------FROM PRO.ACCOUNTCAL a
   ------	INNER JOIN PRO.CUSTOMERCAL B
   ------		ON A.UcifEntityID=B.UcifEntityID
   ------	WHERE ISNULL(B.MOCReason,'')<>''
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, LTRIM(RTRIM(NVL(B.MOCReason, ' '))) || ' CIF ID ' || b.RefCustomerID AS MOCReason
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL a
          JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.UcifEntityID = B.UcifEntityID 
    WHERE NVL(A.MOCReason, ' ') = ' '
     AND NVL(B.MOCReason, ' ') <> ' ') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.MOCReason = src.MOCReason;
   /* */
   /* ACCOUNT LEVEL DATA UPDATE */
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.SysAssetClassAlt_Key, B.Asset_Norm, B.MOCTYPE, NULL
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID
          JOIN DimAssetClass D   ON D.EffectiveFromTimeKey <= v_TIMEKEY
          AND D.EffectiveToTimeKey >= v_TIMEKEY
          AND D.AssetClassAlt_Key = b.SysAssetClassAlt_Key 
    WHERE D.AssetClassGroup = 'STD') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.SysAssetClassAlt_Key,
                                A.ASSET_NORM = src.Asset_Norm,
                                A.MOCTYPE = src.MOCTYPE,
                                A.FinalNpaDt = NULL;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.SysAssetClassAlt_Key, B.Asset_Norm, B.MOCTYPE, b.SysNPA_Dt
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID
          JOIN DimAssetClass D   ON D.EffectiveFromTimeKey <= v_TIMEKEY
          AND D.EffectiveToTimeKey >= v_TIMEKEY
          AND D.AssetClassAlt_Key = b.SysAssetClassAlt_Key 
    WHERE D.AssetClassGroup <> 'STD') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.SysAssetClassAlt_Key,
                                A.ASSET_NORM = src.Asset_Norm,
                                A.MOCTYPE = src.MOCTYPE,
                                A.FinalNpaDt = src.SysNPA_Dt;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, v_ProcessingDate
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN DIMASSETCLASS DA   ON DA.ASSETCLASSALT_KEY = A.SysAssetClassAlt_Key
          AND DA.ASSETCLASSSHORTNAME IN ( 'DB1','DB2','DB3' )

          AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
    WHERE DBTDT IS NULL) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.DBTDT = v_ProcessingDate;
   /*  EXCEPTIONAL DEGRADATION START */
   /*------------------UPDATE Repossessed ACCOUNT MARKING  IN PRO.ACCOUNTCAL------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
     ( SELECT USER ,
              'UPDATE Repossessed ACCOUNT MARKING  IN PRO.ACCOUNTCAL' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SETID 
         FROM DUAL  );
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 2, CASE 
   WHEN REPOSSESSIONDATE IS NULL THEN v_PROCESSINGDATE
   ELSE REPOSSESSIONDATE
      END AS pos_4, 'NPA DUE TO Repossessed Account' AS pos_5
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE A.RePossession = 'Y'
     AND FinalAssetClassAlt_Key = 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.FinalAssetClassAlt_Key = 2,
                                A.FinalNpaDt --FinalNpaDt
                                 = pos_4,
                                A.NPA_Reason = pos_5;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO Repossessed Account' AS pos_3, 'Y'
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE A.RePossession = 'Y'
     AND finalAssetClassAlt_Key > 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.NPA_Reason = pos_3,
                                A.RePossession = 'Y';
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                             FROM DUAL  )
     AND TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'UPDATE Repossessed ACCOUNT MARKING  IN PRO.ACCOUNTCAL';
   /*------------------UPDATE Inherent Weakness  ACCOUNT MARKING  IN PRO.ACCOUNTCAL------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
     ( SELECT USER ,
              'UPDATE Inherent Weakness ACCOUNT MARKING  IN PRO.ACCOUNTCAL' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SETID 
         FROM DUAL  );
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 2, CASE 
   WHEN FinalNpaDt IS NULL THEN v_PROCESSINGDATE
   ELSE FinalNpaDt
      END AS pos_4, 'NPA DUE TO Inherent Weakness Account' AS pos_5
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE A.WeakAccount = 'Y'
     AND FinalAssetClassAlt_Key = 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.FinalAssetClassAlt_Key = 2,
                                A.FinalNpaDt = pos_4,
                                A.NPA_Reason = pos_5;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO Inherent Weakness Account' AS pos_3, 'Y'
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL a 
    WHERE A.WeakAccount = 'Y'
     AND FinalAssetClassAlt_Key > 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.NPA_Reason = pos_3,
                                A.WeakAccount = 'Y';
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                             FROM DUAL  )
     AND TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'UPDATE Inherent Weakness ACCOUNT MARKING  IN PRO.ACCOUNTCAL';
   /*------------------UPDATE SARFAESI ACCOUNT MARKING IN PRO.ACCOUNTCAL------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
     ( SELECT USER ,
              'UPDATE SARFAESI ACCOUNT MARKING IN PRO.ACCOUNTCAL' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SETID 
         FROM DUAL  );
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 2, CASE 
   WHEN FinalNpaDt IS NULL THEN v_PROCESSINGDATE
   ELSE FinalNpaDt
      END AS pos_4, 'NPA DUE TO SARFAESI  Account' AS pos_5
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE Sarfaesi = 'Y'
     AND FinalAssetClassAlt_Key = 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.FinalAssetClassAlt_Key = 2,
                                A.FinalNpaDt = pos_4,
                                A.NPA_Reason = pos_5;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO Sarfaesi Account' AS pos_3, 'Y'
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE Sarfaesi = 'Y'
     AND FinalAssetClassAlt_Key > 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.NPA_Reason = pos_3,
                                A.Sarfaesi = 'Y';
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                             FROM DUAL  )
     AND TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'UPDATE SARFAESI ACCOUNT MARKING IN PRO.ACCOUNTCAL';
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                             FROM DUAL  )
     AND TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'UPDATE Written-Off Accounts MARKING IN PRO.ACCOUNTCAL';
   /*------------------UPDATE FRAUD ACCOUNT MARKING  IN PRO.ACCOUNTCAL------------------*/
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
     ( SELECT USER ,
              'UPDATE FRAUD ACCOUNT MARKING  IN PRO.ACCOUNTCAL' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SETID 
         FROM DUAL  );
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 870, 6, CASE 
   WHEN FinalNpaDt IS NULL THEN v_PROCESSINGDATE
   ELSE FinalNpaDt
      END AS pos_5, 'NPA DUE TO FRAUD MARKING' AS pos_6
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE FlgFraud = 'Y') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.SplCatg4Alt_Key = 870,
                                A.FinalAssetClassAlt_Key = 6,
                                A.FinalNpaDt = pos_5,
                                A.NPA_Reason = pos_6;
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                             FROM DUAL  )
     AND TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'UPDATE FRAUD ACCOUNT MARKING  IN PRO.ACCOUNTCAL';
   -----------------------
   INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
     ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
     ( SELECT USER ,
              'UPDATE EXCEPTIONAL DEGRADATION MARKING IN PRO.CUSTOMERCAL' ,
              'RUNNING' ,
              SYSDATE ,
              NULL ,
              v_TIMEKEY ,
              v_SETID 
         FROM DUAL  );
   MERGE INTO a 
   USING (SELECT a.ROWID row_id, b.FinalAssetClassAlt_Key, b.FinalNpaDt, b.NPA_Reason, b.Asset_Norm
   FROM a ,PRO_RBL_MISDB_PROD.CUSTOMERCAL a
          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL b   ON a.CustomerEntityID = b.CustomerEntityID 
    WHERE b.WeakAccount = 'Y'
     OR Sarfaesi = 'Y'
     OR RePossession = 'Y'
     OR FlgFraud = 'Y') src
   ON ( a.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET a.SysAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                a.SysNPA_Dt = src.FinalNpaDt,
                                a.DegReason = src.NPA_Reason,
                                a.Asset_Norm = src.Asset_Norm;
   UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
      SET ENDTIME = SYSDATE,
          MODE_ = 'COMPLETE'
    WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                             FROM DUAL  )
     AND TIMEKEY = v_TIMEKEY
     AND DESCRIPTION = 'UPDATE EXCEPTIONAL DEGRADATION MARKING IN PRO.CUSTOMERCAL';
   /* EXCETIONAL DEGRADATION END */
   /* SECURITY APPROPRIATE CUSTOMER TO ACCOUNT LEVEL*/
   --;WITH CTE(CustomerEntityID,TOTOSFUNDED)                    
   --AS                    
   --(                    
   --SELECT CustomerEntityID ,SUM(ISNULL(A.BALANCE,0)) TOTOSFUNDED
   -- FROM  PRO.ACCOUNTCAL A                               
   --WHERE A.BALANCE>0  AND EffectiveFromTimeKey =@TIMEKEY AND EffectiveToTimeKey=@TIMEKEY
   --GROUP BY CustomerEntityID                 
   --)                                          
   --UPDATE D SET D.                                    
   --SecurityValue=CASE WHEN  ((D.NETBALANCE/A.TOTOSFUNDED)*B.CurntQtrRv)>D.NETBALANCE THEN D.NETBALANCE       
   --ELSE ((D.NETBALANCE/A.TOTOSFUNDED)*B.CurntQtrRv) END                                        
   --from CTE A
   --INNER JOIN PRO.CustomerCal B on A.CustomerEntityID=B.CustomerEntityID                             
   --			AND B.EffectiveFromTimeKey =@TIMEKEY AND B.EffectiveToTimeKey=@TIMEKEY
   --INNER JOIN   pro.AccountCal D on D.CustomerEntityID=B.CustomerEntityID                  
   --			AND D.EffectiveFromTimeKey =@TIMEKEY AND D.EffectiveToTimeKey=@TIMEKEY
   --WHERE B.CurntQtrRv>0
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.AddlProvisionPer
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
    WHERE NVL(B.AddlProvisionPer, 0) > 0) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.AddlProvisionPer = src.AddlProvisionPer;
   -----------------BELOW CODE SHIFTED TO NET BALANCE CALCULATION SP
   --------UPDATE A SET A.AddlProvision=(A.NetBalance * A.AddlProvisionPer)/100
   --------   FROM PRO.AccountCal A
   --------	WHERE  ISNULL(A.AddlProvisionPer,0)>0
   --UPDATE B SET FlgSecured='D'
   --FROM  PRO.AccountCal B
   --	INNER JOIN PRO.CUSTOMERCAL a
   --		ON A.CustomerEntityID =B.CustomerEntityID
   --	WHERE ISNULL(CurntQtrRv,0)>0
   --		AND B.SecApp='S'
   --		AND ISNULL(B.BALANCE,0)>0 
   /* security work */
   ----------IF OBJECT_ID('TEMPDB..#CurntQtrRv') IS NOT NULL
   ----------DROP TABLE #CurntQtrRv
   ----------SELECT * 
   ----------	INTO #CurntQtrRv
   ----------FROM dbo.AdvCustSecurityFun(@TIMEKEY)
   ----------UPDATE A SET A.CurntQtrRv= ISNULL(B.Total_PriSec,0)+ISNULL(B.Total_CollSec,0) 
   ----------FROM PRO.CUSTOMERCAL A INNER  JOIN #CurntQtrRv B
   ----------ON A.CUSTOMERENTITYID=B.CUSTOMERENTITYID
   ---------- /* PREV QTR SEECURITY */       
   ----------IF OBJECT_ID('TEMPDB..#PRVQTRRV') IS NOT NULL
   ----------DROP TABLE #PRVQTRRV
   ----------DECLARE @PRVQTRRV INT =(SELECT LastQtrDateKey FROM SYSDAYMATRIX WHERE TimeKey=@TIMEKEY)
   ----------SELECT *  
   ----------INTO #PRVQTRRV 
   ----------FROM dbo.AdvCustSecurityFunpre(@PRVQTRRV)
   ----------UPDATE A SET A.PRVQTRRV= ISNULL(B.Total_PriSec,0)+ISNULL(B.Total_CollSec,0)  FROM PRO.CUSTOMERCAL A INNER  JOIN #PRVQTRRV B
   ----------ON A.CUSTOMERENTITYID=B.CUSTOMERENTITYID
   DELETE SecurityDetails

    WHERE  TIMEKEY = v_TIMEKEY;
   INSERT INTO SecurityDetails
     ( REFCustomerId, TotalSecurity, TIMEKEY )
     ( SELECT REFCustomerId ,
              SUM(NVL(CurntQtrRv, 0))  TotalSecurity  ,
              v_TIMEKEY TIMEKEY  
       FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL a
        WHERE  NVL(CurntQtrRv, 0) > 0
         GROUP BY REFCUSTOMERID );
   ----------      /*TempTableForSecurity  being create */                      
   IF utils.object_id('SECURITYDETAIL') IS NOT NULL THEN
    ----SET @TIMEKEY= (SELECT TIMEKEY FROM SYSDAYMATRIX WHERE TIMEKEY=@TIMEKEY)		
   EXECUTE IMMEDIATE ' TRUNCATE TABLE SECURITYDETAIL ';
   END IF;
   INSERT INTO SECURITYDETAIL
     ( SELECT REFCustomerId ,
              SUM(NVL(TOTALSECURITY, 0))  TOTALSECURITY  
       FROM SECURITYDETAILS 
        WHERE  TIMEKEY = v_TIMEKEY
         GROUP BY REFCustomerId );
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET ApprRV = 0;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.FlgSecured, B.FlgSecured
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN AdvAcBasicDetail B   ON B.EffectiveFromTimeKey <= v_TIMEKEY
          AND B.EffectiveToTimeKey >= v_TIMEKEY
          AND A.AccountEntityID = B.AccountEntityId ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.FlgSecured = src.FlgSecured,
                                A.SecApp = src.FlgSecured;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'D'
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID
          AND NVL(CurntQtrRv, 0) > 0 
    WHERE FlgSecured = 'S') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.FlgSecured = 'D';
   WITH CTE ( REFCUSTOMERID,
              TOTOSFUNDED ) AS ( SELECT B.REFCUSTOMERID ,
                                        SUM(NVL(A.NETBALANCE, 0))  TOTOSFUNDED  
     FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
            JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID
    WHERE  A.NETBALANCE > 0
             AND A.FlgAbinitio <> 'Y'
             AND A.FinalAssetClassAlt_Key <> 6
             AND A.FlgSecured = 'D'
     GROUP BY B.REFCUSTOMERID ) 
      MERGE INTO D 
      USING (SELECT D.ROWID row_id, ((D.NETBALANCE / A.TOTOSFUNDED) * C.TOTALSECURITY) AS ApprRV
      FROM D ,CTE A
             JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.REFCUSTOMERID = B.REFCUSTOMERID
             JOIN SecurityDetail C   ON C.REFCustomerId = B.REFCUSTOMERID
             JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL D   ON D.RefCustomerID = B.RefCustomerID 
       WHERE c.TotalSecurity > 0
        AND D.FlgAbinitio <> 'Y'
        AND D.FinalAssetClassAlt_Key <> 6
        AND D.FlgSecured = 'D') src
      ON ( D.ROWID = src.row_id )
      WHEN MATCHED THEN UPDATE SET D.ApprRV
                                   --CASE WHEN  ((D.NETBALANCE/A.TOTOSFUNDED)*C.TOTALSECURITY)>D.NETBALANCE THEN D.NETBALANCE       
                                    --ELSE ((D.NETBALANCE/A.TOTOSFUNDED)*C.TOTALSECURITY) END                                           
                                    = src.ApprRV
      ;
   --UPDATE A SET ApprRV=NETBALANCE FROM pro.AccountCal  A
   --WHERE A.FlgAbinitio<>'Y'
   --AND A.FinalAssetClassAlt_Key<>6
   --AND A.FlgSecured='S'
   ----UPDATE B SET SecApp='S'
   ----FROM  PRO.AccountCal B 
   ----WHERE ISNULL(SecurityValue,0)>0 AND B.SecApp='U' AND ISNULL(B.BALANCE,0)>0 
   ----UPDATE B SET FlgSecured='D'
   ----FROM  PRO.AccountCal B 
   ----WHERE ISNULL(SecurityValue,0)>0 AND B.FlgSecured='U' AND ISNULL(B.BALANCE,0)>0 
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET FinalNpaDt = InitialNpaDt
    WHERE  FinalAssetClassAlt_Key > 1
     AND FinalNpaDt IS NULL;
   UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
      SET SysNPA_Dt = SrcNPA_Dt
    WHERE  SysAssetClassAlt_Key > 1
     AND SysNPA_Dt IS NULL;
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET FinalNpaDt = InitialNpaDt
    WHERE  FinalAssetClassAlt_Key > 1
     AND FinalNpaDt IS NULL;
   UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
      SET SysNPA_Dt = NULL
    WHERE  SysAssetClassAlt_Key = 1
     AND SysNPA_Dt IS NOT NULL;
   UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
      SET SrcNPA_Dt = NULL
    WHERE  SrcAssetClassAlt_Key = 1
     AND SrcNPA_Dt IS NOT NULL;
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET FinalNpaDt = NULL
    WHERE  FinalAssetClassAlt_Key = 1
     AND FinalNpaDt IS NOT NULL;
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET InitialNpaDt = NULL
    WHERE  InitialAssetClassAlt_Key = 1
     AND InitialNpaDt IS NOT NULL;--update pro.CustomerCal set SrcNPA_Dt=NULL where SrcAssetClassAlt_Key=1 and SrcNPA_Dt is NOT null
   --DROP TABLE #Moc_Cust

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_25042023" TO "ADF_CDR_RBL_STGDB";
