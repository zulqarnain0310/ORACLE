--------------------------------------------------------
--  DDL for Procedure INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" 
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

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_IntService')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntService int

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_NoCredit')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_NoCredit int

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Overdrawn')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdrawn int

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Overdue')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdue int

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Renewal')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Renewal int

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_StockStmt')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_StockStmt int

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Max')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Max int

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_FinMaxType')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_FinMaxType varchar(50)

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_SMA')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_SMA int

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_PrincOverdue')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_PrincOverdue int

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_IntOverdueSince')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntOverdueSince int

   ----if NOT exists (SELECT * FROM   RBL_MISDB_UAT.INFORMATION_SCHEMA.COLUMNS 

   ----WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_OtherOverdueSince')

   ----ALTER TABLE PRO.ACCOUNTCAL ADD DPD_OtherOverdueSince int
   IF utils.object_id('Tempdb..tt_CustMocData_2') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CustMocData_2 ';
   END IF;
   DELETE FROM tt_CustMocData_2;
   UTILS.IDENTITY_RESET('tt_CustMocData_2');

   INSERT INTO tt_CustMocData_2 ( 
   	SELECT DISTINCT UCIF_ID 
   	  FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist 
   	 WHERE  ( EffectiveFromTimeKey <= v_TimeKey
              AND EffectiveToTimeKey >= v_TimeKey )
              AND FlgMoc = 'Y' );
   INSERT INTO tt_CustMocData_2
     ( SELECT UCIF_ID 
       FROM ( SELECT DISTINCT UCIF_ID 
              FROM PRO_RBL_MISDB_PROD.AccountCal_Hist 
               WHERE  ( EffectiveFromTimeKey <= v_TimeKey
                        AND EffectiveToTimeKey >= v_TimeKey )
                        AND FlgMoc = 'Y'
              MINUS 
              SELECT DISTINCT UCIF_ID 
              FROM tt_CustMocData_2  ) A );
   WITH CTE_CUSTCAL AS ( SELECT A.* 
     FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist A
            JOIN tt_CustMocData_2 B   ON ( A.EffectiveFromTimeKey <= v_TimeKey
            AND A.EffectiveToTimeKey >= v_TimeKey )
            AND A.UCIF_ID = B.UCIF_ID ) 
      INSERT INTO PRO_RBL_MISDB_PROD.CUSTOMERCAL
        ( BranchCode, UCIF_ID, UcifEntityID, CustomerEntityID, ParentCustomerID, RefCustomerID, SourceSystemCustomerID, CustomerName, CustSegmentCode, ConstitutionAlt_Key, PANNO, AadharCardNO, SrcAssetClassAlt_Key, SysAssetClassAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SMA_Class_Key, PNPA_Class_Key, PrvQtrRV, CurntQtrRv, TotProvision, RBITotProvision, BankTotProvision, SrcNPA_Dt, SysNPA_Dt, DbtDt, DbtDt2, DbtDt3, LossDt, MOC_Dt, ErosionDt, SMA_Dt, PNPA_Dt, Asset_Norm, FlgDeg, FlgUpg, FlgMoc, FlgSMA, FlgProcessing, FlgErosion, FlgPNPA, FlgPercolation, FlgInMonth, FlgDirtyRow, DegDate, EffectiveFromTimeKey, EffectiveToTimeKey, CommonMocTypeAlt_Key, InMonthMark, MocStatusMark, SourceAlt_Key, BankAssetClass, Cust_Expo, MOCReason, AddlProvisionPer, FraudDt, FraudAmount, DegReason, CustMoveDescription, TotOsCust, MOCTYPE )
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
                 A.CustMoveDescription ,
                 A.TotOsCust ,
                 A.MOCTYPE 
          FROM CTE_CUSTCAL A )
      ;
   WITH CTE_ACCOUNTCAL AS ( SELECT A.* 
     FROM PRO_RBL_MISDB_PROD.AccountCal_Hist A
            JOIN tt_CustMocData_2 B   ON ( A.EffectiveFromTimeKey <= v_TimeKey
            AND A.EffectiveToTimeKey >= v_TimeKey )
            AND A.UCIF_ID = B.UCIF_ID ) 
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
      , RelationshipNumber, AccountFlag, CommercialFlag_AltKey, Liability, CD, AccountStatus, AccountBlkCode1, AccountBlkCode2, ExposureType, Mtm_Value, BankAssetClass, NpaType, SecApp, BorrowerTypeID, LineCode, ProvPerSecured, ProvPerUnSecured, MOCReason, AddlProvisionPer, FlgINFRA, RepossessionDate, DerecognisedInterest1, DerecognisedInterest2, ProductCode, FlgLCBG, unserviedint, AdvanceRecovery, NotionalInttAmt, OriginalBranchcode, PrvAssetClassAlt_Key, FlgSecured, RePossession, RCPending, PaymentPending, WheelCase, CustomerLevelMaxPer, FinalProvisionPer, IsIBPC, IsSecuritised, RFA, IsNonCooperative, Sarfaesi, WeakAccount, PUI, FlgRestructure, RestructureDate, WeakAccountDate, SarfaesiDate, FlgUnusualBounce, UnusualBounceDate, FlgUnClearedEffect, UnClearedEffectDate, FlgFraud, FraudDate )
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
          FROM CTE_ACCOUNTCAL A )
      ;
   --UPDATE A SET A.SYSASSETCLASSALT_KEY=DA.ASSETCLASSALT_KEY,A.SYSNPA_DT=B.NPADATE,A.FLGMOC='Y',A.ASSET_NORM='ALWYS_NPA',A.MOCREASON=B.MOCREASON,DEGREASON='NPA DUE TO MOC',A.MOC_DT=B.DATECREATED,A.MOCTYPE=B.MOCTYPE
   --       FROM PRO.CUSTOMERCAL A
   -- INNER JOIN DATAUPLOAD.MOCCUSTOMERDATAUPLOAD B ON A.REFCUSTOMERID=B.CUSTOMERID
   --     INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.MOCAssetClassification AND
   --                           DA.ASSETCLASSSHORTNAME<>'STD' AND  
   --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND
   --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --WHERE B.MOCTYPE='MANUAL' AND B.EFFECTIVETOTIMEKEY=49999
   --UPDATE A SET A.SYSASSETCLASSALT_KEY=DA.ASSETCLASSALT_KEY,A.SYSNPA_DT=B.NPADATE,A.FLGMOC='Y',A.ASSET_NORM='NORMAL',A.MOCREASON=B.MOCREASON,DEGREASON='NPA DUE TO MOC',A.MOC_DT=B.DATECREATED,A.MOCTYPE=B.MOCTYPE
   --FROM PRO.CUSTOMERCAL A
   --INNER JOIN DATAUPLOAD.MOCCUSTOMERDATAUPLOAD B ON A.REFCUSTOMERID=B.CUSTOMERID
   --    INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.MOCAssetClassification AND
   --                           DA.ASSETCLASSSHORTNAME<>'STD' AND  
   --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND
   --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --WHERE B.MOCTYPE='AUTO' AND  B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  B.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --UPDATE A SET A.SYSASSETCLASSALT_KEY=DA.ASSETCLASSALT_KEY,A.SYSNPA_DT=NULL,A.DBTDT =NULL,A.FLGMOC='Y',A.ASSET_NORM='ALWYS_STD',A.MOCREASON=B.MOCREASON,DEGREASON='STD DUE TO MOC',A.MOC_DT=B.DATECREATED,A.MOCTYPE=B.MOCTYPE
   -- FROM PRO.CUSTOMERCAL A
   --INNER JOIN DATAUPLOAD.MOCCUSTOMERDATAUPLOAD B ON A.REFCUSTOMERID=B.CUSTOMERID
   --  INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.MOCAssetClassification AND
   --                           DA.ASSETCLASSSHORTNAME='STD' AND  
   --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND
   --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --WHERE B.MOCTYPE='MANUAL' AND B.EFFECTIVETOTIMEKEY=49999
   --UPDATE A SET A.SYSASSETCLASSALT_KEY=DA.ASSETCLASSALT_KEY,A.SYSNPA_DT=NULL,A.DBTDT =NULL,A.FLGMOC='Y',A.ASSET_NORM='NORMAL',A.MOCREASON=B.MOCREASON,DEGREASON='STD DUE TO MOC',A.MOC_DT=B.DATECREATED,A.MOCTYPE=B.MOCTYPE
   -- FROM PRO.CUSTOMERCAL A
   --INNER JOIN DATAUPLOAD.MOCCUSTOMERDATAUPLOAD B ON A.REFCUSTOMERID=B.CUSTOMERID
   -- INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.MOCAssetClassification AND
   --                           DA.ASSETCLASSSHORTNAME='STD' AND  
   --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND
   --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --WHERE B.MOCTYPE='AUTO' AND  B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  B.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --UPDATE A SET A.FinalAssetClassAlt_Key=DA.ASSETCLASSALT_KEY,A.FinalNpaDt=B.NPADATE,A.FlgMoc='Y',A.ASSET_NORM='ALWYS_NPA',A.MOCREASON=B.MOCREASON,DEGREASON='NPA DUE TO MOC',A.MOC_DT=B.DATECREATED
   --       FROM PRO.ACCOUNTCAL A
   -- INNER JOIN DATAUPLOAD.MOCCUSTOMERDATAUPLOAD B ON A.REFCUSTOMERID=B.CUSTOMERID
   --     INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.MOCAssetClassification AND
   --                           DA.ASSETCLASSSHORTNAME<>'STD' AND  
   --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND
   --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --WHERE B.MOCTYPE='MANUAL' AND B.EFFECTIVETOTIMEKEY=49999
   --UPDATE A SET A.FinalAssetClassAlt_Key=DA.ASSETCLASSALT_KEY,A.FinalNpaDt=B.NPADATE,A.FLGMOC='Y',A.ASSET_NORM='NORMAL',A.MOCREASON=B.MOCREASON,DEGREASON='NPA DUE TO MOC',A.MOC_DT=B.DATECREATED
   --FROM PRO.ACCOUNTCAL A
   --INNER JOIN DATAUPLOAD.MOCCUSTOMERDATAUPLOAD B ON A.REFCUSTOMERID=B.CUSTOMERID
   --    INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.MOCAssetClassification AND
   --                           DA.ASSETCLASSSHORTNAME<>'STD' AND  
   --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND
   --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --WHERE B.MOCTYPE='AUTO' AND  B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  B.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --UPDATE A SET A.FinalAssetClassAlt_Key=DA.ASSETCLASSALT_KEY,A.FinalNpaDt=NULL,A.FLGMOC='Y',A.ASSET_NORM='ALWYS_STD',A.MOCREASON=B.MOCREASON,DEGREASON='STD DUE TO MOC',A.MOC_DT=B.DATECREATED
   -- FROM PRO.ACCOUNTCAL A
   --INNER JOIN DATAUPLOAD.MOCCUSTOMERDATAUPLOAD B ON A.REFCUSTOMERID=B.CUSTOMERID
   --  INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.MOCAssetClassification AND
   --                           DA.ASSETCLASSSHORTNAME='STD' AND  
   --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND
   --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --WHERE B.MOCTYPE='MANUAL' AND B.EFFECTIVETOTIMEKEY=49999
   --UPDATE A SET A.FinalAssetClassAlt_Key=DA.ASSETCLASSALT_KEY,A.FinalNpaDt=NULL,A.FLGMOC='Y',A.ASSET_NORM='NORMAL',A.MOCREASON=B.MOCREASON,DEGREASON='STD DUE TO MOC',A.MOC_DT=B.DATECREATED
   -- FROM PRO.ACCOUNTCAL A
   --INNER JOIN DATAUPLOAD.MOCCUSTOMERDATAUPLOAD B ON A.REFCUSTOMERID=B.CUSTOMERID
   -- INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.MOCAssetClassification AND
   --                           DA.ASSETCLASSSHORTNAME='STD' AND  
   --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND
   --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --WHERE B.MOCTYPE='AUTO' AND  B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  B.EFFECTIVETOTIMEKEY>=@TIMEKEY
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
   --UPDATE A SET A.Balance=B.Balance
   --   FROM PRO.AccountCal A
   -- INNER JOIN DATAUPLOAD.MocAccountDataUpload B ON A.CustomerAcID=B.CustomerAcID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --	AND B.Balance IS NOT NULL
   --UPDATE A SET A.Balance=(A.Balance-B.AmountofWriteOff)
   --   FROM PRO.AccountCal A
   -- INNER JOIN DATAUPLOAD.MocAccountDataUpload B ON A.CustomerAcID=B.CustomerAcID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --	AND B.AmountofWriteOff >0 and A.Balance>0
   --	UPDATE A SET A.Balance=0
   --   FROM PRO.AccountCal A
   -- INNER JOIN DATAUPLOAD.MocAccountDataUpload B ON A.CustomerAcID=B.CustomerAcID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --	AND B.AmountofWriteOff >0 and A.Balance<0
   --UPDATE A SET  NpaType='Owned'
   --   FROM PRO.AccountCal A
   -- INNER JOIN DATAUPLOAD.MocAccountDataUpload B ON A.CustomerAcID=B.CustomerAcID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --	AND (B.SecuritizedAcc='N' OR B.SecuritizedAcc=' N')
   --UPDATE A SET  NpaType='Managed'
   --   FROM PRO.AccountCal A
   -- INNER JOIN DATAUPLOAD.MocAccountDataUpload B ON A.CustomerAcID=B.CustomerAcID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --	AND ( B.SecuritizedAcc='Y' OR B.SecuritizedAcc=' Y')
   --	UPDATE A SET  MOCTYPE=B.MOCNature
   --   FROM PRO.AccountCal A
   -- INNER JOIN DATAUPLOAD.MocAccountDataUpload B ON A.CustomerAcID=B.CustomerAcID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --UPDATE A SET A.AddlProvisionPer=B.AdditionalProvision
   --   FROM PRO.CUSTOMERCAL A
   -- INNER JOIN DATAUPLOAD.MOCCUSTOMERDATAUPLOAD B ON A.REFCUSTOMERID=B.CUSTOMERID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --	AND B.AdditionalProvision >0
   --UPDATE A SET A.CurntQtrRv=B.MOCCompSecurityVal
   --   FROM PRO.CUSTOMERCAL A
   -- INNER JOIN DATAUPLOAD.MOCCUSTOMERDATAUPLOAD B ON A.REFCUSTOMERID=B.CUSTOMERID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --	AND B.MOCCompSecurityVal IS NOT NULL
   --	UPDATE B SET SecurityValue=0
   --from DataUpload.MocCustomerDataUpload a
   --inner JOIN PRO.AccountCal b on A.customerid=b.REFcustomerid
   -- where MOCCompSecurityVal=0
   -- AND A.EffectiveToTimeKey=49999
   --;WITH CTE(REFCUSTOMERID,TOTOSFUNDED)                    
   --AS                    
   --(                    
   --SELECT B.REFCUSTOMERID,SUM(ISNULL(A.BALANCE,0)) TOTOSFUNDED
   -- FROM  PRO.ACCOUNTCAL A    INNER JOIN PRO.CUSTOMERCAL B ON A.CUSTOMERENTITYID=B.CUSTOMERENTITYID    
   -- INNER JOIN DataUpload.MocCustomerDataUpload E ON E.customerid=B.RefCustomerID                             
   --WHERE A.BALANCE>0  AND E.MOCCompSecurityVal>0 AND E.EffectiveToTimeKey=49999
   --GROUP BY B.REFCUSTOMERID                  
   --)                                          
   --UPDATE D SET D.                                    
   --SecurityValue=CASE WHEN  ((D.NETBALANCE/A.TOTOSFUNDED)*C.MOCCompSecurityVal)>D.NETBALANCE THEN D.NETBALANCE       
   --ELSE ((D.NETBALANCE/A.TOTOSFUNDED)*C.MOCCompSecurityVal) END                                        
   --from CTE A inner join PRO.CustomerCal B on A.REFCUSTOMERID=B.REFCUSTOMERID                             
   --inner join DataUpload.MocCustomerDataUpload C on C.customerid=B.REFCUSTOMERID                    
   --INNER JOIN   pro.AccountCal D on D.RefCustomerID=B.RefCustomerID                  
   --WHERE c.MOCCompSecurityVal>0
   --AND C.EffectiveToTimeKey=49999
   ------UPDATE A SET A.ADDLPROVISION=B.AdditionalProvision
   ------   FROM PRO.AccountCal A
   ------ INNER JOIN DATAUPLOAD.MocAccountDataUpload B ON A.CustomerAcID=B.CustomerAcID
   ------    WHERE B.EFFECTIVETOTIMEKEY=49999
   ------	AND B.AdditionalProvisionAmount>0
   --UPDATE A SET A.ADDLPROVISION=B.AdditionalProvisionAmount
   --   FROM PRO.AccountCal A
   -- INNER JOIN DATAUPLOAD.MocAccountDataUpload B ON A.CustomerAcID=B.CustomerAcID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --	AND B.AdditionalProvisionAmount>0
   --UPDATE A SET A.unserviedint=B.UnservInterestAmt
   --   FROM PRO.AccountCal A
   -- INNER JOIN DATAUPLOAD.MocAccountDataUpload B ON A.CustomerAcID=B.CustomerAcID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --	AND B.UnservInterestAmt IS NOT NULL
   --UPDATE A SET A.AddlProvisionPer=B.AdditionalProvision
   --   FROM PRO.AccountCal A
   -- INNER JOIN DATAUPLOAD.MocAccountDataUpload B ON A.CustomerAcID=B.CustomerAcID
   --    WHERE B.EFFECTIVETOTIMEKEY=49999
   --	AND B.AdditionalProvision>=0
   --UPDATE A SET A.AddlProvision=(A.Balance * A.AddlProvisionPer)/100
   --   FROM PRO.AccountCal A
   -- INNER JOIN DATAUPLOAD.MocAccountDataUpload B ON A.CustomerAcID=B.CustomerAcID
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
   EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CustMocData_2 ';

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONAUSFB_MOC_04122023" TO "ADF_CDR_RBL_STGDB";
