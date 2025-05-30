--------------------------------------------------------
--  DDL for Procedure INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" 
(
  iv_TIMEKEY IN NUMBER
)
AS
   v_TIMEKEY NUMBER(10,0) := iv_TIMEKEY;
   v_ProcessingDate VARCHAR2(200) := ( SELECT DATE_ 
     FROM SYSDAYMATRIX 
    WHERE  TIMEKEY = v_TIMEKEY );
   v_SetID NUMBER(10,0) := ( SELECT NVL(MAX(NVL(SETID, 0)) , 0) + 1 
     FROM PRO_RBL_MISDB_PROD.ProcessMonitor 
    WHERE  TimeKey = v_TIMEKEY );

BEGIN

   SELECT TIMEKEY 

     INTO v_TIMEKEY
     FROM SYSDAYMATRIX 
    WHERE  TIMEKEY = v_TIMEKEY;
   EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.CUSTOMERCAL ';
   EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.ACCOUNTCAL ';
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntService int
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_NoCredit int
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdrawn int
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdue int
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Renewal int
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_StockStmt int
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Max int 
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_FinMaxType varchar(50)
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_SMA int 
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_PrincOverdue int
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntOverdueSince int
   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_OtherOverdueSince int
   --;WITH CTE_CUSTCAL
   --	AS
   --(	SELECT A.* 
   -- FROM PRO.CUSTOMERCAL_HIST A
   --	INNER JOIN #CustMocData B
   --		ON (A.EffectiveFromTimeKey<=@TimeKey AND A.EffectiveToTimeKey>=@TimeKey)
   --		AND A.RefCustomerID=B.CustomerID
   --		AND FlgMoc='Y'
   -- )
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.UCIF_ID, B.UcifEntityID
   FROM A ,PreMoc_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN PRO_RBL_MISDB_PROD.CustomerCal_Hist B   ON ( A.EffectiveFromTimeKey = v_TIMEKEY
          AND A.EffectiveToTimeKey >= v_TIMEKEY )
          AND ( B.EffectiveFromTimeKey = v_TIMEKEY
          AND B.EffectiveToTimeKey >= v_TIMEKEY )
          AND A.CustomerEntityID = B.CustomerEntityID ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.UCIF_ID = src.UCIF_ID,
                                A.UcifEntityID = src.UcifEntityID;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.UCIF_ID, B.UcifEntityID
   FROM A ,PreMoc_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN PRO_RBL_MISDB_PROD.AccountCal_Hist B   ON ( A.EffectiveFromTimeKey = v_TIMEKEY
          AND A.EffectiveToTimeKey >= v_TIMEKEY )
          AND ( B.EffectiveFromTimeKey = v_TIMEKEY
          AND B.EffectiveToTimeKey >= v_TIMEKEY )
          AND A.AccountEntityID = B.AccountEntityID ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.UCIF_ID = src.UCIF_ID,
                                A.UcifEntityID = src.UcifEntityID;
   IF  --SQLDEV: NOT RECOGNIZED
   IF tt_Moc_Cust  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_Moc_Cust;
   UTILS.IDENTITY_RESET('tt_Moc_Cust');

   INSERT INTO tt_Moc_Cust ( 
   	SELECT UcifEntityID ,
           MAX(SysAssetClassAlt_Key)  SysAssetClassAlt_Key  ,
           MIN(SysNPA_Dt)  SysNPA_Dt  ,
           'N' AssetClassChanged  ,
           0 PreMoc_SysAssetClassAlt_Key  ,
           UTILS.CONVERT_TO_VARCHAR2('',10) MocType  
   	  FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist 
   	 WHERE  EffectiveFromTimeKey = v_TIMEKEY
              AND EffectiveToTimeKey = v_TIMEKEY
              AND FlgMoc = 'Y'
   	  GROUP BY UcifEntityID );
   INSERT INTO tt_Moc_Cust
     ( UcifEntityID )
     ( SELECT A.UcifEntityID 
       FROM PRO_RBL_MISDB_PROD.AccountCal_Hist A
              LEFT JOIN tt_Moc_Cust B   ON A.UcifEntityID = B.UcifEntityID
        WHERE  EffectiveFromTimeKey = v_TIMEKEY
                 AND EffectiveToTimeKey = v_TIMEKEY
                 AND FlgMoc = 'Y'
                 AND B.UcifEntityID IS NULL
         GROUP BY A.UcifEntityID );
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'N', CASE 
   WHEN A.SysAssetClassAlt_Key = 0 THEN B.SysAssetClassAlt_Key
   ELSE A.SysAssetClassAlt_Key
      END AS pos_3, CASE 
   WHEN A.SysNPA_Dt IS NULL THEN B.SysNPA_Dt
   ELSE A.SysNPA_Dt
      END AS pos_4, b.SysAssetClassAlt_Key
   FROM A ,tt_Moc_Cust A
          JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.UcifEntityID = B.UcifEntityID
          AND B.EffectiveFromTimeKey <= v_TIMEKEY
          AND B.EffectiveToTimeKey >= v_TIMEKEY ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.AssetClassChanged = 'N',
                                A.SysAssetClassAlt_Key = pos_3,
                                A.SysNPA_Dt = pos_4,
                                a.PreMoc_SysAssetClassAlt_Key = src.SysAssetClassAlt_Key;
   MERGE INTO a 
   USING (SELECT a.ROWID row_id, B.MOCTYPE
   FROM a ,tt_Moc_Cust a
          JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON B.EffectiveFromTimeKey = v_TIMEKEY
          AND B.EffectiveToTimeKey = v_TIMEKEY
          AND A.UcifEntityID = B.UcifEntityID
          AND B.FlgMoc = 'Y' ) src
   ON ( a.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.MocType = src.MOCTYPE;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.MocType
   FROM A ,tt_Moc_Cust A
          JOIN tt_Moc_Cust B   ON A.UcifEntityID = B.UcifEntityID
          AND B.MocType = 'Manual' ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.MocType = src.MocType;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.SysAssetClassAlt_Key, B.SysNPA_Dt
   FROM A ,tt_Moc_Cust A
          JOIN ( SELECT tt_Moc_Cust.UcifEntityID ,
                        tt_Moc_Cust.SysAssetClassAlt_Key ,
                        tt_Moc_Cust.SysNPA_Dt 
                 FROM tt_Moc_Cust 
                  WHERE  tt_Moc_Cust.SysAssetClassAlt_Key IS NOT NULL
                   GROUP BY tt_Moc_Cust.UcifEntityID,tt_Moc_Cust.SysAssetClassAlt_Key,tt_Moc_Cust.SysNPA_Dt ) B   ON A.UcifEntityID = B.UcifEntityID ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = src.SysAssetClassAlt_Key,
                                A.SysNPA_Dt = src.SysNPA_Dt;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, b.SysAssetClassAlt_Key
   FROM A ,tt_Moc_Cust A
          JOIN PreMoc_RBL_MISDB_PROD.CUSTOMERCAL B   ON B.EffectiveFromTimeKey = v_TIMEKEY
          AND B.EffectiveToTimeKey = v_TIMEKEY
          AND A.UcifEntityID = B.UcifEntityID ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET a.PreMoc_SysAssetClassAlt_Key = src.SysAssetClassAlt_Key;-- CHECK UCIFENTITYID TO BE UPDATE
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
              A.TotProvision ,
              A.RBITotProvision ,
              A.BankTotProvision ,
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
              A.FlgMoc ,
              A.FlgSMA ,
              A.FlgProcessing ,
              A.FlgErosion ,
              A.FlgPNPA ,
              A.FlgPercolation ,
              A.FlgInMonth ,
              A.FlgDirtyRow ,
              A.DegDate ,
              A.EffectiveFromTimeKey ,
              A.EffectiveToTimeKey ,
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
              JOIN tt_Moc_Cust B   ON A.UcifEntityID = B.UcifEntityID
        WHERE  EffectiveFromTimeKey = v_TIMEKEY
                 AND EffectiveToTimeKey = v_TIMEKEY );
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
              A.Provsecured ,
              A.ProvUnsecured ,
              A.ProvCoverGovGur ,
              A.AddlProvision ,
              A.TotalProvision ,
              A.BankProvsecured ,
              A.BankProvUnsecured ,
              A.BankTotalProvision ,
              A.RBIProvsecured ,
              A.RBIProvUnsecured ,
              A.RBITotalProvision ,
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
              A.FlgMoc ,
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
              A.EffectiveFromTimeKey ,
              A.EffectiveToTimeKey ,
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
              JOIN tt_Moc_Cust B   ON A.UcifEntityID = B.UcifEntityID
        WHERE  EffectiveFromTimeKey <= v_TIMEKEY
                 AND EffectiveToTimeKey >= v_TIMEKEY );
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.SysAssetClassAlt_Key, B.SysNPA_Dt, 'Y', CASE 
   WHEN B.MocType = 'Manual' THEN 'ALWYS_NPA'
   ELSE 'NORMAL'
      END AS pos_5, 'NPA DUE TO MOC' AS pos_6, B.MOCTYPE
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN tt_Moc_Cust B   ON A.UcifEntityID = B.UcifEntityID
          JOIN DimAssetClass C   ON C.EffectiveFromTimeKey <= v_TIMEKEY
          AND c.EffectiveToTimeKey >= v_TIMEKEY
          AND c.AssetClassAlt_Key = b.PreMoc_SysAssetClassAlt_Key
          JOIN DimAssetClass D   ON D.EffectiveFromTimeKey <= v_TIMEKEY
          AND D.EffectiveToTimeKey >= v_TIMEKEY
          AND D.AssetClassAlt_Key = b.SysAssetClassAlt_Key 
    WHERE C.AssetClassGroup = 'STD'
     AND D.AssetClassGroup = 'NPA') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.SysAssetClassAlt_Key,
                                A.SYSNPA_DT = src.SysNPA_Dt,
                                A.FLGMOC = 'Y',
                                A.ASSET_NORM
                                ---,A.MOCREASON=B.MOCREASON  --- NEED TO UPDATE IN MOC SCREEN SP
                                 = pos_5,
                                A.DEGREASON
                                ---,A.MOC_DT=B.DATECREATED  
                                 = pos_6,
                                A.MOCTYPE = src.MOCTYPE;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.SysAssetClassAlt_Key, NULL, NULL, NULL, NULL, NULL, 'Y', CASE 
   WHEN B.MocType = 'Manual' THEN 'ALWYS_STD'
   ELSE 'NORMAL'
      END AS pos_9, 'STD DUE TO MOC' AS pos_10, B.MOCTYPE
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN tt_Moc_Cust B   ON A.UcifEntityID = B.UcifEntityID
          JOIN DimAssetClass C   ON C.EffectiveFromTimeKey <= v_TIMEKEY
          AND c.EffectiveToTimeKey >= v_TIMEKEY
          AND c.AssetClassAlt_Key = b.PreMoc_SysAssetClassAlt_Key
          JOIN DimAssetClass D   ON D.EffectiveFromTimeKey <= v_TIMEKEY
          AND D.EffectiveToTimeKey >= v_TIMEKEY
          AND D.AssetClassAlt_Key = b.SysAssetClassAlt_Key 
    WHERE C.AssetClassGroup = 'NPA'
     AND D.AssetClassGroup = 'STD') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.SysAssetClassAlt_Key,
                                A.SYSNPA_DT = NULL,
                                A.DbtDt = NULL,
                                A.DbtDt2 = NULL,
                                A.DbtDt3 = NULL,
                                A.LossDt = NULL,
                                A.FLGMOC = 'Y',
                                A.ASSET_NORM
                                ---,A.MOCREASON=B.MOCREASON  --- NEED TO UPDATE IN MOC SCREEN SP
                                 = pos_9,
                                A.DEGREASON
                                ---,A.MOC_DT=B.DATECREATED  
                                 = pos_10,
                                A.MOCTYPE = src.MOCTYPE;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.SysAssetClassAlt_Key, B.SysNPA_Dt, 'Y', 'NORMAL'
   ---,A.MOCREASON=B.MOCREASON  --- NEED TO UPDATE IN MOC SCREEN SP
    -----,DEGREASON='NPA DUE TO MOC'
    ---,A.MOC_DT=B.DATECREATED  
   , B.MOCTYPE
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN tt_Moc_Cust B   ON A.UcifEntityID = B.UcifEntityID
          JOIN DimAssetClass C   ON C.EffectiveFromTimeKey <= v_TIMEKEY
          AND c.EffectiveToTimeKey >= v_TIMEKEY
          AND c.AssetClassAlt_Key = b.PreMoc_SysAssetClassAlt_Key
          JOIN DimAssetClass D   ON D.EffectiveFromTimeKey <= v_TIMEKEY
          AND D.EffectiveToTimeKey >= v_TIMEKEY
          AND D.AssetClassAlt_Key = b.SysAssetClassAlt_Key 
    WHERE C.AssetClassGroup = 'NPA'
     AND D.AssetClassGroup = 'NPA') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.SysAssetClassAlt_Key,
                                A.SYSNPA_DT = src.SysNPA_Dt,
                                A.FLGMOC = 'Y',
                                A.ASSET_NORM = 'NORMAL',
                                A.MOCTYPE = src.MOCTYPE;
   /* ACCOUNT LEVEL DATA UPDATE */
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.SysAssetClassAlt_Key, B.SysNPA_Dt, 'Y', CASE 
   WHEN B.MocType = 'Manual' THEN 'ALWYS_NPA'
   ELSE 'NORMAL'
      END AS pos_5, B.MOCTYPE
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN tt_Moc_Cust B   ON A.UcifEntityID = B.UcifEntityID
          JOIN DimAssetClass C   ON C.EffectiveFromTimeKey <= v_TIMEKEY
          AND c.EffectiveToTimeKey >= v_TIMEKEY
          AND c.AssetClassAlt_Key = b.PreMoc_SysAssetClassAlt_Key
          JOIN DimAssetClass D   ON D.EffectiveFromTimeKey <= v_TIMEKEY
          AND D.EffectiveToTimeKey >= v_TIMEKEY
          AND D.AssetClassAlt_Key = b.SysAssetClassAlt_Key 
    WHERE C.AssetClassGroup = 'STD'
     AND D.AssetClassGroup = 'NPA') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.SysAssetClassAlt_Key,
                                A.FinalNpaDt = src.SysNPA_Dt,
                                A.FlgMoc = 'Y',
                                A.ASSET_NORM = pos_5,
                                A.MOCTYPE = src.MOCTYPE;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.SysAssetClassAlt_Key, NULL, 'Y', CASE 
   WHEN B.MocType = 'Manual' THEN 'ALWYS_STD'
   ELSE 'NORMAL'
      END AS pos_5, B.MOCTYPE
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN tt_Moc_Cust B   ON A.UcifEntityID = B.UcifEntityID
          JOIN DimAssetClass C   ON C.EffectiveFromTimeKey <= v_TIMEKEY
          AND c.EffectiveToTimeKey >= v_TIMEKEY
          AND c.AssetClassAlt_Key = b.PreMoc_SysAssetClassAlt_Key
          JOIN DimAssetClass D   ON D.EffectiveFromTimeKey <= v_TIMEKEY
          AND D.EffectiveToTimeKey >= v_TIMEKEY
          AND D.AssetClassAlt_Key = b.SysAssetClassAlt_Key 
    WHERE C.AssetClassGroup = 'NPA'
     AND D.AssetClassGroup = 'STD') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.SysAssetClassAlt_Key,
                                A.FinalNpaDt = NULL,
                                A.FlgMoc = 'Y',
                                A.ASSET_NORM = pos_5,
                                A.MOCTYPE = src.MOCTYPE;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.SysAssetClassAlt_Key, B.SysNPA_Dt, 'Y', 'NORMAL', B.MOCTYPE
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN tt_Moc_Cust B   ON A.UcifEntityID = B.UcifEntityID
          JOIN DimAssetClass C   ON C.EffectiveFromTimeKey <= v_TIMEKEY
          AND c.EffectiveToTimeKey >= v_TIMEKEY
          AND c.AssetClassAlt_Key = b.PreMoc_SysAssetClassAlt_Key
          JOIN DimAssetClass D   ON D.EffectiveFromTimeKey <= v_TIMEKEY
          AND D.EffectiveToTimeKey >= v_TIMEKEY
          AND D.AssetClassAlt_Key = b.SysAssetClassAlt_Key 
    WHERE C.AssetClassGroup = 'NPA'
     AND D.AssetClassGroup = 'NPA') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.SysAssetClassAlt_Key,
                                A.FinalNpaDt = src.SysNPA_Dt,
                                A.FlgMoc = 'Y',
                                A.ASSET_NORM = 'NORMAL',
                                A.MOCTYPE = src.MOCTYPE;
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
   /* SECURITY APPROPRIATE CUSTOMER TO ACCOUNT LEVEL*/
   WITH CTE ( REFCUSTOMERID,
              TOTOSFUNDED ) AS ( SELECT CustomerEntityID ,
                                        SUM(NVL(A.BALANCE, 0))  TOTOSFUNDED  
     FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
    WHERE  A.BALANCE > 0
             AND EffectiveFromTimeKey = v_TIMEKEY
             AND EffectiveToTimeKey = v_TIMEKEY
     GROUP BY CustomerEntityID ) 
      MERGE INTO D 
      USING (SELECT D.ROWID row_id, CASE 
      WHEN ((D.NETBALANCE / A.TOTOSFUNDED) * B.CurntQtrRv) > D.NETBALANCE THEN D.NETBALANCE
      ELSE ((D.NETBALANCE / A.TOTOSFUNDED) * B.CurntQtrRv)
         END AS SecurityValue
      FROM D ,CTE A
             JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.REFCUSTOMERID = B.REFCUSTOMERID
             AND B.EffectiveFromTimeKey = v_TIMEKEY
             AND B.EffectiveToTimeKey = v_TIMEKEY
             JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL D   ON D.RefCustomerID = B.RefCustomerID
             AND D.EffectiveFromTimeKey = v_TIMEKEY
             AND D.EffectiveToTimeKey = v_TIMEKEY 
       WHERE B.CurntQtrRv > 0) src
      ON ( D.ROWID = src.row_id )
      WHEN MATCHED THEN UPDATE SET D.SecurityValue = src.SecurityValue
      ;
   --UPDATE A SET A.AddlProvision=(A.Balance * A.AddlProvisionPer)/100
   --   FROM PRO.AccountCal A
   -- INNER JOIN PRO.CUSTOMERCAL B ON A.CustomerAcID=B.CustomerAcID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --	AND B.AdditionalProvision>=0
   MERGE INTO B 
   USING (SELECT B.ROWID row_id, 'S'
   FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL B 
    WHERE NVL(SecurityValue, 0) > 0
     AND B.SecApp = 'U'
     AND NVL(B.Balance, 0) > 0) src
   ON ( B.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET SecApp = 'S';
   MERGE INTO B 
   USING (SELECT B.ROWID row_id, 'D'
   FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL B 
    WHERE NVL(SecurityValue, 0) > 0
     AND B.FlgSecured = 'U'
     AND NVL(B.Balance, 0) > 0) src
   ON ( B.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET FlgSecured = 'D';
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET FinalNpaDt = InitialNpaDt
    WHERE  FinalAssetClassAlt_Key > 1
     AND FinalNpaDt IS NULL;
   UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
      SET SysNPA_Dt = SrcNPA_Dt
    WHERE  SysAssetClassAlt_Key > 1
     AND SysNPA_Dt IS NULL;
   EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Moc_Cust ';

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_A" TO "ADF_CDR_RBL_STGDB";
