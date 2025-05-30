--------------------------------------------------------
--  DDL for Procedure INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" 
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
   v_WOEntityIDEntityId NUMBER(10,0);

BEGIN

   SELECT TIMEKEY 

     INTO v_TIMEKEY
     FROM SYSDAYMATRIX 
    WHERE  TIMEKEY = v_TIMEKEY;
   EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.CUSTOMERCAL ';
   EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.ACCOUNTCAL ';
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntService int
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_NoCredit int
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdrawn int
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdue int
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Renewal int
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_StockStmt int
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Max int 
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_FinMaxType varchar(50)
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_SMA int 
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_PrincOverdue int
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntOverdueSince int
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_OtherOverdueSince int
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_IntService')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntService int
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_NoCredit')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_NoCredit int
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Overdrawn')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdrawn int
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Overdue')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdue int
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Renewal')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Renewal int
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_StockStmt')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_StockStmt int
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Max')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Max int
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_FinMaxType')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_FinMaxType varchar(50)
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_SMA')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_SMA int
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_PrincOverdue')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_PrincOverdue int
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_IntOverdueSince')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntOverdueSince int
   --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
   --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_OtherOverdueSince')
   --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_OtherOverdueSince int
   DELETE DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload

    WHERE  EffectiveToTimeKey <> 49999;
   DELETE DataUpload_RBL_MISDB_PROD.MocAccountDataUpload

    WHERE  EffectiveToTimeKey <> 49999;
   UPDATE DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload
      SET MOCAssetClassification = 'LOS'
    WHERE  MOCAssetClassification = 'LOSS';
   UPDATE DataUpload_RBL_MISDB_PROD.MocAccountDataUpload
      SET SecuritizedAcc = 'N'
    WHERE  SecuritizedAcc = ' N';
   UPDATE DataUpload_RBL_MISDB_PROD.MocAccountDataUpload
      SET SecuritizedAcc = 'Y'
    WHERE  SecuritizedAcc = ' Y';
   IF utils.object_id('Tempdb..tt_CustMocData_4') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CustMocData_4 ';
   END IF;
   DELETE FROM tt_CustMocData_4;
   UTILS.IDENTITY_RESET('tt_CustMocData_4');

   INSERT INTO tt_CustMocData_4 ( 
   	SELECT DISTINCT CustomerID 
   	  FROM DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload 
   	 WHERE  ( EffectiveFromTimeKey <= v_TimeKey
              AND EffectiveToTimeKey >= v_TimeKey ) );
   INSERT INTO tt_CustMocData_4
     ( SELECT CustomerID 
       FROM ( SELECT DISTINCT CustomerID 
              FROM DataUpload_RBL_MISDB_PROD.MocAccountDataUpload 
               WHERE  ( EffectiveFromTimeKey <= v_TimeKey
                        AND EffectiveToTimeKey >= v_TimeKey )
              MINUS 
              SELECT DISTINCT CustomerID 
              FROM tt_CustMocData_4  ) A );
   WITH CTE_CUSTCAL AS ( SELECT A.* 
     FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist A
            JOIN tt_CustMocData_4 B   ON ( A.EffectiveFromTimeKey = v_TimeKey
            AND A.EffectiveToTimeKey = v_TimeKey )
            AND A.RefCustomerID = B.CustomerID ) 
      INSERT INTO PRO_RBL_MISDB_PROD.CUSTOMERCAL
        ( BranchCode, UCIF_ID, UcifEntityID, CustomerEntityID, ParentCustomerID, RefCustomerID, SourceSystemCustomerID, CustomerName, CustSegmentCode, ConstitutionAlt_Key, PANNO, AadharCardNO, SrcAssetClassAlt_Key, SysAssetClassAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SMA_Class_Key, PNPA_Class_Key, PrvQtrRV, CurntQtrRv, TotProvision, RBITotProvision, BankTotProvision, SrcNPA_Dt, SysNPA_Dt, DbtDt, DbtDt2, DbtDt3, LossDt, MOC_Dt, ErosionDt, SMA_Dt, PNPA_Dt, Asset_Norm, FlgDeg, FlgUpg, FlgMoc, FlgSMA, FlgProcessing, FlgErosion, FlgPNPA, FlgPercolation, FlgInMonth, FlgDirtyRow, DegDate, EffectiveFromTimeKey, EffectiveToTimeKey, CommonMocTypeAlt_Key, InMonthMark, MocStatusMark, SourceAlt_Key, BankAssetClass, Cust_Expo, MOCReason, AddlProvisionPer, FraudDt, FraudAmount, DegReason, DateOfData, CustMoveDescription, TotOsCust, MOCTYPE )
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
                 A.DateOfData ,
                 A.CustMoveDescription ,
                 A.TotOsCust ,
                 A.MOCTYPE 
          FROM CTE_CUSTCAL A )
      ;
   WITH CTE_ACCOUNTCAL AS ( SELECT A.* 
     FROM PRO_RBL_MISDB_PROD.AccountCal_Hist A
            JOIN tt_CustMocData_4 B   ON ( A.EffectiveFromTimeKey = v_TimeKey
            AND A.EffectiveToTimeKey = v_TimeKey )
            AND A.RefCustomerID = B.CustomerID ) 
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
      , RelationshipNumber, AccountFlag, CommercialFlag_AltKey, Liability, CD, AccountStatus, AccountBlkCode1, AccountBlkCode2, ExposureType, Mtm_Value, BankAssetClass, NpaType, SecApp, BorrowerTypeID, LineCode, ProvPerSecured, ProvPerUnSecured, MOCReason, AddlProvisionPer, FlgINFRA, RepossessionDate, DateOfData, DerecognisedInterest1, DerecognisedInterest2, ProductCode, FlgLCBG, unserviedint, AdvanceRecovery, NotionalInttAmt, OriginalBranchcode, PrvAssetClassAlt_Key, FlgSecured )
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
                 A.DateOfData ,
                 A.DerecognisedInterest1 ,
                 A.DerecognisedInterest2 ,
                 A.ProductCode ,
                 A.FlgLCBG ,
                 A.unserviedint ,
                 A.AdvanceRecovery ,
                 A.NotionalInttAmt ,
                 A.OriginalBranchcode ,
                 a.PrvAssetClassAlt_Key ,
                 A.FlgSecured 
          FROM CTE_ACCOUNTCAL A )
      ;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, B.NPADATE, 'Y', 'ALWYS_NPA', B.MOCREASON, 'NPA DUE TO MOC' AS pos_7, B.DATECREATED, B.MOCTYPE
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload B   ON A.RefCustomerID = B.CUSTOMERID
          JOIN DIMASSETCLASS DA   ON DA.ASSETCLASSSHORTNAME = B.MOCAssetClassification
          AND DA.ASSETCLASSSHORTNAME <> 'STD'
          AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
    WHERE B.MOCTYPE = 'MANUAL'
     AND B.EFFECTIVETOTIMEKEY = 49999) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.ASSETCLASSALT_KEY,
                                A.SYSNPA_DT = src.NPADATE,
                                A.FLGMOC = 'Y',
                                A.ASSET_NORM = 'ALWYS_NPA',
                                A.MOCREASON = src.MOCREASON,
                                A.DEGREASON = pos_7,
                                A.MOC_DT = src.DATECREATED,
                                A.MOCTYPE = src.MOCTYPE;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, B.NPADATE, 'Y', 'NORMAL', B.MOCREASON, 'NPA DUE TO MOC' AS pos_7, B.DATECREATED, B.MOCTYPE
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload B   ON A.RefCustomerID = B.CUSTOMERID
          JOIN DIMASSETCLASS DA   ON DA.ASSETCLASSSHORTNAME = B.MOCAssetClassification
          AND DA.ASSETCLASSSHORTNAME <> 'STD'
          AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
    WHERE B.MOCTYPE = 'AUTO'
     AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
     AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.ASSETCLASSALT_KEY,
                                A.SYSNPA_DT = src.NPADATE,
                                A.FLGMOC = 'Y',
                                A.ASSET_NORM = 'NORMAL',
                                A.MOCREASON = src.MOCREASON,
                                A.DEGREASON = pos_7,
                                A.MOC_DT = src.DATECREATED,
                                A.MOCTYPE = src.MOCTYPE;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, NULL, NULL, 'Y', 'ALWYS_STD', B.MOCREASON, 'STD DUE TO MOC' AS pos_8, B.DATECREATED, B.MOCTYPE
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload B   ON A.RefCustomerID = B.CUSTOMERID
          JOIN DIMASSETCLASS DA   ON DA.ASSETCLASSSHORTNAME = B.MOCAssetClassification
          AND DA.ASSETCLASSSHORTNAME = 'STD'
          AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
    WHERE B.MOCTYPE = 'MANUAL'
     AND B.EFFECTIVETOTIMEKEY = 49999) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.ASSETCLASSALT_KEY,
                                A.SYSNPA_DT = NULL,
                                A.DBTDT = NULL,
                                A.FLGMOC = 'Y',
                                A.ASSET_NORM = 'ALWYS_STD',
                                A.MOCREASON = src.MOCREASON,
                                A.DEGREASON = pos_8,
                                A.MOC_DT = src.DATECREATED,
                                A.MOCTYPE = src.MOCTYPE;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, NULL, NULL, 'Y', 'NORMAL', B.MOCREASON, 'STD DUE TO MOC' AS pos_8, B.DATECREATED, B.MOCTYPE
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload B   ON A.RefCustomerID = B.CUSTOMERID
          JOIN DIMASSETCLASS DA   ON DA.ASSETCLASSSHORTNAME = B.MOCAssetClassification
          AND DA.ASSETCLASSSHORTNAME = 'STD'
          AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
    WHERE B.MOCTYPE = 'AUTO'
     AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
     AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.ASSETCLASSALT_KEY,
                                A.SYSNPA_DT = NULL,
                                A.DBTDT = NULL,
                                A.FLGMOC = 'Y',
                                A.ASSET_NORM = 'NORMAL',
                                A.MOCREASON = src.MOCREASON,
                                A.DEGREASON = pos_8,
                                A.MOC_DT = src.DATECREATED,
                                A.MOCTYPE = src.MOCTYPE;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, B.NPADATE, 'Y', 'ALWYS_NPA', B.MOCREASON, 'NPA DUE TO MOC' AS pos_7, B.DATECREATED
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload B   ON A.RefCustomerID = B.CUSTOMERID
          JOIN DIMASSETCLASS DA   ON DA.ASSETCLASSSHORTNAME = B.MOCAssetClassification
          AND DA.ASSETCLASSSHORTNAME <> 'STD'
          AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
    WHERE B.MOCTYPE = 'MANUAL'
     AND B.EFFECTIVETOTIMEKEY = 49999) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.ASSETCLASSALT_KEY,
                                A.FinalNpaDt = src.NPADATE,
                                A.FlgMoc = 'Y',
                                A.ASSET_NORM = 'ALWYS_NPA',
                                A.MOCREASON = src.MOCREASON,
                                DA.DEGREASON = pos_7,
                                A.MOC_DT = src.DATECREATED;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, B.NPADATE, 'Y', 'NORMAL', B.MOCREASON, 'NPA DUE TO MOC' AS pos_7, B.DATECREATED
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload B   ON A.RefCustomerID = B.CUSTOMERID
          JOIN DIMASSETCLASS DA   ON DA.ASSETCLASSSHORTNAME = B.MOCAssetClassification
          AND DA.ASSETCLASSSHORTNAME <> 'STD'
          AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
    WHERE B.MOCTYPE = 'AUTO'
     AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
     AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.ASSETCLASSALT_KEY,
                                A.FinalNpaDt = src.NPADATE,
                                A.FLGMOC = 'Y',
                                A.ASSET_NORM = 'NORMAL',
                                A.MOCREASON = src.MOCREASON,
                                DA.DEGREASON = pos_7,
                                A.MOC_DT = src.DATECREATED;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, NULL, 'Y', 'ALWYS_STD', B.MOCREASON, 'STD DUE TO MOC' AS pos_7, B.DATECREATED
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload B   ON A.RefCustomerID = B.CUSTOMERID
          JOIN DIMASSETCLASS DA   ON DA.ASSETCLASSSHORTNAME = B.MOCAssetClassification
          AND DA.ASSETCLASSSHORTNAME = 'STD'
          AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
    WHERE B.MOCTYPE = 'MANUAL'
     AND B.EFFECTIVETOTIMEKEY = 49999) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.ASSETCLASSALT_KEY,
                                A.FinalNpaDt = NULL,
                                A.FLGMOC = 'Y',
                                A.ASSET_NORM = 'ALWYS_STD',
                                A.MOCREASON = src.MOCREASON,
                                DA.DEGREASON = pos_7,
                                A.MOC_DT = src.DATECREATED;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, NULL, 'Y', 'NORMAL', B.MOCREASON, 'STD DUE TO MOC' AS pos_7, B.DATECREATED
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload B   ON A.RefCustomerID = B.CUSTOMERID
          JOIN DIMASSETCLASS DA   ON DA.ASSETCLASSSHORTNAME = B.MOCAssetClassification
          AND DA.ASSETCLASSSHORTNAME = 'STD'
          AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
          AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
    WHERE B.MOCTYPE = 'AUTO'
     AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
     AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.ASSETCLASSALT_KEY,
                                A.FinalNpaDt = NULL,
                                A.FLGMOC = 'Y',
                                A.ASSET_NORM = 'NORMAL',
                                A.MOCREASON = src.MOCREASON,
                                DA.DEGREASON = pos_7,
                                A.MOC_DT = src.DATECREATED;
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
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.Balance
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocAccountDataUpload B   ON A.CustomerAcID = B.CustomerAcID 
    WHERE B.EFFECTIVETOTIMEKEY = 49999
     AND B.Balance IS NOT NULL) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Balance = src.Balance;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, (A.Balance - B.AmountofWriteOff) AS Balance
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocAccountDataUpload B   ON A.CustomerAcID = B.CustomerAcID 
    WHERE B.EFFECTIVETOTIMEKEY = 49999
     AND B.AmountofWriteOff > 0
     AND A.Balance > 0) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Balance = src.Balance;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 0
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocAccountDataUpload B   ON A.CustomerAcID = B.CustomerAcID 
    WHERE B.EFFECTIVETOTIMEKEY = 49999
     AND B.AmountofWriteOff > 0
     AND A.Balance < 0) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Balance = 0;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'Owned'
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocAccountDataUpload B   ON A.CustomerAcID = B.CustomerAcID 
    WHERE B.EFFECTIVETOTIMEKEY = 49999
     AND ( B.SecuritizedAcc = 'N'
     OR B.SecuritizedAcc = ' N' )) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET NpaType = 'Owned';
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'Managed'
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocAccountDataUpload B   ON A.CustomerAcID = B.CustomerAcID 
    WHERE B.EFFECTIVETOTIMEKEY = 49999
     AND ( B.SecuritizedAcc = 'Y'
     OR B.SecuritizedAcc = ' Y' )) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET NpaType = 'Managed';
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.MOCNature
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocAccountDataUpload B   ON A.CustomerAcID = B.CustomerAcID 
    WHERE B.EFFECTIVETOTIMEKEY = 49999) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET MOCTYPE = src.MOCNature;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.AdditionalProvision
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload B   ON A.RefCustomerID = B.CUSTOMERID 
    WHERE B.EFFECTIVETOTIMEKEY = 49999
     AND B.AdditionalProvision > 0) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.AddlProvisionPer = src.AdditionalProvision;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.MOCCompSecurityVal
   FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload B   ON A.RefCustomerID = B.CUSTOMERID 
    WHERE B.EFFECTIVETOTIMEKEY = 49999
     AND B.MOCCompSecurityVal IS NOT NULL) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.CurntQtrRv = src.MOCCompSecurityVal;
   MERGE INTO B 
   USING (SELECT B.ROWID row_id, 0
   FROM B ,DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload a
          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL b   ON A.customerid = b.RefCustomerID 
    WHERE MOCCompSecurityVal = 0
     AND A.EffectiveToTimeKey = 49999) src
   ON ( B.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET SecurityValue = 0;
   WITH CTE ( REFCUSTOMERID,
              TOTOSFUNDED ) AS ( SELECT B.REFCUSTOMERID ,
                                        SUM(NVL(A.BALANCE, 0))  TOTOSFUNDED  
     FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
            JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID
            JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload E   ON E.customerid = B.RefCustomerID
    WHERE  A.BALANCE > 0
             AND E.MOCCompSecurityVal > 0
             AND E.EffectiveToTimeKey = 49999
     GROUP BY B.REFCUSTOMERID ) 
      MERGE INTO D 
      USING (SELECT D.ROWID row_id, CASE 
      WHEN ((D.NETBALANCE / A.TOTOSFUNDED) * C.MOCCompSecurityVal) > D.NETBALANCE THEN D.NETBALANCE
      ELSE ((D.NETBALANCE / A.TOTOSFUNDED) * C.MOCCompSecurityVal)
         END AS SecurityValue
      FROM D ,CTE A
             JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.REFCUSTOMERID = B.REFCUSTOMERID
             JOIN DataUpload_RBL_MISDB_PROD.MocCustomerDataUpload C   ON C.customerid = B.REFCUSTOMERID
             JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL D   ON D.RefCustomerID = B.RefCustomerID 
       WHERE c.MOCCompSecurityVal > 0
        AND C.EffectiveToTimeKey = 49999) src
      ON ( D.ROWID = src.row_id )
      WHEN MATCHED THEN UPDATE SET D.SecurityValue = src.SecurityValue
      ;
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
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.UnservInterestAmt
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocAccountDataUpload B   ON A.CustomerAcID = B.CustomerAcID 
    WHERE B.EFFECTIVETOTIMEKEY = 49999
     AND B.UnservInterestAmt IS NOT NULL) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.unserviedint = src.UnservInterestAmt;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.AdditionalProvision
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocAccountDataUpload B   ON A.CustomerAcID = B.CustomerAcID 
    WHERE B.EFFECTIVETOTIMEKEY = 49999
     AND B.AdditionalProvision >= 0) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.AddlProvisionPer = src.AdditionalProvision;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, (A.Balance * A.AddlProvisionPer) / 100 AS AddlProvision
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DataUpload_RBL_MISDB_PROD.MocAccountDataUpload B   ON A.CustomerAcID = B.CustomerAcID 
    WHERE B.EFFECTIVETOTIMEKEY = 49999
     AND B.AdditionalProvision >= 0) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.AddlProvision = src.AddlProvision;
   --	UPDATE A SET SECAPP='S' FROM PRO.ACCOUNTCAL A 
   -- INNER JOIN DIMSOURCEDB B ON A.SOURCEALT_KEY=B.SOURCEALT_KEY
   ----AND B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND B.EFFECTIVETOTIMEKEY>=@TIMEKEY
   --WHERE  ISNULL(A.BALANCE,0)>0 AND A.FINALASSETCLASSALT_KEY NOT IN (6)
   --AND A.PRODUCTCODE IN('6002','7001','7004','7006','7002','7003','7007','8004','8008','8005','CVB','CVN','CVR','LAP1','LAP2','LAP3','LAP4','LAP5','LAP8','LAP9','LAPC' )
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
   --AND (A.EffectiveFromTimeKey<=@TIMEKEY AND A.EffectiveToTimeKey>=@TIMEKEY) 
   --AND (B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveToTimeKey>=@TIMEKEY)
   --UPDATE DATAUPLOAD.MOCCUSTOMERDATAUPLOAD SET EFFECTIVETOTIMEKEY=EFFECTIVEFROMTIMEKEY WHERE MOCTYPE='AUTO'
   IF utils.object_id('TEMPDB..tt_AdvAcWODetail') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_AdvAcWODetail ';
   END IF;
   DELETE FROM tt_AdvAcWODetail;
   UTILS.IDENTITY_RESET('tt_AdvAcWODetail');

   INSERT INTO tt_AdvAcWODetail ( 
   	SELECT CustomerACID ,
           AmountofWriteOff 
   	  FROM DataUpload_RBL_MISDB_PROD.MocAccountDataUpload 
   	 WHERE  AmountofWriteOff > 0
   	MINUS 
   	SELECT CustomerACID ,
           WriteOffAmt AmountofWriteOff  
   	  FROM CurDat_RBL_MISDB_PROD.AdvAcWODetail 
   	 WHERE  EffectiveFromTimeKey <= v_TIMEKEY
              AND EffectiveToTimeKey >= v_TIMEKEY );
   SELECT MAX(WOEntityID)  

     INTO v_WOEntityIDEntityId
     FROM CurDat_RBL_MISDB_PROD.AdvAcWODetail ;
   /*TODO:SQLDEV*/ SET DATEFORMAT DMY /*END:SQLDEV*/
   INSERT INTO CurDat_RBL_MISDB_PROD.AdvAcWODetail
     ( BranchCode, CustomerEntityId, AccountEntityId, CustomerID, CustomerName, SystemACID, CustomerACID, WOEntityID, RestructureEntityID, GLAlt_Key, ProductAlt_Key, GLProductAlt_Key, FacilityType, SectorAlt_Key, SubSectorAlt_Key, ActivityAlt_Key, SchemeAlt_Key, AssetClassAlt_Key, NPADt, WO_PWO, WriteOffDt, WriteOffAmt, SettlementAmt, SettlementDt, RecompenseAmt, RecompenseDt, SacrificeAmt, IntSacrifice, FITLSacrifice, OthSacrifice, FITLAccountRefNo, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, D2Ktimestamp )
     SELECT b.BranchCode BranchCode  ,
            b.CustomerEntityId CustomerEntityId  ,
            b.AccountEntityId AccountEntityId  ,
            RefCustomerId CustomerID  ,
            NULL CustomerName  ,
            b.CustomerACID SystemACID  ,
            b.CustomerACID CustomerACID  ,
            v_WOEntityIDEntityId + ROW_NUMBER() OVER ( ORDER BY A.CustomerACID  ) WOEntityID  ,
            0 RestructureEntityID  ,
            b.GLAlt_Key GLAlt_Key  ,
            b.ProductAlt_Key ProductAlt_Key  ,
            b.GLProductAlt_Key GLProductAlt_Key  ,
            'TL' FacilityType  ,
            b.SectorAlt_Key SectorAlt_Key  ,
            b.SubSectorAlt_Key SubSectorAlt_Key  ,
            b.ActivityAlt_Key ActivityAlt_Key  ,
            b.SchemeAlt_Key SchemeAlt_Key  ,
            0 AssetClassAlt_Key  ,
            NULL NPADt  ,
            'T' WO_PWO  ,
            v_ProcessingDate WriteOffDt  ,
            A.AmountofWriteOff WriteOffAmt  ,
            NULL SettlementAmt  ,
            NULL SettlementDt  ,
            NULL RecompenseAmt  ,
            NULL RecompenseDt  ,
            NULL SacrificeAmt  ,
            NULL IntSacrifice  ,
            NULL FITLSacrifice  ,
            NULL OthSacrifice  ,
            NULL FITLAccountRefNo  ,
            NULL AuthorisationStatus  ,
            v_TIMEKEY EffectiveFromTimeKey  ,
            49999 EffectiveToTimeKey  ,
            'SSISUSER' CreatedBy  ,
            SYSDATE DateCreated  ,
            NULL ModifiedBy  ,
            NULL DateModified  ,
            NULL ApprovedBy  ,
            NULL DateApproved  ,
            NULL D2Ktimestamp  
       FROM tt_AdvAcWODetail A
              JOIN CurDat_RBL_MISDB_PROD.AdvAcBasicDetail B   ON A.CustomerACID = B.CustomerACID
      WHERE  B.EffectiveFromTimeKey <= v_TIMEKEY
               AND B.EffectiveToTimeKey >= v_TIMEKEY;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.CustomerName
   FROM A ,CurDat_RBL_MISDB_PROD.AdvAcWODetail A
          JOIN CustomerBasicDetail B   ON A.CustomerID = B.CustomerId 
    WHERE A.CustomerName IS NULL) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.CustomerName = src.CustomerName;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.Cust_AssetClassAlt_Key, B.NPADt
   FROM A ,CurDat_RBL_MISDB_PROD.AdvAcWODetail A
          JOIN CurDat_RBL_MISDB_PROD.AdvCustNpaDetail B   ON A.CustomerID = B.RefCustomerID 
    WHERE A.AssetClassAlt_Key = 0
     AND B.EffectiveFromTimeKey <= v_TIMEKEY
     AND B.EffectiveToTimeKey >= v_TIMEKEY) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET B.AssetClassAlt_Key = src.Cust_AssetClassAlt_Key,
                                A.NPADt = src.NPADt;
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET FinalNpaDt = InitialNpaDt
    WHERE  FinalAssetClassAlt_Key > 1
     AND FinalNpaDt IS NULL;
   UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
      SET SysNPA_Dt = SrcNPA_Dt
    WHERE  SysAssetClassAlt_Key > 1
     AND SysNPA_Dt IS NULL;
   EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CustMocData_4 ';

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_MOC_BKUP16072021" TO "ADF_CDR_RBL_STGDB";
