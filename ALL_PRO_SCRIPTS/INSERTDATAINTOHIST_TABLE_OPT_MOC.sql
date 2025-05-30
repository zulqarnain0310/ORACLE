--------------------------------------------------------
--  DDL for Procedure INSERTDATAINTOHIST_TABLE_OPT_MOC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" 
(
  v_TIMEKEY IN NUMBER
)
AS
   /* INSERT DATA FOR MOC TIMEKEY - THOSE RECORDS ARE NOT PRESENT ON MIC TIMKEY AFTER EXPIRE */
   /*  New Customers Ac Key ID Update  */
   v_EntityKeyCust NUMBER(19,0) := 0;
   --LEFT JOIN PRO.CustomerCal_Hist B
   --	 ON B.EffectiveFromTimeKey=@TIMEKEY AND B.EffectiveToTimeKey=@TIMEKEY
   --	 AND B.CustomerEntityID =T.CustomerEntityID
   -----WHERE t.CustomerEntityID not in (select a.CustomerEntityID from pro.CUSTOMERCAL_hist a where EffectiveFromTimeKey=@TIMEKEY and EffectiveToTimeKey=@TIMEKEY )--and t.CustomerEntityID=a.CustomerEntityID )
   /* INSERT RECORD FOR  LIVE AFTE MOC TIMEKEY - IN THIS CASE EFFECTIVEFROMTIMEKEY WILL BE @TIMEKEY+1 AND EFFECTIVETOTIMEKEY WIL BE RMAIL SAME */
   /*  New Customers Ac Key ID Update  */
   v_EntityKeyCust1 NUMBER(19,0) := 0;
   /* INSERT DATA FOR MOC TIMEKEY - THOSE RECORDS ARE NOT PRESENT ON MIC TIMKEY AFTER EXPIRE */
   /*  New Customers Ac Key ID Update  */
   v_EntityKeyAcct NUMBER(19,0) := 0;
   /* INSERT RECORD FOR  LIVE AFTE MOC TIMEKEY - IN THIS CASE EFFECTIVEFROMTIMEKEY WILL BE @TIMEKEY+1 AND EFFECTIVETOTIMEKEY WIL BE RMAIL SAME */
   /*  New Customers Ac Key ID Update  */
   v_EntityKeyAcct1 NUMBER(19,0) := 0;
   /* INSERT DATA FOR MOC TIMEKEY - THOSE RECORDS ARE NOT PRESENT ON MIC TIMKEY AFTER EXPIRE */
   /*  New Customers Ac Key ID Update  */
   v_EntityKeyRestr NUMBER(19,0) := 0;
   --LEFT JOIN PRO.CustomerCal_Hist B
   --	 ON B.EffectiveFromTimeKey=@TIMEKEY AND B.EffectiveToTimeKey=@TIMEKEY
   --	 AND B.CustomerEntityID =T.CustomerEntityID
   -----WHERE t.CustomerEntityID not in (select a.CustomerEntityID from pro.CUSTOMERCAL_hist a where EffectiveFromTimeKey=@TIMEKEY and EffectiveToTimeKey=@TIMEKEY )--and t.CustomerEntityID=a.CustomerEntityID )
   /* INSERT RECORD FOR  LIVE AFTE MOC TIMEKEY - IN THIS CASE EFFECTIVEFROMTIMEKEY WILL BE @TIMEKEY+1 AND EFFECTIVETOTIMEKEY WIL BE RMAIL SAME */
   /*  New Customers Ac Key ID Update  */
   v_EntityKeyRestr1 NUMBER(19,0) := 0;

BEGIN

   UPDATE tt_CUSTOMERCAL_20
      SET IsChanged = NULL;
   UPDATE tt_AccountCal_21
      SET IsChanged = NULL;
   DELETE FROM tt_CustomerCal_Moc;
   UTILS.IDENTITY_RESET('tt_CustomerCal_Moc');

   INSERT INTO tt_CustomerCal_Moc ( 
   	SELECT A.* ,
           UTILS.CONVERT_TO_NUMBER(0,19,0) EntityKeyNew  
   	  FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist A
             JOIN tt_CUSTOMERCAL_20 B   ON A.CustomerEntityID = B.CustomerEntityID
             AND A.EffectiveFromTimeKey <= v_TIMEKEY
             AND A.EffectiveToTimeKey >= v_TIMEKEY );
   /* EXPIRE RECORDS ARE LIVE FROM PREV EFFECTIVEFROTIMEKEY TO MOC OT GRATER THAN MOC TIMKEY*/
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, CASE 
   WHEN a.EffectiveFromTimeKey < v_TIMEKEY THEN v_TIMEKEY - 1
   ELSE v_TIMEKEY
      END AS EffectiveToTimeKey
   FROM A ,PRO_RBL_MISDB_PROD.CustomerCal_Hist A
          JOIN tt_CUSTOMERCAL_20 B   ON A.CustomerEntityID = B.CustomerEntityID
          AND A.EffectiveFromTimeKey <= v_TIMEKEY
          AND A.EffectiveToTimeKey >= v_TIMEKEY ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.EffectiveToTimeKey = src.EffectiveToTimeKey;
   /* UPADTE DATA AVAILABLE ON SAME TMEKEY */
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, T.BranchCode, T.UCIF_ID, T.UcifEntityID, T.ParentCustomerID, T.RefCustomerID, T.SourceSystemCustomerID, T.CustomerName, T.CustSegmentCode, T.ConstitutionAlt_Key, T.PANNO, T.AadharCardNO, T.SrcAssetClassAlt_Key, T.SysAssetClassAlt_Key, T.SplCatg1Alt_Key, T.SplCatg2Alt_Key, T.SplCatg3Alt_Key, T.SplCatg4Alt_Key, T.SMA_Class_Key, T.PNPA_Class_Key, T.PrvQtrRV, T.CurntQtrRv, T.TotProvision, T.BankTotProvision, T.RBITotProvision, T.SrcNPA_Dt, T.SysNPA_Dt, T.DbtDt, T.DbtDt2, T.DbtDt3, T.LossDt, T.MOC_Dt, T.ErosionDt, T.SMA_Dt, T.PNPA_Dt, T.Asset_Norm, T.FlgDeg, T.FlgUpg, T.FlgMoc, T.FlgSMA, T.FlgProcessing, T.FlgErosion, T.FlgPNPA, T.FlgPercolation, T.FlgInMonth, T.FlgDirtyRow, T.DegDate, T.CommonMocTypeAlt_Key, T.InMonthMark, T.MocStatusMark, T.SourceAlt_Key, T.BankAssetClass, T.Cust_Expo, T.MOCReason, T.AddlProvisionPer, T.FraudDt, T.FraudAmount, T.DegReason, T.CustMoveDescription, T.TotOsCust, T.MOCTYPE
   FROM O ,PRO_RBL_MISDB_PROD.CustomerCal_Hist O
          JOIN tt_CUSTOMERCAL_20 T   ON O.CustomerEntityId = T.CustomerEntityId 
    WHERE O.EffectiveFromTimeKey = v_TimeKey
     AND O.EffectiveToTimeKey = v_TIMEKEY) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET T.BranchCode = src.BranchCode,
                                T.UCIF_ID = src.UCIF_ID,
                                T.UcifEntityID = src.UcifEntityID,
                                T.ParentCustomerID = src.ParentCustomerID,
                                T.RefCustomerID = src.RefCustomerID,
                                T.SourceSystemCustomerID = src.SourceSystemCustomerID,
                                T.CustomerName = src.CustomerName,
                                T.CustSegmentCode = src.CustSegmentCode,
                                T.ConstitutionAlt_Key = src.ConstitutionAlt_Key,
                                T.PANNO = src.PANNO,
                                T.AadharCardNO = src.AadharCardNO,
                                T.SrcAssetClassAlt_Key = src.SrcAssetClassAlt_Key,
                                T.SysAssetClassAlt_Key = src.SysAssetClassAlt_Key,
                                T.SplCatg1Alt_Key = src.SplCatg1Alt_Key,
                                T.SplCatg2Alt_Key = src.SplCatg2Alt_Key,
                                T.SplCatg3Alt_Key = src.SplCatg3Alt_Key,
                                T.SplCatg4Alt_Key = src.SplCatg4Alt_Key,
                                T.SMA_Class_Key = src.SMA_Class_Key,
                                T.PNPA_Class_Key = src.PNPA_Class_Key,
                                T.PrvQtrRV = src.PrvQtrRV,
                                T.CurntQtrRv = src.CurntQtrRv,
                                T.TotProvision = src.TotProvision,
                                T.BankTotProvision = src.BankTotProvision,
                                T.RBITotProvision = src.RBITotProvision,
                                T.SrcNPA_Dt = src.SrcNPA_Dt,
                                T.SysNPA_Dt = src.SysNPA_Dt,
                                T.DbtDt = src.DbtDt,
                                T.DbtDt2 = src.DbtDt2,
                                T.DbtDt3 = src.DbtDt3,
                                T.LossDt = src.LossDt,
                                T.MOC_Dt = src.MOC_Dt,
                                T.ErosionDt = src.ErosionDt,
                                T.SMA_Dt = src.SMA_Dt,
                                T.PNPA_Dt = src.PNPA_Dt,
                                T.Asset_Norm = src.Asset_Norm,
                                T.FlgDeg = src.FlgDeg,
                                T.FlgUpg = src.FlgUpg,
                                T.FlgMoc = src.FlgMoc,
                                T.FlgSMA = src.FlgSMA,
                                T.FlgProcessing = src.FlgProcessing,
                                T.FlgErosion = src.FlgErosion,
                                T.FlgPNPA = src.FlgPNPA,
                                T.FlgPercolation = src.FlgPercolation,
                                T.FlgInMonth = src.FlgInMonth,
                                T.FlgDirtyRow = src.FlgDirtyRow,
                                T.DegDate = src.DegDate,
                                T.CommonMocTypeAlt_Key = src.CommonMocTypeAlt_Key,
                                T.InMonthMark = src.InMonthMark,
                                T.MocStatusMark = src.MocStatusMark,
                                T.SourceAlt_Key = src.SourceAlt_Key,
                                T.BankAssetClass = src.BankAssetClass,
                                T.Cust_Expo = src.Cust_Expo,
                                T.MOCReason = src.MOCReason,
                                T.AddlProvisionPer = src.AddlProvisionPer,
                                T.FraudDt = src.FraudDt,
                                T.FraudAmount = src.FraudAmount,
                                T.DegReason = src.DegReason,
                                T.CustMoveDescription = src.CustMoveDescription,
                                T.TotOsCust = src.TotOsCust,
                                T.MOCTYPE = src.MOCTYPE;
   SELECT MAX(EntityKey)  

     INTO v_EntityKeyCust
     FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist ;
   IF v_EntityKeyCust IS NULL THEN

   BEGIN
      v_EntityKeyCust := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKeyNew
   FROM TEMP ,tt_CUSTOMERCAL_20 TEMP
          JOIN ( SELECT tt_CUSTOMERCAL_20.CustomerEntityId ,
                        (v_EntityKeyCust + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                            FROM DUAL  )  )) EntityKeyNew  
                 FROM tt_CUSTOMERCAL_20 ---Where IsChanged in ('C','N')
                        ) ACCT   ON TEMP.CustomerEntityId = ACCT.CustomerEntityId ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKeyNew = src.EntityKeyNew;
   --WHERE Temp.IsChanged in ('C','N')
   MERGE INTO T 
   USING (SELECT T.ROWID row_id, 'Y'
   FROM T ,tt_CUSTOMERCAL_20 T
          LEFT JOIN PRO_RBL_MISDB_PROD.CustomerCal_Hist B   ON B.EffectiveFromTimeKey = v_TIMEKEY
          AND B.EffectiveToTimeKey = v_TIMEKEY
          AND B.CustomerEntityId = T.CustomerEntityId 
    WHERE B.CustomerEntityId IS NULL) src
   ON ( T.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET t.IsChanged = 'Y';
   /***************************************************************************************************************/
   INSERT INTO PRO_RBL_MISDB_PROD.CustomerCal_Hist
     ( EntityKey, BranchCode, UCIF_ID, UcifEntityID, CustomerEntityID, ParentCustomerID, RefCustomerID, SourceSystemCustomerID, CustomerName, CustSegmentCode, ConstitutionAlt_Key, PANNO, AadharCardNO, SrcAssetClassAlt_Key, SysAssetClassAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SMA_Class_Key, PNPA_Class_Key, PrvQtrRV, CurntQtrRv, TotProvision, BankTotProvision, RBITotProvision, SrcNPA_Dt, SysNPA_Dt, DbtDt, DbtDt2, DbtDt3, LossDt, MOC_Dt, ErosionDt, SMA_Dt, PNPA_Dt, Asset_Norm, FlgDeg, FlgUpg, FlgMoc, FlgSMA, FlgProcessing, FlgErosion, FlgPNPA, FlgPercolation, FlgInMonth, FlgDirtyRow, DegDate, EffectiveFromTimeKey, EffectiveToTimeKey, CommonMocTypeAlt_Key, InMonthMark, MocStatusMark, SourceAlt_Key, BankAssetClass, Cust_Expo, MOCReason, AddlProvisionPer, FraudDt, FraudAmount, DegReason, CustMoveDescription, TotOsCust, MOCTYPE, ChangeFld, ScreenFlag )
     ( SELECT T.EntityKeyNew ,
              T.BranchCode ,
              T.UCIF_ID ,
              T.UcifEntityID ,
              T.CustomerEntityID ,
              T.ParentCustomerID ,
              T.RefCustomerID ,
              T.SourceSystemCustomerID ,
              T.CustomerName ,
              T.CustSegmentCode ,
              T.ConstitutionAlt_Key ,
              T.PANNO ,
              T.AadharCardNO ,
              T.SrcAssetClassAlt_Key ,
              T.SysAssetClassAlt_Key ,
              T.SplCatg1Alt_Key ,
              T.SplCatg2Alt_Key ,
              T.SplCatg3Alt_Key ,
              T.SplCatg4Alt_Key ,
              T.SMA_Class_Key ,
              T.PNPA_Class_Key ,
              T.PrvQtrRV ,
              T.CurntQtrRv ,
              T.TotProvision ,
              T.BankTotProvision ,
              T.RBITotProvision ,
              T.SrcNPA_Dt ,
              T.SysNPA_Dt ,
              T.DbtDt ,
              T.DbtDt2 ,
              T.DbtDt3 ,
              T.LossDt ,
              T.MOC_Dt ,
              T.ErosionDt ,
              T.SMA_Dt ,
              T.PNPA_Dt ,
              T.Asset_Norm ,
              T.FlgDeg ,
              T.FlgUpg ,
              T.FlgMoc ,
              T.FlgSMA ,
              T.FlgProcessing ,
              T.FlgErosion ,
              T.FlgPNPA ,
              T.FlgPercolation ,
              T.FlgInMonth ,
              T.FlgDirtyRow ,
              T.DegDate ,
              v_TIMEKEY EffectiveFromTimeKey  ,
              v_TIMEKEY EffectiveToTimeKey  ,
              t.CommonMocTypeAlt_Key ,
              t.InMonthMark ,
              t.MocStatusMark ,
              t.SourceAlt_Key ,
              t.BankAssetClass ,
              t.Cust_Expo ,
              t.MOCReason ,
              t.AddlProvisionPer ,
              t.FraudDt ,
              t.FraudAmount ,
              t.DegReason ,
              t.CustMoveDescription ,
              t.TotOsCust ,
              t.MOCTYPE ,
              NULL ChangeFld  ,
              NULL ScreenFlag  
       FROM tt_CUSTOMERCAL_20 T
        WHERE  t.IsChanged = 'Y' );
   SELECT MAX(EntityKey)  

     INTO v_EntityKeyCust1
     FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist ;
   IF v_EntityKeyCust IS NULL THEN

   BEGIN
      v_EntityKeyCust1 := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKeyNew
   FROM TEMP ,tt_CustomerCal_Moc TEMP
          JOIN ( SELECT tt_CustomerCal_Moc.CustomerEntityId ,
                        (v_EntityKeyCust1 + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                             FROM DUAL  )  )) EntityKeyNew  
                 FROM tt_CustomerCal_Moc ---Where IsChanged in ('C','N')
                        ) ACCT   ON TEMP.CustomerEntityId = ACCT.CustomerEntityId ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKeyNew = src.EntityKeyNew;
   --WHERE Temp.IsChanged in ('C','N')
   INSERT INTO PRO_RBL_MISDB_PROD.CustomerCal_Hist
     ( EntityKey, BranchCode, UCIF_ID, UcifEntityID, CustomerEntityID, ParentCustomerID, RefCustomerID, SourceSystemCustomerID, CustomerName, CustSegmentCode, ConstitutionAlt_Key, PANNO, AadharCardNO, SrcAssetClassAlt_Key, SysAssetClassAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SMA_Class_Key, PNPA_Class_Key, PrvQtrRV, CurntQtrRv, TotProvision, BankTotProvision, RBITotProvision, SrcNPA_Dt, SysNPA_Dt, DbtDt, DbtDt2, DbtDt3, LossDt, MOC_Dt, ErosionDt, SMA_Dt, PNPA_Dt, Asset_Norm, FlgDeg, FlgUpg, FlgMoc, FlgSMA, FlgProcessing, FlgErosion, FlgPNPA, FlgPercolation, FlgInMonth, FlgDirtyRow, DegDate, EffectiveFromTimeKey, EffectiveToTimeKey, CommonMocTypeAlt_Key, InMonthMark, MocStatusMark, SourceAlt_Key, BankAssetClass, Cust_Expo, MOCReason, AddlProvisionPer, FraudDt, FraudAmount, DegReason, CustMoveDescription, TotOsCust, MOCTYPE, ChangeFld, ScreenFlag )
     ( SELECT T.EntityKeyNew ,
              T.BranchCode ,
              T.UCIF_ID ,
              T.UcifEntityID ,
              T.CustomerEntityID ,
              T.ParentCustomerID ,
              T.RefCustomerID ,
              T.SourceSystemCustomerID ,
              T.CustomerName ,
              T.CustSegmentCode ,
              T.ConstitutionAlt_Key ,
              T.PANNO ,
              T.AadharCardNO ,
              T.SrcAssetClassAlt_Key ,
              T.SysAssetClassAlt_Key ,
              T.SplCatg1Alt_Key ,
              T.SplCatg2Alt_Key ,
              T.SplCatg3Alt_Key ,
              T.SplCatg4Alt_Key ,
              T.SMA_Class_Key ,
              T.PNPA_Class_Key ,
              T.PrvQtrRV ,
              T.CurntQtrRv ,
              T.TotProvision ,
              T.BankTotProvision ,
              T.RBITotProvision ,
              T.SrcNPA_Dt ,
              T.SysNPA_Dt ,
              T.DbtDt ,
              T.DbtDt2 ,
              T.DbtDt3 ,
              T.LossDt ,
              T.MOC_Dt ,
              T.ErosionDt ,
              T.SMA_Dt ,
              T.PNPA_Dt ,
              T.Asset_Norm ,
              T.FlgDeg ,
              T.FlgUpg ,
              T.FlgMoc ,
              T.FlgSMA ,
              T.FlgProcessing ,
              T.FlgErosion ,
              T.FlgPNPA ,
              T.FlgPercolation ,
              T.FlgInMonth ,
              T.FlgDirtyRow ,
              T.DegDate ,
              v_TIMEKEY + 1 EffectiveFromTimeKey  ,
              T.EffectiveToTimeKey ,
              T.CommonMocTypeAlt_Key ,
              T.InMonthMark ,
              T.MocStatusMark ,
              T.SourceAlt_Key ,
              T.BankAssetClass ,
              T.Cust_Expo ,
              T.MOCReason ,
              T.AddlProvisionPer ,
              T.FraudDt ,
              T.FraudAmount ,
              T.DegReason ,
              T.CustMoveDescription ,
              T.TotOsCust ,
              T.MOCTYPE ,
              NULL ChangeFld  ,
              NULL ScreenFlag  
       FROM tt_CustomerCal_Moc T
        WHERE  EffectiveToTimeKey > v_TIMEKEY );
   /* ACCOUNT - MOC */
   DELETE FROM tt_AccountCal_Moc;
   UTILS.IDENTITY_RESET('tt_AccountCal_Moc');

   INSERT INTO tt_AccountCal_Moc ( 
   	SELECT A.* ,
           UTILS.CONVERT_TO_NUMBER(0,19,0) EntityKeyNew  
   	  FROM PRO_RBL_MISDB_PROD.AccountCal_Hist A
             JOIN tt_AccountCal_21 B   ON A.AccountEntityID = B.AccountEntityID
             AND A.EffectiveFromTimeKey <= v_TIMEKEY
             AND A.EffectiveToTimeKey >= v_TIMEKEY );
   /* EXPIRE RECORDS ARE LIVE FROM PREV EFFECTIVEFROTIMEKEY TO MOC OT GRATER THAN MOC TIMKEY*/
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, CASE 
   WHEN a.EffectiveFromTimeKey < v_TIMEKEY THEN v_TIMEKEY - 1
   ELSE v_TIMEKEY
      END AS EffectiveToTimeKey
   FROM A ,PRO_RBL_MISDB_PROD.AccountCal_Hist A
          JOIN tt_AccountCal_21 B   ON A.AccountEntityID = B.AccountEntityID
          AND A.EffectiveFromTimeKey <= v_TIMEKEY
          AND A.EffectiveToTimeKey >= v_TIMEKEY ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.EffectiveToTimeKey = src.EffectiveToTimeKey;
   /* UPADTE DAT AVAILABLE ON SAME TMEKEY */
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, T.UcifEntityID, T.CustomerEntityID, T.CustomerAcID, T.RefCustomerID, T.SourceSystemCustomerID, T.UCIF_ID, T.BranchCode, T.FacilityType, T.AcOpenDt, T.FirstDtOfDisb, T.ProductAlt_Key, T.SchemeAlt_key, T.SubSectorAlt_Key, T.SplCatg1Alt_Key, T.SplCatg2Alt_Key, T.SplCatg3Alt_Key, T.SplCatg4Alt_Key, T.SourceAlt_Key, T.ActSegmentCode, T.InttRate, T.Balance, T.BalanceInCrncy, T.CurrencyAlt_Key, T.DrawingPower, T.CurrentLimit, T.CurrentLimitDt, T.ContiExcessDt, T.StockStDt, T.DebitSinceDt, T.LastCrDate, T.InttServiced, T.IntNotServicedDt, T.OverdueAmt, T.OverDueSinceDt, T.ReviewDueDt, T.SecurityValue, T.DFVAmt, T.GovtGtyAmt, T.CoverGovGur, T.WriteOffAmount, T.UnAdjSubSidy, T.CreditsinceDt, T.DegReason, T.Asset_Norm, T.REFPeriodMax, T.RefPeriodOverdue, T.RefPeriodOverDrawn, T.RefPeriodNoCredit, T.RefPeriodIntService, T.RefPeriodStkStatement, T.RefPeriodReview, T.NetBalance, T.ApprRV, T.SecuredAmt, T.UnSecuredAmt, T.ProvDFV, T.Provsecured, T.ProvUnsecured, T.ProvCoverGovGur, T.AddlProvision, T.TotalProvision, T.BankProvsecured, T.BankProvUnsecured, T.BankTotalProvision, T.RBIProvsecured, T.RBIProvUnsecured, T.RBITotalProvision, T.InitialNpaDt, T.FinalNpaDt, T.SMA_Dt, T.UpgDate, T.InitialAssetClassAlt_Key, T.FinalAssetClassAlt_Key, T.ProvisionAlt_Key, T.PNPA_Reason, T.SMA_Class, T.SMA_Reason, T.FlgMoc, T.MOC_Dt, T.CommonMocTypeAlt_Key, T.FlgDeg, T.FlgDirtyRow, T.FlgInMonth, T.FlgSMA, T.FlgPNPA, T.FlgUpg, T.FlgFITL, T.FlgAbinitio, T.NPA_Days, T.RefPeriodOverdueUPG, T.RefPeriodOverDrawnUPG, T.RefPeriodNoCreditUPG, T.RefPeriodIntServiceUPG, T.RefPeriodStkStatementUPG, T.RefPeriodReviewUPG, T.AppGovGur, T.UsedRV, T.ComputedClaim, T.UPG_RELAX_MSME, T.DEG_RELAX_MSME, T.PNPA_DATE, T.NPA_Reason, T.PnpaAssetClassAlt_key, T.DisbAmount, T.PrincOutStd, T.PrincOverdue, T.PrincOverdueSinceDt, T.IntOverdue, T.IntOverdueSinceDt, T.OtherOverdue, T.OtherOverdueSinceDt, T.RelationshipNumber, T.AccountFlag, T.CommercialFlag_AltKey, T.Liability, T.CD, T.AccountStatus, T.AccountBlkCode1, T.AccountBlkCode2, T.ExposureType, T.Mtm_Value, T.BankAssetClass, T.NpaType, T.SecApp, T.BorrowerTypeID, T.LineCode, T.ProvPerSecured, T.ProvPerUnSecured, T.MOCReason, T.AddlProvisionPer, T.FlgINFRA, T.RepossessionDate, T.DerecognisedInterest1, T.DerecognisedInterest2, T.ProductCode, T.FlgLCBG, T.unserviedint, T.PreQtrCredit, T.PrvQtrInt, T.CurQtrCredit, T.CurQtrInt, T.OriginalBranchcode, T.AdvanceRecovery, T.NotionalInttAmt, T.PrvAssetClassAlt_Key, T.MOCTYPE, T.FlgSecured, T.RePossession, T.RCPending, T.PaymentPending, T.WheelCase, T.CustomerLevelMaxPer, T.FinalProvisionPer, T.IsIBPC, T.IsSecuritised, T.RFA, T.IsNonCooperative, T.Sarfaesi, T.WeakAccount, T.PUI, T.FlgFraud, T.FlgRestructure, T.RestructureDate, T.SarfaesiDate, T.FlgUnusualBounce, T.UnusualBounceDate, T.FlgUnClearedEffect, T.UnClearedEffectDate, T.FraudDate, T.WeakAccountDate
   FROM O ,PRO_RBL_MISDB_PROD.AccountCal_Hist O
          JOIN tt_AccountCal_21 T   ON O.AccountEntityID = T.AccountEntityID 
    WHERE O.EffectiveFromTimeKey = v_TimeKey
     AND O.EffectiveToTimeKey = v_TIMEKEY) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET T.UcifEntityID = src.UcifEntityID,
                                T.CustomerEntityID = src.CustomerEntityID,
                                T.CustomerAcID = src.CustomerAcID,
                                T.RefCustomerID = src.RefCustomerID,
                                T.SourceSystemCustomerID = src.SourceSystemCustomerID,
                                T.UCIF_ID = src.UCIF_ID,
                                T.BranchCode = src.BranchCode,
                                T.FacilityType = src.FacilityType,
                                T.AcOpenDt = src.AcOpenDt,
                                T.FirstDtOfDisb = src.FirstDtOfDisb,
                                T.ProductAlt_Key = src.ProductAlt_Key,
                                T.SchemeAlt_key = src.SchemeAlt_key,
                                T.SubSectorAlt_Key = src.SubSectorAlt_Key,
                                T.SplCatg1Alt_Key = src.SplCatg1Alt_Key,
                                T.SplCatg2Alt_Key = src.SplCatg2Alt_Key,
                                T.SplCatg3Alt_Key = src.SplCatg3Alt_Key,
                                T.SplCatg4Alt_Key = src.SplCatg4Alt_Key,
                                T.SourceAlt_Key = src.SourceAlt_Key,
                                T.ActSegmentCode = src.ActSegmentCode,
                                T.InttRate = src.InttRate,
                                T.Balance = src.Balance,
                                T.BalanceInCrncy = src.BalanceInCrncy,
                                T.CurrencyAlt_Key = src.CurrencyAlt_Key,
                                T.DrawingPower = src.DrawingPower,
                                T.CurrentLimit = src.CurrentLimit,
                                T.CurrentLimitDt = src.CurrentLimitDt,
                                T.ContiExcessDt = src.ContiExcessDt,
                                T.StockStDt = src.StockStDt,
                                T.DebitSinceDt = src.DebitSinceDt,
                                T.LastCrDate = src.LastCrDate,
                                T.InttServiced = src.InttServiced,
                                T.IntNotServicedDt = src.IntNotServicedDt,
                                T.OverdueAmt = src.OverdueAmt,
                                T.OverDueSinceDt = src.OverDueSinceDt,
                                T.ReviewDueDt = src.ReviewDueDt,
                                T.SecurityValue = src.SecurityValue,
                                T.DFVAmt = src.DFVAmt,
                                T.GovtGtyAmt = src.GovtGtyAmt,
                                T.CoverGovGur = src.CoverGovGur,
                                T.WriteOffAmount = src.WriteOffAmount,
                                T.UnAdjSubSidy = src.UnAdjSubSidy,
                                T.CreditsinceDt = src.CreditsinceDt,
                                T.DegReason = src.DegReason,
                                T.Asset_Norm = src.Asset_Norm,
                                T.REFPeriodMax = src.REFPeriodMax,
                                T.RefPeriodOverdue = src.RefPeriodOverdue,
                                T.RefPeriodOverDrawn = src.RefPeriodOverDrawn,
                                T.RefPeriodNoCredit = src.RefPeriodNoCredit,
                                T.RefPeriodIntService = src.RefPeriodIntService,
                                T.RefPeriodStkStatement = src.RefPeriodStkStatement,
                                T.RefPeriodReview = src.RefPeriodReview,
                                T.NetBalance = src.NetBalance,
                                T.ApprRV = src.ApprRV,
                                T.SecuredAmt = src.SecuredAmt,
                                T.UnSecuredAmt = src.UnSecuredAmt,
                                T.ProvDFV = src.ProvDFV,
                                T.Provsecured = src.Provsecured,
                                T.ProvUnsecured = src.ProvUnsecured,
                                T.ProvCoverGovGur = src.ProvCoverGovGur,
                                T.AddlProvision = src.AddlProvision,
                                T.TotalProvision = src.TotalProvision,
                                T.BankProvsecured = src.BankProvsecured,
                                T.BankProvUnsecured = src.BankProvUnsecured,
                                T.BankTotalProvision = src.BankTotalProvision,
                                T.RBIProvsecured = src.RBIProvsecured,
                                T.RBIProvUnsecured = src.RBIProvUnsecured,
                                T.RBITotalProvision = src.RBITotalProvision,
                                T.InitialNpaDt = src.InitialNpaDt,
                                T.FinalNpaDt = src.FinalNpaDt,
                                T.SMA_Dt = src.SMA_Dt,
                                T.UpgDate = src.UpgDate,
                                T.InitialAssetClassAlt_Key = src.InitialAssetClassAlt_Key,
                                T.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                T.ProvisionAlt_Key = src.ProvisionAlt_Key,
                                T.PNPA_Reason = src.PNPA_Reason,
                                T.SMA_Class = src.SMA_Class,
                                T.SMA_Reason = src.SMA_Reason,
                                T.FlgMoc = src.FlgMoc,
                                T.MOC_Dt = src.MOC_Dt,
                                T.CommonMocTypeAlt_Key = src.CommonMocTypeAlt_Key,
                                T.FlgDeg = src.FlgDeg,
                                T.FlgDirtyRow = src.FlgDirtyRow,
                                T.FlgInMonth = src.FlgInMonth,
                                T.FlgSMA = src.FlgSMA,
                                T.FlgPNPA = src.FlgPNPA,
                                T.FlgUpg = src.FlgUpg,
                                T.FlgFITL = src.FlgFITL,
                                T.FlgAbinitio = src.FlgAbinitio,
                                T.NPA_Days = src.NPA_Days,
                                T.RefPeriodOverdueUPG = src.RefPeriodOverdueUPG,
                                T.RefPeriodOverDrawnUPG = src.RefPeriodOverDrawnUPG,
                                T.RefPeriodNoCreditUPG = src.RefPeriodNoCreditUPG,
                                T.RefPeriodIntServiceUPG = src.RefPeriodIntServiceUPG,
                                T.RefPeriodStkStatementUPG = src.RefPeriodStkStatementUPG,
                                T.RefPeriodReviewUPG = src.RefPeriodReviewUPG,
                                T.AppGovGur = src.AppGovGur,
                                T.UsedRV = src.UsedRV,
                                T.ComputedClaim = src.ComputedClaim,
                                T.UPG_RELAX_MSME = src.UPG_RELAX_MSME,
                                T.DEG_RELAX_MSME = src.DEG_RELAX_MSME,
                                T.PNPA_DATE = src.PNPA_DATE,
                                T.NPA_Reason = src.NPA_Reason,
                                T.PnpaAssetClassAlt_key = src.PnpaAssetClassAlt_key,
                                T.DisbAmount = src.DisbAmount,
                                T.PrincOutStd = src.PrincOutStd,
                                T.PrincOverdue = src.PrincOverdue,
                                T.PrincOverdueSinceDt = src.PrincOverdueSinceDt,
                                T.IntOverdue = src.IntOverdue,
                                T.IntOverdueSinceDt = src.IntOverdueSinceDt,
                                T.OtherOverdue = src.OtherOverdue,
                                T.OtherOverdueSinceDt = src.OtherOverdueSinceDt,
                                T.RelationshipNumber = src.RelationshipNumber,
                                T.AccountFlag = src.AccountFlag,
                                T.CommercialFlag_AltKey = src.CommercialFlag_AltKey,
                                T.Liability = src.Liability,
                                T.CD = src.CD,
                                T.AccountStatus = src.AccountStatus,
                                T.AccountBlkCode1 = src.AccountBlkCode1,
                                T.AccountBlkCode2 = src.AccountBlkCode2,
                                T.ExposureType = src.ExposureType,
                                T.Mtm_Value = src.Mtm_Value,
                                T.BankAssetClass = src.BankAssetClass,
                                T.NpaType = src.NpaType,
                                T.SecApp = src.SecApp,
                                T.BorrowerTypeID = src.BorrowerTypeID,
                                T.LineCode = src.LineCode,
                                T.ProvPerSecured = src.ProvPerSecured,
                                T.ProvPerUnSecured = src.ProvPerUnSecured,
                                T.MOCReason = src.MOCReason,
                                T.AddlProvisionPer = src.AddlProvisionPer,
                                T.FlgINFRA = src.FlgINFRA,
                                T.RepossessionDate = src.RepossessionDate,
                                T.DerecognisedInterest1 = src.DerecognisedInterest1,
                                T.DerecognisedInterest2 = src.DerecognisedInterest2,
                                T.ProductCode = src.ProductCode,
                                T.FlgLCBG = src.FlgLCBG,
                                T.unserviedint = src.unserviedint,
                                T.PreQtrCredit = src.PreQtrCredit,
                                T.PrvQtrInt = src.PrvQtrInt,
                                T.CurQtrCredit = src.CurQtrCredit,
                                T.CurQtrInt = src.CurQtrInt,
                                T.OriginalBranchcode = src.OriginalBranchcode,
                                T.AdvanceRecovery = src.AdvanceRecovery,
                                T.NotionalInttAmt = src.NotionalInttAmt,
                                T.PrvAssetClassAlt_Key = src.PrvAssetClassAlt_Key,
                                T.MOCTYPE = src.MOCTYPE,
                                T.FlgSecured = src.FlgSecured,
                                T.RePossession = src.RePossession,
                                T.RCPending = src.RCPending,
                                T.PaymentPending = src.PaymentPending,
                                T.WheelCase = src.WheelCase,
                                T.CustomerLevelMaxPer = src.CustomerLevelMaxPer,
                                T.FinalProvisionPer = src.FinalProvisionPer,
                                T.IsIBPC = src.IsIBPC,
                                T.IsSecuritised = src.IsSecuritised,
                                T.RFA = src.RFA,
                                T.IsNonCooperative = src.IsNonCooperative,
                                T.Sarfaesi = src.Sarfaesi,
                                T.WeakAccount = src.WeakAccount,
                                T.PUI = src.PUI,
                                T.FlgFraud = src.FlgFraud,
                                T.FlgRestructure = src.FlgRestructure,
                                T.RestructureDate = src.RestructureDate,
                                T.SarfaesiDate = src.SarfaesiDate,
                                T.FlgUnusualBounce = src.FlgUnusualBounce,
                                T.UnusualBounceDate = src.UnusualBounceDate,
                                T.FlgUnClearedEffect = src.FlgUnClearedEffect,
                                T.UnClearedEffectDate = src.UnClearedEffectDate,
                                T.FraudDate = src.FraudDate,
                                T.WeakAccountDate = src.WeakAccountDate;
   SELECT MAX(EntityKey)  

     INTO v_EntityKeyAcct
     FROM PRO_RBL_MISDB_PROD.AccountCal_Hist ;
   IF v_EntityKeyAcct IS NULL THEN

   BEGIN
      v_EntityKeyAcct := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKeyNew
   FROM TEMP ,tt_AccountCal_21 TEMP
          JOIN ( SELECT tt_AccountCal_21.AccountEntityID ,
                        (v_EntityKeyAcct + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                            FROM DUAL  )  )) EntityKeyNew  
                 FROM tt_AccountCal_21 ---Where IsChanged in ('C','N')
                        ) ACCT   ON TEMP.AccountEntityID = ACCT.AccountEntityID ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKeyNew = src.EntityKeyNew;
   --WHERE Temp.IsChanged in ('C','N')
   MERGE INTO T 
   USING (SELECT T.ROWID row_id, 'Y'
   FROM T ,tt_AccountCal_21 T
          LEFT JOIN PRO_RBL_MISDB_PROD.AccountCal_Hist B   ON B.EffectiveFromTimeKey = v_TIMEKEY
          AND B.EffectiveToTimeKey = v_TIMEKEY
          AND B.AccountEntityID = T.AccountEntityID 
    WHERE B.AccountEntityID IS NULL) src
   ON ( T.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET t.IsChanged = 'Y';
   /***************************************************************************************************************/
   INSERT INTO PRO_RBL_MISDB_PROD.AccountCal_Hist
     ( EntityKey, AccountEntityID, UcifEntityID, CustomerEntityID, CustomerAcID, RefCustomerID, SourceSystemCustomerID, UCIF_ID, BranchCode, FacilityType, AcOpenDt, FirstDtOfDisb, ProductAlt_Key, SchemeAlt_key, SubSectorAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SourceAlt_Key, ActSegmentCode, InttRate, Balance, BalanceInCrncy, CurrencyAlt_Key, DrawingPower, CurrentLimit, CurrentLimitDt, ContiExcessDt, StockStDt, DebitSinceDt, LastCrDate, InttServiced, IntNotServicedDt, OverdueAmt, OverDueSinceDt, ReviewDueDt, SecurityValue, DFVAmt, GovtGtyAmt, CoverGovGur, WriteOffAmount, UnAdjSubSidy, CreditsinceDt, DegReason, Asset_Norm, REFPeriodMax, RefPeriodOverdue, RefPeriodOverDrawn, RefPeriodNoCredit, RefPeriodIntService, RefPeriodStkStatement, RefPeriodReview, NetBalance, ApprRV, SecuredAmt, UnSecuredAmt, ProvDFV, Provsecured, ProvUnsecured, ProvCoverGovGur, AddlProvision, TotalProvision, BankProvsecured, BankProvUnsecured, BankTotalProvision, RBIProvsecured, RBIProvUnsecured, RBITotalProvision, InitialNpaDt, FinalNpaDt, SMA_Dt, UpgDate, InitialAssetClassAlt_Key, FinalAssetClassAlt_Key, ProvisionAlt_Key, PNPA_Reason, SMA_Class, SMA_Reason, FlgMoc, MOC_Dt, CommonMocTypeAlt_Key, FlgDeg, FlgDirtyRow, FlgInMonth, FlgSMA, FlgPNPA, FlgUpg, FlgFITL, FlgAbinitio, NPA_Days, RefPeriodOverdueUPG, RefPeriodOverDrawnUPG, RefPeriodNoCreditUPG, RefPeriodIntServiceUPG, RefPeriodStkStatementUPG, RefPeriodReviewUPG, EffectiveFromTimeKey, EffectiveToTimeKey, AppGovGur, UsedRV, ComputedClaim, UPG_RELAX_MSME, DEG_RELAX_MSME, PNPA_DATE, NPA_Reason, PnpaAssetClassAlt_key, DisbAmount, PrincOutStd, PrincOverdue, PrincOverdueSinceDt, IntOverdue, IntOverdueSinceDt, OtherOverdue, OtherOverdueSinceDt, RelationshipNumber, AccountFlag, CommercialFlag_AltKey, Liability, CD, AccountStatus, AccountBlkCode1, AccountBlkCode2, ExposureType, Mtm_Value, BankAssetClass, NpaType, SecApp, BorrowerTypeID, LineCode, ProvPerSecured, ProvPerUnSecured, MOCReason, AddlProvisionPer, FlgINFRA, RepossessionDate, DerecognisedInterest1, DerecognisedInterest2, ProductCode, FlgLCBG, unserviedint, PreQtrCredit, PrvQtrInt, CurQtrCredit, CurQtrInt, OriginalBranchcode, AdvanceRecovery, NotionalInttAmt, PrvAssetClassAlt_Key, MOCTYPE, FlgSecured, RePossession, RCPending, PaymentPending, WheelCase, CustomerLevelMaxPer, FinalProvisionPer, IsIBPC, IsSecuritised, RFA, IsNonCooperative, Sarfaesi, WeakAccount, PUI, FlgFraud, FlgRestructure, RestructureDate, SarfaesiDate, FlgUnusualBounce, UnusualBounceDate, FlgUnClearedEffect, UnClearedEffectDate, FraudDate, WeakAccountDate, ScreenFlag, ChangeField )
     ( SELECT T.EntityKeyNew ,
              T.AccountEntityID ,
              T.UcifEntityID ,
              T.CustomerEntityID ,
              T.CustomerAcID ,
              T.RefCustomerID ,
              T.SourceSystemCustomerID ,
              T.UCIF_ID ,
              T.BranchCode ,
              T.FacilityType ,
              T.AcOpenDt ,
              T.FirstDtOfDisb ,
              T.ProductAlt_Key ,
              T.SchemeAlt_key ,
              T.SubSectorAlt_Key ,
              T.SplCatg1Alt_Key ,
              T.SplCatg2Alt_Key ,
              T.SplCatg3Alt_Key ,
              T.SplCatg4Alt_Key ,
              T.SourceAlt_Key ,
              T.ActSegmentCode ,
              T.InttRate ,
              T.Balance ,
              T.BalanceInCrncy ,
              T.CurrencyAlt_Key ,
              T.DrawingPower ,
              T.CurrentLimit ,
              T.CurrentLimitDt ,
              T.ContiExcessDt ,
              T.StockStDt ,
              T.DebitSinceDt ,
              T.LastCrDate ,
              T.InttServiced ,
              T.IntNotServicedDt ,
              T.OverdueAmt ,
              T.OverDueSinceDt ,
              T.ReviewDueDt ,
              T.SecurityValue ,
              T.DFVAmt ,
              T.GovtGtyAmt ,
              T.CoverGovGur ,
              T.WriteOffAmount ,
              T.UnAdjSubSidy ,
              T.CreditsinceDt ,
              T.DegReason ,
              T.Asset_Norm ,
              T.REFPeriodMax ,
              T.RefPeriodOverdue ,
              T.RefPeriodOverDrawn ,
              T.RefPeriodNoCredit ,
              T.RefPeriodIntService ,
              T.RefPeriodStkStatement ,
              T.RefPeriodReview ,
              T.NetBalance ,
              T.ApprRV ,
              T.SecuredAmt ,
              T.UnSecuredAmt ,
              T.ProvDFV ,
              T.Provsecured ,
              T.ProvUnsecured ,
              T.ProvCoverGovGur ,
              T.AddlProvision ,
              T.TotalProvision ,
              T.BankProvsecured ,
              T.BankProvUnsecured ,
              T.BankTotalProvision ,
              T.RBIProvsecured ,
              T.RBIProvUnsecured ,
              T.RBITotalProvision ,
              T.InitialNpaDt ,
              T.FinalNpaDt ,
              T.SMA_Dt ,
              T.UpgDate ,
              T.InitialAssetClassAlt_Key ,
              T.FinalAssetClassAlt_Key ,
              T.ProvisionAlt_Key ,
              T.PNPA_Reason ,
              T.SMA_Class ,
              T.SMA_Reason ,
              T.FlgMoc ,
              T.MOC_Dt ,
              T.CommonMocTypeAlt_Key ,
              T.FlgDeg ,
              T.FlgDirtyRow ,
              T.FlgInMonth ,
              T.FlgSMA ,
              T.FlgPNPA ,
              T.FlgUpg ,
              T.FlgFITL ,
              T.FlgAbinitio ,
              T.NPA_Days ,
              T.RefPeriodOverdueUPG ,
              T.RefPeriodOverDrawnUPG ,
              T.RefPeriodNoCreditUPG ,
              T.RefPeriodIntServiceUPG ,
              T.RefPeriodStkStatementUPG ,
              T.RefPeriodReviewUPG ,
              v_TimeKey EffectiveFromTimeKey  ,
              v_TimeKey EffectiveToTimeKey  ,
              T.AppGovGur ,
              T.UsedRV ,
              T.ComputedClaim ,
              T.UPG_RELAX_MSME ,
              T.DEG_RELAX_MSME ,
              T.PNPA_DATE ,
              T.NPA_Reason ,
              T.PnpaAssetClassAlt_key ,
              T.DisbAmount ,
              T.PrincOutStd ,
              T.PrincOverdue ,
              T.PrincOverdueSinceDt ,
              T.IntOverdue ,
              T.IntOverdueSinceDt ,
              T.OtherOverdue ,
              T.OtherOverdueSinceDt ,
              T.RelationshipNumber ,
              T.AccountFlag ,
              T.CommercialFlag_AltKey ,
              T.Liability ,
              T.CD ,
              T.AccountStatus ,
              T.AccountBlkCode1 ,
              T.AccountBlkCode2 ,
              T.ExposureType ,
              T.Mtm_Value ,
              T.BankAssetClass ,
              T.NpaType ,
              T.SecApp ,
              T.BorrowerTypeID ,
              T.LineCode ,
              T.ProvPerSecured ,
              T.ProvPerUnSecured ,
              T.MOCReason ,
              T.AddlProvisionPer ,
              T.FlgINFRA ,
              T.RepossessionDate ,
              T.DerecognisedInterest1 ,
              T.DerecognisedInterest2 ,
              T.ProductCode ,
              T.FlgLCBG ,
              T.unserviedint ,
              T.PreQtrCredit ,
              T.PrvQtrInt ,
              T.CurQtrCredit ,
              T.CurQtrInt ,
              T.OriginalBranchcode ,
              T.AdvanceRecovery ,
              T.NotionalInttAmt ,
              T.PrvAssetClassAlt_Key ,
              T.MOCTYPE ,
              T.FlgSecured ,
              T.RePossession ,
              T.RCPending ,
              T.PaymentPending ,
              T.WheelCase ,
              T.CustomerLevelMaxPer ,
              T.FinalProvisionPer ,
              T.IsIBPC ,
              T.IsSecuritised ,
              T.RFA ,
              T.IsNonCooperative ,
              T.Sarfaesi ,
              T.WeakAccount ,
              T.PUI ,
              T.FlgFraud ,
              T.FlgRestructure ,
              T.RestructureDate ,
              T.SarfaesiDate ,
              T.FlgUnusualBounce ,
              T.UnusualBounceDate ,
              T.FlgUnClearedEffect ,
              T.UnClearedEffectDate ,
              T.FraudDate ,
              T.WeakAccountDate ,
              NULL ScreenFlag  ,
              NULL ChangeField  

       --select SUM(BALANCE)/10000000,  count(1)
       FROM tt_AccountCal_21 T
        WHERE  T.ISCHANGED = 'Y' );
   SELECT MAX(EntityKey)  

     INTO v_EntityKeyAcct1
     FROM PRO_RBL_MISDB_PROD.AccountCal_Hist ;
   IF v_EntityKeyAcct1 IS NULL THEN

   BEGIN
      v_EntityKeyAcct1 := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKeyNew
   FROM TEMP ,tt_AccountCal_Moc TEMP
          JOIN ( SELECT tt_AccountCal_Moc.AccountEntityID ,
                        (v_EntityKeyAcct1 + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                             FROM DUAL  )  )) EntityKeyNew  
                 FROM tt_AccountCal_Moc ---Where IsChanged in ('C','N')
                        ) ACCT   ON TEMP.AccountEntityID = ACCT.AccountEntityID ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKeyNew = src.EntityKeyNew;
   --WHERE Temp.IsChanged in ('C','N')
   INSERT INTO PRO_RBL_MISDB_PROD.AccountCal_Hist
     ( EntityKey, AccountEntityID, UcifEntityID, CustomerEntityID, CustomerAcID, RefCustomerID, SourceSystemCustomerID, UCIF_ID, BranchCode, FacilityType, AcOpenDt, FirstDtOfDisb, ProductAlt_Key, SchemeAlt_key, SubSectorAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SourceAlt_Key, ActSegmentCode, InttRate, Balance, BalanceInCrncy, CurrencyAlt_Key, DrawingPower, CurrentLimit, CurrentLimitDt, ContiExcessDt, StockStDt, DebitSinceDt, LastCrDate, InttServiced, IntNotServicedDt, OverdueAmt, OverDueSinceDt, ReviewDueDt, SecurityValue, DFVAmt, GovtGtyAmt, CoverGovGur, WriteOffAmount, UnAdjSubSidy, CreditsinceDt, DegReason, Asset_Norm, REFPeriodMax, RefPeriodOverdue, RefPeriodOverDrawn, RefPeriodNoCredit, RefPeriodIntService, RefPeriodStkStatement, RefPeriodReview, NetBalance, ApprRV, SecuredAmt, UnSecuredAmt, ProvDFV, Provsecured, ProvUnsecured, ProvCoverGovGur, AddlProvision, TotalProvision, BankProvsecured, BankProvUnsecured, BankTotalProvision, RBIProvsecured, RBIProvUnsecured, RBITotalProvision, InitialNpaDt, FinalNpaDt, SMA_Dt, UpgDate, InitialAssetClassAlt_Key, FinalAssetClassAlt_Key, ProvisionAlt_Key, PNPA_Reason, SMA_Class, SMA_Reason, FlgMoc, MOC_Dt, CommonMocTypeAlt_Key, FlgDeg, FlgDirtyRow, FlgInMonth, FlgSMA, FlgPNPA, FlgUpg, FlgFITL, FlgAbinitio, NPA_Days, RefPeriodOverdueUPG, RefPeriodOverDrawnUPG, RefPeriodNoCreditUPG, RefPeriodIntServiceUPG, RefPeriodStkStatementUPG, RefPeriodReviewUPG, EffectiveFromTimeKey, EffectiveToTimeKey, AppGovGur, UsedRV, ComputedClaim, UPG_RELAX_MSME, DEG_RELAX_MSME, PNPA_DATE, NPA_Reason, PnpaAssetClassAlt_key, DisbAmount, PrincOutStd, PrincOverdue, PrincOverdueSinceDt, IntOverdue, IntOverdueSinceDt, OtherOverdue, OtherOverdueSinceDt, RelationshipNumber, AccountFlag, CommercialFlag_AltKey, Liability, CD, AccountStatus, AccountBlkCode1, AccountBlkCode2, ExposureType, Mtm_Value, BankAssetClass, NpaType, SecApp, BorrowerTypeID, LineCode, ProvPerSecured, ProvPerUnSecured, MOCReason, AddlProvisionPer, FlgINFRA, RepossessionDate, DerecognisedInterest1, DerecognisedInterest2, ProductCode, FlgLCBG, unserviedint, PreQtrCredit, PrvQtrInt, CurQtrCredit, CurQtrInt, OriginalBranchcode, AdvanceRecovery, NotionalInttAmt, PrvAssetClassAlt_Key, MOCTYPE, FlgSecured, RePossession, RCPending, PaymentPending, WheelCase, CustomerLevelMaxPer, FinalProvisionPer, IsIBPC, IsSecuritised, RFA, IsNonCooperative, Sarfaesi, WeakAccount, PUI, FlgFraud, FlgRestructure, RestructureDate, SarfaesiDate, FlgUnusualBounce, UnusualBounceDate, FlgUnClearedEffect, UnClearedEffectDate, FraudDate, WeakAccountDate, ScreenFlag, ChangeField )
     ( SELECT T.EntityKeyNew ,
              T.AccountEntityID ,
              T.UcifEntityID ,
              T.CustomerEntityID ,
              T.CustomerAcID ,
              T.RefCustomerID ,
              T.SourceSystemCustomerID ,
              T.UCIF_ID ,
              T.BranchCode ,
              T.FacilityType ,
              T.AcOpenDt ,
              T.FirstDtOfDisb ,
              T.ProductAlt_Key ,
              T.SchemeAlt_key ,
              T.SubSectorAlt_Key ,
              T.SplCatg1Alt_Key ,
              T.SplCatg2Alt_Key ,
              T.SplCatg3Alt_Key ,
              T.SplCatg4Alt_Key ,
              T.SourceAlt_Key ,
              T.ActSegmentCode ,
              T.InttRate ,
              T.Balance ,
              T.BalanceInCrncy ,
              T.CurrencyAlt_Key ,
              T.DrawingPower ,
              T.CurrentLimit ,
              T.CurrentLimitDt ,
              T.ContiExcessDt ,
              T.StockStDt ,
              T.DebitSinceDt ,
              T.LastCrDate ,
              T.InttServiced ,
              T.IntNotServicedDt ,
              T.OverdueAmt ,
              T.OverDueSinceDt ,
              T.ReviewDueDt ,
              T.SecurityValue ,
              T.DFVAmt ,
              T.GovtGtyAmt ,
              T.CoverGovGur ,
              T.WriteOffAmount ,
              T.UnAdjSubSidy ,
              T.CreditsinceDt ,
              T.DegReason ,
              T.Asset_Norm ,
              T.REFPeriodMax ,
              T.RefPeriodOverdue ,
              T.RefPeriodOverDrawn ,
              T.RefPeriodNoCredit ,
              T.RefPeriodIntService ,
              T.RefPeriodStkStatement ,
              T.RefPeriodReview ,
              T.NetBalance ,
              T.ApprRV ,
              T.SecuredAmt ,
              T.UnSecuredAmt ,
              T.ProvDFV ,
              T.Provsecured ,
              T.ProvUnsecured ,
              T.ProvCoverGovGur ,
              T.AddlProvision ,
              T.TotalProvision ,
              T.BankProvsecured ,
              T.BankProvUnsecured ,
              T.BankTotalProvision ,
              T.RBIProvsecured ,
              T.RBIProvUnsecured ,
              T.RBITotalProvision ,
              T.InitialNpaDt ,
              T.FinalNpaDt ,
              T.SMA_Dt ,
              T.UpgDate ,
              T.InitialAssetClassAlt_Key ,
              T.FinalAssetClassAlt_Key ,
              T.ProvisionAlt_Key ,
              T.PNPA_Reason ,
              T.SMA_Class ,
              T.SMA_Reason ,
              T.FlgMoc ,
              T.MOC_Dt ,
              T.CommonMocTypeAlt_Key ,
              T.FlgDeg ,
              T.FlgDirtyRow ,
              T.FlgInMonth ,
              T.FlgSMA ,
              T.FlgPNPA ,
              T.FlgUpg ,
              T.FlgFITL ,
              T.FlgAbinitio ,
              T.NPA_Days ,
              T.RefPeriodOverdueUPG ,
              T.RefPeriodOverDrawnUPG ,
              T.RefPeriodNoCreditUPG ,
              T.RefPeriodIntServiceUPG ,
              T.RefPeriodStkStatementUPG ,
              T.RefPeriodReviewUPG ,
              v_TimeKey + 1 EffectiveFromTimeKey  ,
              EffectiveToTimeKey ,
              T.AppGovGur ,
              T.UsedRV ,
              T.ComputedClaim ,
              T.UPG_RELAX_MSME ,
              T.DEG_RELAX_MSME ,
              T.PNPA_DATE ,
              T.NPA_Reason ,
              T.PnpaAssetClassAlt_key ,
              T.DisbAmount ,
              T.PrincOutStd ,
              T.PrincOverdue ,
              T.PrincOverdueSinceDt ,
              T.IntOverdue ,
              T.IntOverdueSinceDt ,
              T.OtherOverdue ,
              T.OtherOverdueSinceDt ,
              T.RelationshipNumber ,
              T.AccountFlag ,
              T.CommercialFlag_AltKey ,
              T.Liability ,
              T.CD ,
              T.AccountStatus ,
              T.AccountBlkCode1 ,
              T.AccountBlkCode2 ,
              T.ExposureType ,
              T.Mtm_Value ,
              T.BankAssetClass ,
              T.NpaType ,
              T.SecApp ,
              T.BorrowerTypeID ,
              T.LineCode ,
              T.ProvPerSecured ,
              T.ProvPerUnSecured ,
              T.MOCReason ,
              T.AddlProvisionPer ,
              T.FlgINFRA ,
              T.RepossessionDate ,
              T.DerecognisedInterest1 ,
              T.DerecognisedInterest2 ,
              T.ProductCode ,
              T.FlgLCBG ,
              T.unserviedint ,
              T.PreQtrCredit ,
              T.PrvQtrInt ,
              T.CurQtrCredit ,
              T.CurQtrInt ,
              T.OriginalBranchcode ,
              T.AdvanceRecovery ,
              T.NotionalInttAmt ,
              T.PrvAssetClassAlt_Key ,
              T.MOCTYPE ,
              T.FlgSecured ,
              T.RePossession ,
              T.RCPending ,
              T.PaymentPending ,
              T.WheelCase ,
              T.CustomerLevelMaxPer ,
              T.FinalProvisionPer ,
              T.IsIBPC ,
              T.IsSecuritised ,
              T.RFA ,
              T.IsNonCooperative ,
              T.Sarfaesi ,
              T.WeakAccount ,
              T.PUI ,
              T.FlgFraud ,
              T.FlgRestructure ,
              T.RestructureDate ,
              T.SarfaesiDate ,
              T.FlgUnusualBounce ,
              T.UnusualBounceDate ,
              T.FlgUnClearedEffect ,
              T.UnClearedEffectDate ,
              T.FraudDate ,
              T.WeakAccountDate ,
              NULL ScreenFlag  ,
              NULL ChangeField  
       FROM tt_AccountCal_Moc T
        WHERE  EffectiveToTimeKey > v_TIMEKEY );
   -----------------------------------------------------------
   /* AMAR - 29033023 -- RESTRUCTURE WORK FOR moc PROCESSING */
   DELETE FROM tt_AdvAcRestructureCal_Moc;
   UTILS.IDENTITY_RESET('tt_AdvAcRestructureCal_Moc');

   INSERT INTO tt_AdvAcRestructureCal_Moc ( 
   	SELECT A.* ,
           UTILS.CONVERT_TO_NUMBER(0,19,0) EntityKeyNew  
   	  FROM PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist A
             JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal B   ON A.AccountEntityId = B.AccountEntityId
             AND A.EffectiveFromTimeKey <= v_TIMEKEY
             AND A.EffectiveToTimeKey >= v_TIMEKEY );
   /* EXPIRE RECORDS ARE LIVE FROM PREV EFFECTIVEFROTIMEKEY TO MOC OT GRATER THAN MOC TIMKEY*/
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, CASE 
   WHEN a.EffectiveFromTimeKey < v_TIMEKEY THEN v_TIMEKEY - 1
   ELSE v_TIMEKEY
      END AS EffectiveToTimeKey
   FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist A
          JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal B   ON A.AccountEntityId = B.AccountEntityId
          AND A.EffectiveFromTimeKey <= v_TIMEKEY
          AND A.EffectiveToTimeKey >= v_TIMEKEY ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.EffectiveToTimeKey = src.EffectiveToTimeKey;
   /* UPADTE DATA AVAILABLE ON SAME TMEKEY */
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, T.AssetClassAlt_KeyOnInvocation, T.PreRestructureAssetClassAlt_Key, T.PreRestructureNPA_Date, T.ProvPerOnRestrucure, T.RestructureTypeAlt_Key, T.COVID_OTR_CatgAlt_Key, T.RestructureDt, T.SP_ExpiryDate, T.DPD_AsOnRestructure, T.RestructureFailureDate, T.DPD_Breach_Date, T.ZeroDPD_Date, T.SP_ExpiryExtendedDate, T.CurrentPOS, T.CurrentTOS, T.RestructurePOS, T.Res_POS_to_CurrentPOS_Per, T.CurrentDPD, T.TotalDPD, T.VDPD, T.AddlProvPer, T.ProvReleasePer, T.AppliedNormalProvPer, T.FinalProvPer, T.PreDegProvPer, T.UpgradeDate, T.SurvPeriodEndDate, T.DegDurSP_PeriodProvPer, T.NonFinDPD, T.InitialAssetClassAlt_Key, T.FinalAssetClassAlt_Key, T.RestructureProvision, T.SecuredProvision, T.UnSecuredProvision, T.FlgDeg, T.FlgUpg, T.DegDate, T.RC_Pending, T.FinalNpaDt, T.RestructureStage, T.DegReason, T.InvestmentGrade, T.POS_10PerPaidDate, T.DPD_MaxNonFin, T.DPD_MaxFin, T.FlgMorat, T.PreRestructureNPA_Prov, T.RestructureFacilityTypeAlt_Key
   FROM O ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist O
          JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal T   ON O.AccountEntityId = T.AccountEntityId 
    WHERE O.EffectiveFromTimeKey = v_TimeKey
     AND O.EffectiveToTimeKey = v_TIMEKEY) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.AssetClassAlt_KeyOnInvocation = src.AssetClassAlt_KeyOnInvocation,
                                O.PreRestructureAssetClassAlt_Key = src.PreRestructureAssetClassAlt_Key,
                                O.PreRestructureNPA_Date = src.PreRestructureNPA_Date,
                                O.ProvPerOnRestrucure = src.ProvPerOnRestrucure,
                                O.RestructureTypeAlt_Key = src.RestructureTypeAlt_Key,
                                O.COVID_OTR_CatgAlt_Key = src.COVID_OTR_CatgAlt_Key,
                                O.RestructureDt = src.RestructureDt,
                                O.SP_ExpiryDate = src.SP_ExpiryDate,
                                O.DPD_AsOnRestructure = src.DPD_AsOnRestructure,
                                O.RestructureFailureDate = src.RestructureFailureDate,
                                O.DPD_Breach_Date = src.DPD_Breach_Date,
                                O.ZeroDPD_Date = src.ZeroDPD_Date,
                                O.SP_ExpiryExtendedDate = src.SP_ExpiryExtendedDate,
                                O.CurrentPOS = src.CurrentPOS,
                                O.CurrentTOS = src.CurrentTOS,
                                O.RestructurePOS = src.RestructurePOS,
                                O.Res_POS_to_CurrentPOS_Per = src.Res_POS_to_CurrentPOS_Per,
                                O.CurrentDPD = src.CurrentDPD,
                                O.TotalDPD = src.TotalDPD,
                                O.VDPD = src.VDPD,
                                O.AddlProvPer = src.AddlProvPer,
                                O.ProvReleasePer = src.ProvReleasePer,
                                O.AppliedNormalProvPer = src.AppliedNormalProvPer,
                                O.FinalProvPer = src.FinalProvPer,
                                O.PreDegProvPer = src.PreDegProvPer,
                                O.UpgradeDate = src.UpgradeDate,
                                O.SurvPeriodEndDate = src.SurvPeriodEndDate,
                                O.DegDurSP_PeriodProvPer = src.DegDurSP_PeriodProvPer,
                                O.NonFinDPD = src.NonFinDPD,
                                O.InitialAssetClassAlt_Key = src.InitialAssetClassAlt_Key,
                                O.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                O.RestructureProvision = src.RestructureProvision,
                                O.SecuredProvision = src.SecuredProvision,
                                O.UnSecuredProvision = src.UnSecuredProvision,
                                O.FlgDeg = src.FlgDeg,
                                O.FlgUpg = src.FlgUpg,
                                O.DegDate = src.DegDate,
                                O.RC_Pending = src.RC_Pending,
                                O.FinalNpaDt = src.FinalNpaDt,
                                O.RestructureStage = src.RestructureStage,
                                O.DegReason = src.DegReason,
                                O.InvestmentGrade = src.InvestmentGrade,
                                O.POS_10PerPaidDate = src.POS_10PerPaidDate,
                                O.DPD_MaxNonFin = src.DPD_MaxNonFin,
                                O.DPD_MaxFin = src.DPD_MaxFin,
                                O.FlgMorat = src.FlgMorat,
                                O.PreRestructureNPA_Prov = src.PreRestructureNPA_Prov,
                                O.RestructureFacilityTypeAlt_Key = src.RestructureFacilityTypeAlt_Key;
   SELECT MAX(EntityKey)  

     INTO v_EntityKeyRestr
     FROM PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist ;
   IF v_EntityKeyRestr IS NULL THEN

   BEGIN
      v_EntityKeyRestr := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKeyNew
   FROM TEMP ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal TEMP
          JOIN ( SELECT AdvAcRestructureCal.AccountEntityId ,
                        (v_EntityKeyRestr + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                             FROM DUAL  )  )) EntityKeyNew  
                 FROM PRO_RBL_MISDB_PROD.AdvAcRestructureCal ---Where IsChanged in ('C','N')
                        ) ACCT   ON TEMP.AccountEntityId = ACCT.AccountEntityId ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKeyNew = src.EntityKeyNew;
   --WHERE Temp.IsChanged in ('C','N')
   MERGE INTO T 
   USING (SELECT T.ROWID row_id, 'Y'
   FROM T ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal T
          LEFT JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist B   ON B.EffectiveFromTimeKey = v_TIMEKEY
          AND B.EffectiveToTimeKey = v_TIMEKEY
          AND B.AccountEntityId = T.AccountEntityId 
    WHERE B.AccountEntityId IS NULL) src
   ON ( T.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET t.IsChanged = 'Y';
   /***************************************************************************************************************/
   INSERT INTO PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist
     ( AccountEntityId, AssetClassAlt_KeyOnInvocation, PreRestructureAssetClassAlt_Key, PreRestructureNPA_Date, ProvPerOnRestrucure, RestructureTypeAlt_Key, COVID_OTR_CatgAlt_Key, RestructureDt, SP_ExpiryDate, DPD_AsOnRestructure, RestructureFailureDate, DPD_Breach_Date, ZeroDPD_Date, SP_ExpiryExtendedDate, CurrentPOS, CurrentTOS, RestructurePOS, Res_POS_to_CurrentPOS_Per, CurrentDPD, TotalDPD, VDPD, AddlProvPer, ProvReleasePer, AppliedNormalProvPer, FinalProvPer, PreDegProvPer, UpgradeDate, SurvPeriodEndDate, DegDurSP_PeriodProvPer, NonFinDPD, InitialAssetClassAlt_Key, FinalAssetClassAlt_Key, RestructureProvision, SecuredProvision, UnSecuredProvision, FlgDeg, FlgUpg, DegDate, RC_Pending, FinalNpaDt, RestructureStage, EffectiveFromTimeKey, EffectiveToTimeKey, DegReason, InvestmentGrade, POS_10PerPaidDate, DPD_MaxNonFin, DPD_MaxFin, FlgMorat, PreRestructureNPA_Prov, RestructureFacilityTypeAlt_Key )
     ( SELECT T.AccountEntityId ,
              T.AssetClassAlt_KeyOnInvocation ,
              T.PreRestructureAssetClassAlt_Key ,
              T.PreRestructureNPA_Date ,
              T.ProvPerOnRestrucure ,
              T.RestructureTypeAlt_Key ,
              T.COVID_OTR_CatgAlt_Key ,
              T.RestructureDt ,
              T.SP_ExpiryDate ,
              T.DPD_AsOnRestructure ,
              T.RestructureFailureDate ,
              T.DPD_Breach_Date ,
              T.ZeroDPD_Date ,
              T.SP_ExpiryExtendedDate ,
              T.CurrentPOS ,
              T.CurrentTOS ,
              T.RestructurePOS ,
              T.Res_POS_to_CurrentPOS_Per ,
              T.CurrentDPD ,
              T.TotalDPD ,
              T.VDPD ,
              T.AddlProvPer ,
              T.ProvReleasePer ,
              T.AppliedNormalProvPer ,
              T.FinalProvPer ,
              T.PreDegProvPer ,
              T.UpgradeDate ,
              T.SurvPeriodEndDate ,
              T.DegDurSP_PeriodProvPer ,
              T.NonFinDPD ,
              T.InitialAssetClassAlt_Key ,
              T.FinalAssetClassAlt_Key ,
              T.RestructureProvision ,
              T.SecuredProvision ,
              T.UnSecuredProvision ,
              T.FlgDeg ,
              T.FlgUpg ,
              T.DegDate ,
              T.RC_Pending ,
              T.FinalNpaDt ,
              T.RestructureStage ,
              v_TIMEKEY EffectiveFromTimeKey  ,
              v_TIMEKEY EffectiveToTimeKey  ,
              T.DegReason ,
              T.InvestmentGrade ,
              T.POS_10PerPaidDate ,
              T.DPD_MaxNonFin ,
              T.DPD_MaxFin ,
              T.FlgMorat ,
              T.PreRestructureNPA_Prov ,
              T.RestructureFacilityTypeAlt_Key 
       FROM PRO_RBL_MISDB_PROD.AdvAcRestructureCal T
        WHERE  t.IsChanged = 'Y' );
   SELECT MAX(EntityKey)  

     INTO v_EntityKeyRestr1
     FROM PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist ;
   IF v_EntityKeyRestr1 IS NULL THEN

   BEGIN
      v_EntityKeyRestr1 := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKeyNew
   FROM TEMP ,tt_AdvAcRestructureCal_Moc TEMP
          JOIN ( SELECT tt_AdvAcRestructureCal_Moc.AccountEntityId ,
                        (v_EntityKeyRestr1 + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                              FROM DUAL  )  )) EntityKeyNew  
                 FROM tt_AdvAcRestructureCal_Moc ---Where IsChanged in ('C','N')
                        ) ACCT   ON TEMP.AccountEntityId = ACCT.AccountEntityId ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKeyNew = src.EntityKeyNew;
   --WHERE Temp.IsChanged in ('C','N')
   INSERT INTO PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist
     ( AccountEntityId, AssetClassAlt_KeyOnInvocation, PreRestructureAssetClassAlt_Key, PreRestructureNPA_Date, ProvPerOnRestrucure, RestructureTypeAlt_Key, COVID_OTR_CatgAlt_Key, RestructureDt, SP_ExpiryDate, DPD_AsOnRestructure, RestructureFailureDate, DPD_Breach_Date, ZeroDPD_Date, SP_ExpiryExtendedDate, CurrentPOS, CurrentTOS, RestructurePOS, Res_POS_to_CurrentPOS_Per, CurrentDPD, TotalDPD, VDPD, AddlProvPer, ProvReleasePer, AppliedNormalProvPer, FinalProvPer, PreDegProvPer, UpgradeDate, SurvPeriodEndDate, DegDurSP_PeriodProvPer, NonFinDPD, InitialAssetClassAlt_Key, FinalAssetClassAlt_Key, RestructureProvision, SecuredProvision, UnSecuredProvision, FlgDeg, FlgUpg, DegDate, RC_Pending, FinalNpaDt, RestructureStage, EffectiveFromTimeKey, EffectiveToTimeKey, DegReason, InvestmentGrade, POS_10PerPaidDate, DPD_MaxNonFin, DPD_MaxFin, FlgMorat, PreRestructureNPA_Prov, RestructureFacilityTypeAlt_Key )
     ( SELECT T.AccountEntityId ,
              T.AssetClassAlt_KeyOnInvocation ,
              T.PreRestructureAssetClassAlt_Key ,
              T.PreRestructureNPA_Date ,
              T.ProvPerOnRestrucure ,
              T.RestructureTypeAlt_Key ,
              T.COVID_OTR_CatgAlt_Key ,
              T.RestructureDt ,
              T.SP_ExpiryDate ,
              T.DPD_AsOnRestructure ,
              T.RestructureFailureDate ,
              T.DPD_Breach_Date ,
              T.ZeroDPD_Date ,
              T.SP_ExpiryExtendedDate ,
              T.CurrentPOS ,
              T.CurrentTOS ,
              T.RestructurePOS ,
              T.Res_POS_to_CurrentPOS_Per ,
              T.CurrentDPD ,
              T.TotalDPD ,
              T.VDPD ,
              T.AddlProvPer ,
              T.ProvReleasePer ,
              T.AppliedNormalProvPer ,
              T.FinalProvPer ,
              T.PreDegProvPer ,
              T.UpgradeDate ,
              T.SurvPeriodEndDate ,
              T.DegDurSP_PeriodProvPer ,
              T.NonFinDPD ,
              T.InitialAssetClassAlt_Key ,
              T.FinalAssetClassAlt_Key ,
              T.RestructureProvision ,
              T.SecuredProvision ,
              T.UnSecuredProvision ,
              T.FlgDeg ,
              T.FlgUpg ,
              T.DegDate ,
              T.RC_Pending ,
              T.FinalNpaDt ,
              T.RestructureStage ,
              v_TIMEKEY + 1 EffectiveFromTimeKey  ,
              EffectiveToTimeKey ,
              T.DegReason ,
              T.InvestmentGrade ,
              T.POS_10PerPaidDate ,
              T.DPD_MaxNonFin ,
              T.DPD_MaxFin ,
              T.FlgMorat ,
              T.PreRestructureNPA_Prov ,
              T.RestructureFacilityTypeAlt_Key 
       FROM tt_AdvAcRestructureCal_Moc T
        WHERE  EffectiveToTimeKey > v_TIMEKEY );
   UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
      SET COMPLETED = 'Y',
          ERRORDATE = NULL,
          ERRORDESCRIPTION = NULL,
          COUNT = NVL(COUNT, 0) + 1
    WHERE  RUNNINGPROCESSNAME = 'InsertDataIntoHistTable';

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_MOC" TO "ADF_CDR_RBL_STGDB";
