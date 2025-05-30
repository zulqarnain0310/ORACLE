--------------------------------------------------------
--  DDL for Procedure INSERTDATAINTOHIST_TABLE_OPT_21082024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" 
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         ----------------------Global table to Main Table insert (MANDEEP 11092023)------------------------------------------------------
         v_SETID NUMBER(10,0) := ( SELECT NVL(MAX(NVL(SETID, 0)) , 0) + 1 
           FROM PRO_RBL_MISDB_PROD.ProcessMonitor 
          WHERE  TIMEKEY = v_TIMEKEY );

      BEGIN
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'Global table to Main Table' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.CUSTOMERCAL ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.ACCOUNTCAL ';
         /*TODO:SQLDEV*/ SET IDENTITY_INSERT PRO.CUSTOMERCAL ON /*END:SQLDEV*/
         INSERT INTO PRO_RBL_MISDB_PROD.CUSTOMERCAL
           ( EntityKey, BranchCode, UCIF_ID, UcifEntityID, CustomerEntityID, ParentCustomerID, RefCustomerID, SourceSystemCustomerID, CustomerName, CustSegmentCode, ConstitutionAlt_Key, PANNO, AadharCardNO, SrcAssetClassAlt_Key, SysAssetClassAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SMA_Class_Key, PNPA_Class_Key, PrvQtrRV, CurntQtrRv, TotProvision, RBITotProvision, BankTotProvision, SrcNPA_Dt, SysNPA_Dt, DbtDt, DbtDt2, DbtDt3, LossDt, MOC_Dt, ErosionDt, SMA_Dt, PNPA_Dt, Asset_Norm, FlgDeg, FlgUpg, FlgMoc, FlgSMA, FlgProcessing, FlgErosion, FlgPNPA, FlgPercolation, FlgInMonth, FlgDirtyRow, DegDate, EffectiveFromTimeKey, EffectiveToTimeKey, CommonMocTypeAlt_Key, InMonthMark, MocStatusMark, SourceAlt_Key, BankAssetClass, Cust_Expo, MOCReason, AddlProvisionPer, FraudDt, FraudAmount, DegReason, CustMoveDescription, TotOsCust, MOCTYPE, IsChanged, EntityKeyNew )
           ( SELECT EntityKey ,
                    BranchCode ,
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
                    MOCTYPE ,
                    IsChanged ,
                    EntityKeyNew 
             FROM tt_CUSTOMERCAL_19  );
         /*TODO:SQLDEV*/ SET IDENTITY_INSERT PRO.CUSTOMERCAL OFF /*END:SQLDEV*/
         /*TODO:SQLDEV*/ SET IDENTITY_INSERT PRO.ACCOUNTCAL ON /*END:SQLDEV*/
         INSERT INTO PRO_RBL_MISDB_PROD.ACCOUNTCAL
           ( EntityKey, AccountEntityID, UcifEntityID, CustomerEntityID, CustomerAcID, RefCustomerID, SourceSystemCustomerID, UCIF_ID, BranchCode, FacilityType, AcOpenDt, FirstDtOfDisb, ProductAlt_Key, SchemeAlt_key, SubSectorAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SourceAlt_Key, ActSegmentCode, InttRate, Balance, BalanceInCrncy, CurrencyAlt_Key, DrawingPower, CurrentLimit, CurrentLimitDt, ContiExcessDt, StockStDt, DebitSinceDt, LastCrDate, PreQtrCredit, PrvQtrInt, CurQtrCredit, CurQtrInt, InttServiced, IntNotServicedDt, OverdueAmt, OverDueSinceDt, ReviewDueDt, SecurityValue, DFVAmt, GovtGtyAmt, CoverGovGur, WriteOffAmount, UnAdjSubSidy, CreditsinceDt, DegReason, Asset_Norm, REFPeriodMax, RefPeriodOverdue, RefPeriodOverDrawn, RefPeriodNoCredit, RefPeriodIntService, RefPeriodStkStatement, RefPeriodReview, NetBalance, ApprRV, SecuredAmt, UnSecuredAmt, ProvDFV, Provsecured, ProvUnsecured, ProvCoverGovGur, AddlProvision, TotalProvision, BankProvsecured, BankProvUnsecured, BankTotalProvision, RBIProvsecured, RBIProvUnsecured, RBITotalProvision, InitialNpaDt, FinalNpaDt, SMA_Dt, UpgDate, InitialAssetClassAlt_Key, FinalAssetClassAlt_Key, ProvisionAlt_Key, PNPA_Reason, SMA_Class, SMA_Reason, FlgMoc, MOC_Dt, CommonMocTypeAlt_Key, FlgDeg, FlgDirtyRow, FlgInMonth, FlgSMA, FlgPNPA, FlgUpg, FlgFITL, FlgAbinitio, NPA_Days, RefPeriodOverdueUPG, RefPeriodOverDrawnUPG, RefPeriodNoCreditUPG, RefPeriodIntServiceUPG, RefPeriodStkStatementUPG, RefPeriodReviewUPG, EffectiveFromTimeKey, EffectiveToTimeKey, AppGovGur, UsedRV, ComputedClaim, UPG_RELAX_MSME, DEG_RELAX_MSME, PNPA_DATE, NPA_Reason, PnpaAssetClassAlt_key, DisbAmount, PrincOutStd, PrincOverdue, PrincOverdueSinceDt, IntOverdue, IntOverdueSinceDt, OtherOverdue, OtherOverdueSinceDt, RelationshipNumber, AccountFlag, CommercialFlag_AltKey, Liability, CD, AccountStatus, AccountBlkCode1, AccountBlkCode2, ExposureType, Mtm_Value, BankAssetClass, NpaType, SecApp, BorrowerTypeID, LineCode, ProvPerSecured, ProvPerUnSecured, MOCReason, AddlProvisionPer, FlgINFRA, RepossessionDate, DerecognisedInterest1, DerecognisedInterest2, ProductCode, FlgLCBG, UnserviedInt, OriginalBranchcode, AdvanceRecovery, NotionalInttAmt, PrvAssetClassAlt_Key, MOCTYPE, FlgSecured, DPD_IntService, DPD_NoCredit, DPD_Overdrawn, DPD_Overdue, DPD_Renewal, DPD_StockStmt, DPD_Max, DPD_FinMaxType, DPD_SMA, DPD_PrincOverdue, DPD_IntOverdueSince, DPD_OtherOverdueSince, RePossession, RCPending, PaymentPending, WheelCase, CustomerLevelMaxPer, FinalProvisionPer, IsIBPC, IsSecuritised, RFA, IsNonCooperative, Sarfaesi, WeakAccount, PUI, FlgFraud, FlgRestructure, RestructureDate, WeakAccountDate, SarfaesiDate, FlgUnusualBounce, UnusualBounceDate, FlgUnClearedEffect, UnClearedEffectDate, FraudDate, IsChanged, EntityKeyNew )
           ( SELECT EntityKey ,
                    AccountEntityID ,
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
                    PreQtrCredit ,
                    PrvQtrInt ,
                    CurQtrCredit ,
                    CurQtrInt ,
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
                    IntOverdue ,
                    IntOverdueSinceDt ,
                    OtherOverdue ,
                    OtherOverdueSinceDt ,
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
                    OriginalBranchcode ,
                    AdvanceRecovery ,
                    NotionalInttAmt ,
                    PrvAssetClassAlt_Key ,
                    MOCTYPE ,
                    FlgSecured ,
                    DPD_IntService ,
                    DPD_NoCredit ,
                    DPD_Overdrawn ,
                    DPD_Overdue ,
                    DPD_Renewal ,
                    DPD_StockStmt ,
                    DPD_Max ,
                    DPD_FinMaxType ,
                    DPD_SMA ,
                    DPD_PrincOverdue ,
                    DPD_IntOverdueSince ,
                    DPD_OtherOverdueSince ,
                    RePossession ,
                    RCPending ,
                    PaymentPending ,
                    WheelCase ,
                    CustomerLevelMaxPer ,
                    FinalProvisionPer ,
                    IsIBPC ,
                    IsSecuritised ,
                    RFA ,
                    IsNonCooperative ,
                    Sarfaesi ,
                    WeakAccount ,
                    PUI ,
                    FlgFraud ,
                    FlgRestructure ,
                    RestructureDate ,
                    WeakAccountDate ,
                    SarfaesiDate ,
                    FlgUnusualBounce ,
                    UnusualBounceDate ,
                    FlgUnClearedEffect ,
                    UnClearedEffectDate ,
                    FraudDate ,
                    IsChanged ,
                    EntityKeyNew 
             FROM tt_ACCOUNTCAL_24  );
         /*TODO:SQLDEV*/ SET IDENTITY_INSERT PRO.ACCOUNTCAL OFF /*END:SQLDEV*/
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'Global table to Main Table';
         -------------------------------------------------END-------------------------------------------------------------------------------
         ------------------------------------------------
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'InsertDataIntoHistTable' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         DECLARE
            v_temp NUMBER(1, 0) := 0;
            v_VEFFECTIVETO NUMBER(10,0) := v_TIMEKEY - 1;
            /*  New Customers Ac Key ID Update  */
            v_EntityKeyCust NUMBER(19,0) := 0;
            /*  New Customers Ac Key ID Update  */
            v_EntityKeyAc NUMBER(19,0) := 0;
            /* RESTRUCTURE DETAIL	*/
            TABLE IF  --SQLDEV: NOT RECOGNIZED
            IF tt_AdvAcRestructureDetail_15  --SQLDEV: NOT RECOGNIZED
            v_Procdate VARCHAR2(200) := ( SELECT DATE_ 
              FROM SysDayMatrix 
             WHERE  TIMEKEY = v_TIMEKEY );
            v_PrevTimeKey NUMBER(10,0) := ( SELECT MAX(EffectiveFromTimeKey)  
              FROM PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist 
             WHERE  EffectiveFromTimeKey < v_TIMEKEY );
         -----------------------------------------------------------------------

         BEGIN
            BEGIN
               SELECT 1 INTO v_temp
                 FROM DUAL
                WHERE EXISTS ( SELECT 1 
                               FROM PRO_RBL_MISDB_PROD.AccountCal_Hist 
                                WHERE  EffectiveFromTimeKey > v_TIMEKEY );
            EXCEPTION
               WHEN OTHERS THEN
                  NULL;
            END;

            IF v_temp = 1 THEN

            BEGIN
               utils.raiserror( 0, 'Data processed for wrong date, Please check....' );

            END;
            END IF;
            /* CUSTOMER CAL HIST MERGE */
            MERGE INTO T 
            USING (SELECT T.ROWID row_id, 'E'
            FROM T ,PRO_RBL_MISDB_PROD.CustomerCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL T   ON O.CustomerEntityId = T.CustomerEntityID
                   AND O.EffectiveToTimeKey = 49999 ) src
            ON ( T.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET T.IsChanged = 'E';
            MERGE INTO T 
            USING (SELECT T.ROWID row_id, 'C'
            FROM T ,PRO_RBL_MISDB_PROD.CustomerCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL T   ON O.CustomerEntityId = T.CustomerEntityID
                   AND O.EffectiveToTimeKey = 49999 
             WHERE ( NVL(O.BranchCode, ' ') <> NVL(T.BranchCode, ' ')
              OR NVL(O.UCIF_ID, ' ') <> NVL(T.UCIF_ID, ' ')
              OR NVL(O.UcifEntityID, 0) <> NVL(T.UcifEntityID, 0)
              OR NVL(O.CustomerEntityID, 0) <> NVL(T.CustomerEntityID, 0)
              OR NVL(O.ParentCustomerID, ' ') <> NVL(T.ParentCustomerID, ' ')
              OR NVL(O.RefCustomerID, ' ') <> NVL(T.RefCustomerID, ' ')
              OR NVL(O.SourceSystemCustomerID, ' ') <> NVL(T.SourceSystemCustomerID, ' ')
              OR NVL(O.CustomerName, ' ') <> NVL(T.CustomerName, ' ')
              OR NVL(O.CustSegmentCode, ' ') <> NVL(T.CustSegmentCode, ' ')
              OR NVL(O.ConstitutionAlt_Key, 0) <> NVL(T.ConstitutionAlt_Key, 0)
              OR NVL(O.PANNO, ' ') <> NVL(T.PANNO, ' ')
              OR NVL(O.AadharCardNO, ' ') <> NVL(T.AadharCardNO, ' ')
              OR NVL(O.SrcAssetClassAlt_Key, 0) <> NVL(T.SrcAssetClassAlt_Key, 0)
              OR NVL(O.SysAssetClassAlt_Key, 0) <> NVL(T.SysAssetClassAlt_Key, 0)
              OR NVL(O.SplCatg1Alt_Key, 0) <> NVL(T.SplCatg1Alt_Key, 0)
              OR NVL(O.SplCatg2Alt_Key, 0) <> NVL(T.SplCatg2Alt_Key, 0)
              OR NVL(O.SplCatg3Alt_Key, 0) <> NVL(T.SplCatg3Alt_Key, 0)
              OR NVL(O.SplCatg4Alt_Key, 0) <> NVL(T.SplCatg4Alt_Key, 0)
              OR NVL(O.SMA_Class_Key, 0) <> NVL(T.SMA_Class_Key, 0)
              OR NVL(O.PNPA_Class_Key, 0) <> NVL(T.PNPA_Class_Key, 0)
              OR NVL(O.PrvQtrRV, 0) <> NVL(T.PrvQtrRV, 0)
              OR NVL(O.CurntQtrRv, 0) <> NVL(T.CurntQtrRv, 0)
              OR NVL(O.TotProvision, 0) <> NVL(T.TotProvision, 0)
              OR NVL(O.BankTotProvision, 0) <> NVL(T.BankTotProvision, 0)
              OR NVL(O.RBITotProvision, 0) <> NVL(T.RBITotProvision, 0)
              OR NVL(O.SrcNPA_Dt, '1900-01-01') <> NVL(T.SrcNPA_Dt, '1900-01-01')
              OR NVL(O.SysNPA_Dt, '1900-01-01') <> NVL(T.SysNPA_Dt, '1900-01-01')
              OR NVL(O.DbtDt, '1900-01-01') <> NVL(T.DbtDt, '1900-01-01')
              OR NVL(O.DbtDt2, '1900-01-01') <> NVL(T.DbtDt2, '1900-01-01')
              OR NVL(O.DbtDt3, '1900-01-01') <> NVL(T.DbtDt3, '1900-01-01')
              OR NVL(O.LossDt, '1900-01-01') <> NVL(T.LossDt, '1900-01-01')
              OR NVL(O.MOC_Dt, '1900-01-01') <> NVL(T.MOC_Dt, '1900-01-01')
              OR NVL(O.ErosionDt, '1900-01-01') <> NVL(T.ErosionDt, '1900-01-01')
              OR NVL(O.SMA_Dt, '1900-01-01') <> NVL(T.SMA_Dt, '1900-01-01')
              OR NVL(O.PNPA_Dt, '1900-01-01') <> NVL(T.PNPA_Dt, '1900-01-01')
              OR NVL(O.Asset_Norm, ' ') <> NVL(T.Asset_Norm, ' ')
              OR NVL(O.FlgDeg, ' ') <> NVL(T.FlgDeg, ' ')
              OR NVL(O.FlgUpg, ' ') <> NVL(T.FlgUpg, ' ')
              OR NVL(O.FlgMoc, ' ') <> NVL(T.FlgMoc, ' ')
              OR NVL(O.FlgSMA, ' ') <> NVL(T.FlgSMA, ' ')
              OR NVL(O.FlgProcessing, ' ') <> NVL(T.FlgProcessing, ' ')
              OR NVL(O.FlgErosion, ' ') <> NVL(T.FlgErosion, ' ')
              OR NVL(O.FlgPNPA, ' ') <> NVL(T.FlgPNPA, ' ')
              OR NVL(O.FlgPercolation, ' ') <> NVL(T.FlgPercolation, ' ')
              OR NVL(O.FlgInMonth, ' ') <> NVL(T.FlgInMonth, ' ')
              OR NVL(O.FlgDirtyRow, ' ') <> NVL(T.FlgDirtyRow, ' ')
              OR NVL(O.DegDate, '1900-01-01') <> NVL(T.DegDate, '1900-01-01')
              OR NVL(O.CommonMocTypeAlt_Key, 0) <> NVL(T.CommonMocTypeAlt_Key, 0)
              OR NVL(O.InMonthMark, ' ') <> NVL(T.InMonthMark, ' ')
              OR NVL(O.MocStatusMark, ' ') <> NVL(T.MocStatusMark, ' ')
              OR NVL(O.SourceAlt_Key, 0) <> NVL(T.SourceAlt_Key, 0)
              OR NVL(O.BankAssetClass, ' ') <> NVL(T.BankAssetClass, ' ')
              OR NVL(O.Cust_Expo, 0) <> NVL(T.Cust_Expo, 0)
              OR NVL(O.MOCReason, ' ') <> NVL(T.MOCReason, ' ')
              OR NVL(O.AddlProvisionPer, 0) <> NVL(T.AddlProvisionPer, 0)
              OR NVL(O.FraudDt, '1900-01-01') <> NVL(T.FraudDt, '1900-01-01')
              OR NVL(O.FraudAmount, 0) <> NVL(T.FraudAmount, 0)
              OR NVL(O.DegReason, ' ') <> NVL(T.DegReason, ' ')
              OR NVL(O.CustMoveDescription, ' ') <> NVL(T.CustMoveDescription, ' ')
              OR NVL(O.TotOsCust, 0) <> NVL(T.TotOsCust, 0)
              OR NVL(O.MOCTYPE, ' ') <> NVL(T.MOCTYPE, ' ') )) src
            ON ( T.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET T.IsChanged = 'C';
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, 'U'
            FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                   JOIN PRO_RBL_MISDB_PROD.CustomerCal_Hist B   ON B.CustomerEntityId = A.CustomerEntityID 
             WHERE B.EffectiveFromTimeKey = v_TimeKey
              AND A.IsChanged = 'C') src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.IsChanged = 'U';
            ----------For Changes Records
            MERGE INTO b 
            USING (SELECT b.ROWID row_id, v_VEFFECTIVETO
            FROM b ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                   JOIN PRO_RBL_MISDB_PROD.CustomerCal_Hist B   ON B.CustomerEntityId = A.CustomerEntityID
                   AND B.EffectiveToTimeKey = 49999 
             WHERE B.EffectiveFromTimeKey < v_TimeKey
              AND A.IsChanged = 'C') src
            ON ( b.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET b.EffectiveToTimeKey = v_VEFFECTIVETO;
            MERGE INTO O 
            USING (SELECT O.ROWID row_id, T.BranchCode, T.UCIF_ID, T.UcifEntityID, T.ParentCustomerID, T.RefCustomerID, T.SourceSystemCustomerID, T.CustomerName, T.CustSegmentCode, T.ConstitutionAlt_Key, T.PANNO, T.AadharCardNO, T.SrcAssetClassAlt_Key, T.SysAssetClassAlt_Key, T.SplCatg1Alt_Key, T.SplCatg2Alt_Key, T.SplCatg3Alt_Key, T.SplCatg4Alt_Key, T.SMA_Class_Key, T.PNPA_Class_Key, T.PrvQtrRV, T.CurntQtrRv, T.TotProvision, T.BankTotProvision, T.RBITotProvision, T.SrcNPA_Dt, T.SysNPA_Dt, T.DbtDt, T.DbtDt2, T.DbtDt3, T.LossDt, T.MOC_Dt, T.ErosionDt, T.SMA_Dt, T.PNPA_Dt, T.Asset_Norm, T.FlgDeg, T.FlgUpg, T.FlgMoc, T.FlgSMA, T.FlgProcessing, T.FlgErosion, T.FlgPNPA, T.FlgPercolation, T.FlgInMonth, T.FlgDirtyRow, T.DegDate, T.CommonMocTypeAlt_Key, T.InMonthMark, T.MocStatusMark, T.SourceAlt_Key, T.BankAssetClass, T.Cust_Expo, T.MOCReason, T.AddlProvisionPer, T.FraudDt, T.FraudAmount, T.DegReason, T.CustMoveDescription, T.TotOsCust, T.MOCTYPE
            FROM O ,PRO_RBL_MISDB_PROD.CustomerCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL T   ON O.CustomerEntityId = T.CustomerEntityID 
             WHERE O.EffectiveFromTimeKey = v_TimeKey
              AND T.IsChanged = 'U') src
            ON ( O.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET BranchCode = src.BranchCode,
                                         UCIF_ID = src.UCIF_ID,
                                         UcifEntityID = src.UcifEntityID,
                                         ParentCustomerID = src.ParentCustomerID,
                                         RefCustomerID = src.RefCustomerID,
                                         SourceSystemCustomerID = src.SourceSystemCustomerID,
                                         CustomerName = src.CustomerName,
                                         CustSegmentCode = src.CustSegmentCode,
                                         ConstitutionAlt_Key = src.ConstitutionAlt_Key,
                                         PANNO = src.PANNO,
                                         AadharCardNO = src.AadharCardNO,
                                         SrcAssetClassAlt_Key = src.SrcAssetClassAlt_Key,
                                         SysAssetClassAlt_Key = src.SysAssetClassAlt_Key,
                                         SplCatg1Alt_Key = src.SplCatg1Alt_Key,
                                         SplCatg2Alt_Key = src.SplCatg2Alt_Key,
                                         SplCatg3Alt_Key = src.SplCatg3Alt_Key,
                                         SplCatg4Alt_Key = src.SplCatg4Alt_Key,
                                         SMA_Class_Key = src.SMA_Class_Key,
                                         PNPA_Class_Key = src.PNPA_Class_Key,
                                         PrvQtrRV = src.PrvQtrRV,
                                         CurntQtrRv = src.CurntQtrRv,
                                         TotProvision = src.TotProvision,
                                         BankTotProvision = src.BankTotProvision,
                                         RBITotProvision = src.RBITotProvision,
                                         SrcNPA_Dt = src.SrcNPA_Dt,
                                         SysNPA_Dt = src.SysNPA_Dt,
                                         DbtDt = src.DbtDt,
                                         DbtDt2 = src.DbtDt2,
                                         DbtDt3 = src.DbtDt3,
                                         LossDt = src.LossDt,
                                         MOC_Dt = src.MOC_Dt,
                                         ErosionDt = src.ErosionDt,
                                         SMA_Dt = src.SMA_Dt,
                                         PNPA_Dt = src.PNPA_Dt,
                                         Asset_Norm = src.Asset_Norm,
                                         FlgDeg = src.FlgDeg,
                                         FlgUpg = src.FlgUpg,
                                         FlgMoc = src.FlgMoc,
                                         FlgSMA = src.FlgSMA,
                                         FlgProcessing = src.FlgProcessing,
                                         FlgErosion = src.FlgErosion,
                                         FlgPNPA = src.FlgPNPA,
                                         FlgPercolation = src.FlgPercolation,
                                         FlgInMonth = src.FlgInMonth,
                                         FlgDirtyRow = src.FlgDirtyRow,
                                         DegDate = src.DegDate,
                                         CommonMocTypeAlt_Key = src.CommonMocTypeAlt_Key,
                                         InMonthMark = src.InMonthMark,
                                         MocStatusMark = src.MocStatusMark,
                                         SourceAlt_Key = src.SourceAlt_Key,
                                         BankAssetClass = src.BankAssetClass,
                                         Cust_Expo = src.Cust_Expo,
                                         MOCReason = src.MOCReason,
                                         AddlProvisionPer = src.AddlProvisionPer,
                                         FraudDt = src.FraudDt,
                                         FraudAmount = src.FraudAmount,
                                         DegReason = src.DegReason,
                                         CustMoveDescription = src.CustMoveDescription,
                                         TotOsCust = src.TotOsCust,
                                         MOCTYPE = src.MOCTYPE;
            ----------------------------------------------------------------------------------------------------------------------------------------------
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_VEFFECTIVETO
            FROM AA ,PRO_RBL_MISDB_PROD.CustomerCal_Hist AA 
             WHERE AA.EffectiveToTimeKey = 49999
              AND NOT EXISTS ( SELECT 1 
                               FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL BB
                                WHERE  AA.CustomerEntityId = BB.CustomerEntityId )) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_VEFFECTIVETO;
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
            FROM TEMP ,PRO_RBL_MISDB_PROD.CUSTOMERCAL TEMP
                   JOIN ( SELECT CUSTOMERCAL.CustomerEntityId ,
                                 (v_EntityKeyCust + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                                     FROM DUAL  )  )) EntityKeyNew  
                          FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL 
                           WHERE  CUSTOMERCAL.IsChanged IN ( 'C','N' )
                         ) ACCT   ON TEMP.CustomerEntityID = ACCT.CustomerEntityId 
             WHERE Temp.IsChanged IN ( 'C','N' )
            ) src
            ON ( TEMP.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET TEMP.EntityKeyNew = src.EntityKeyNew;
            /***************************************************************************************************************/
            INSERT INTO PRO_RBL_MISDB_PROD.CustomerCal_Hist
              ( EntityKey, BranchCode, UCIF_ID, UcifEntityID, CustomerEntityID, ParentCustomerID, RefCustomerID, SourceSystemCustomerID, CustomerName, CustSegmentCode, ConstitutionAlt_Key, PANNO, AadharCardNO, SrcAssetClassAlt_Key, SysAssetClassAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SMA_Class_Key, PNPA_Class_Key, PrvQtrRV, CurntQtrRv, TotProvision, BankTotProvision, RBITotProvision, SrcNPA_Dt, SysNPA_Dt, DbtDt, DbtDt2, DbtDt3, LossDt, MOC_Dt, ErosionDt, SMA_Dt, PNPA_Dt, Asset_Norm, FlgDeg, FlgUpg, FlgMoc, FlgSMA, FlgProcessing, FlgErosion, FlgPNPA, FlgPercolation, FlgInMonth, FlgDirtyRow, DegDate, EffectiveFromTimeKey, EffectiveToTimeKey, CommonMocTypeAlt_Key, InMonthMark, MocStatusMark, SourceAlt_Key, BankAssetClass, Cust_Expo, MOCReason, AddlProvisionPer, FraudDt, FraudAmount, DegReason, CustMoveDescription, TotOsCust, MOCTYPE, ScreenFlag, ChangeFld )
              ( SELECT EntityKeyNew ,
                       BranchCode ,
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
                       BankTotProvision ,
                       RBITotProvision ,
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
                       49999 EffectiveToTimeKey  ,
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
                       MOCTYPE ,
                       NULL ScreenFlag  ,
                       NULL ChangeFld  
                FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL T
                 WHERE  NVL(T.IsChanged, 'N') IN ( 'C','N' )
               );
            /* ACCOUNT CAL HIST MERGE */
            MERGE INTO T 
            USING (SELECT T.ROWID row_id, 'E'
            FROM T ,PRO_RBL_MISDB_PROD.AccountCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL T   ON O.AccountEntityID = T.AccountEntityID
                   AND O.EffectiveToTimeKey = 49999 ) src
            ON ( T.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET T.IsChanged = 'E';
            MERGE INTO T 
            USING (SELECT T.ROWID row_id, 'C'
            FROM T ,PRO_RBL_MISDB_PROD.AccountCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL T   ON O.AccountEntityID = T.AccountEntityID
                   AND O.EffectiveToTimeKey = 49999 
             WHERE ( NVL(O.UcifEntityID, 0) <> NVL(T.UcifEntityID, 0)
              OR NVL(O.CustomerEntityID, 0) <> NVL(T.CustomerEntityID, 0)
              OR NVL(O.CustomerAcID, ' ') <> NVL(T.CustomerAcID, ' ')
              OR NVL(O.RefCustomerID, ' ') <> NVL(T.RefCustomerID, ' ')
              OR NVL(O.SourceSystemCustomerID, ' ') <> NVL(T.SourceSystemCustomerID, ' ')
              OR NVL(O.UCIF_ID, ' ') <> NVL(T.UCIF_ID, ' ')
              OR NVL(O.BranchCode, ' ') <> NVL(T.BranchCode, ' ')
              OR NVL(O.FacilityType, ' ') <> NVL(T.FacilityType, ' ')
              OR NVL(O.AcOpenDt, '1900-01-01') <> NVL(T.AcOpenDt, '1900-01-01')
              OR NVL(O.FirstDtOfDisb, '1900-01-01') <> NVL(T.FirstDtOfDisb, '1900-01-01')
              OR NVL(O.ProductAlt_Key, 0) <> NVL(T.ProductAlt_Key, 0)
              OR NVL(O.SchemeAlt_key, 0) <> NVL(T.SchemeAlt_key, 0)
              OR NVL(O.SubSectorAlt_Key, 0) <> NVL(T.SubSectorAlt_Key, 0)
              OR NVL(O.SplCatg1Alt_Key, 0) <> NVL(T.SplCatg1Alt_Key, 0)
              OR NVL(O.SplCatg2Alt_Key, 0) <> NVL(T.SplCatg2Alt_Key, 0)
              OR NVL(O.SplCatg3Alt_Key, 0) <> NVL(T.SplCatg3Alt_Key, 0)
              OR NVL(O.SplCatg4Alt_Key, 0) <> NVL(T.SplCatg4Alt_Key, 0)
              OR NVL(O.SourceAlt_Key, 0) <> NVL(T.SourceAlt_Key, 0)
              OR NVL(O.ActSegmentCode, ' ') <> NVL(T.ActSegmentCode, ' ')
              OR NVL(O.InttRate, 0) <> NVL(T.InttRate, 0)
              OR NVL(O.Balance, 0) <> NVL(T.Balance, 0)
              OR NVL(O.BalanceInCrncy, 0) <> NVL(T.BalanceInCrncy, 0)
              OR NVL(O.CurrencyAlt_Key, 0) <> NVL(T.CurrencyAlt_Key, 0)
              OR NVL(O.DrawingPower, 0) <> NVL(T.DrawingPower, 0)
              OR NVL(O.CurrentLimit, 0) <> NVL(T.CurrentLimit, 0)
              OR NVL(O.CurrentLimitDt, '1900-01-01') <> NVL(T.CurrentLimitDt, '1900-01-01')
              OR NVL(O.ContiExcessDt, '1900-01-01') <> NVL(T.ContiExcessDt, '1900-01-01')
              OR NVL(O.StockStDt, '1900-01-01') <> NVL(T.StockStDt, '1900-01-01')
              OR NVL(O.DebitSinceDt, '1900-01-01') <> NVL(T.DebitSinceDt, '1900-01-01')
              OR NVL(O.LastCrDate, '1900-01-01') <> NVL(T.LastCrDate, '1900-01-01')
              OR NVL(O.InttServiced, ' ') <> NVL(T.InttServiced, ' ')
              OR NVL(O.IntNotServicedDt, '1900-01-01') <> NVL(T.IntNotServicedDt, '1900-01-01')
              OR NVL(O.OverdueAmt, 0) <> NVL(T.OverdueAmt, 0)
              OR NVL(O.OverDueSinceDt, '1900-01-01') <> NVL(T.OverDueSinceDt, '1900-01-01')
              OR NVL(O.ReviewDueDt, '1900-01-01') <> NVL(T.ReviewDueDt, '1900-01-01')
              OR NVL(O.SecurityValue, 0) <> NVL(T.SecurityValue, 0)
              OR NVL(O.DFVAmt, 0) <> NVL(T.DFVAmt, 0)
              OR NVL(O.GovtGtyAmt, 0) <> NVL(T.GovtGtyAmt, 0)
              OR NVL(O.CoverGovGur, 0) <> NVL(T.CoverGovGur, 0)
              OR NVL(O.WriteOffAmount, 0) <> NVL(T.WriteOffAmount, 0)
              OR NVL(O.UnAdjSubSidy, 0) <> NVL(T.UnAdjSubSidy, 0)
              OR NVL(O.CreditsinceDt, '1900-01-01') <> NVL(T.CreditsinceDt, '1900-01-01')
              OR NVL(O.DegReason, ' ') <> NVL(T.DegReason, ' ')
              OR NVL(O.Asset_Norm, ' ') <> NVL(T.Asset_Norm, ' ')
              OR NVL(O.REFPeriodMax, 0) <> NVL(T.REFPeriodMax, 0)
              OR NVL(O.RefPeriodOverdue, 0) <> NVL(T.RefPeriodOverdue, 0)
              OR NVL(O.RefPeriodOverDrawn, 0) <> NVL(T.RefPeriodOverDrawn, 0)
              OR NVL(O.RefPeriodNoCredit, 0) <> NVL(T.RefPeriodNoCredit, 0)
              OR NVL(O.RefPeriodIntService, 0) <> NVL(T.RefPeriodIntService, 0)
              OR NVL(O.RefPeriodStkStatement, 0) <> NVL(T.RefPeriodStkStatement, 0)
              OR NVL(O.RefPeriodReview, 0) <> NVL(T.RefPeriodReview, 0)
              OR NVL(O.NetBalance, 0) <> NVL(T.NetBalance, 0)
              OR NVL(O.ApprRV, 0) <> NVL(T.ApprRV, 0)
              OR NVL(O.SecuredAmt, 0) <> NVL(T.SecuredAmt, 0)
              OR NVL(O.UnSecuredAmt, 0) <> NVL(T.UnSecuredAmt, 0)
              OR NVL(O.ProvDFV, 0) <> NVL(T.ProvDFV, 0)
              OR NVL(O.Provsecured, 0) <> NVL(T.Provsecured, 0)
              OR NVL(O.ProvUnsecured, 0) <> NVL(T.ProvUnsecured, 0)
              OR NVL(O.ProvCoverGovGur, 0) <> NVL(T.ProvCoverGovGur, 0)
              OR NVL(O.AddlProvision, 0) <> NVL(T.AddlProvision, 0)
              OR NVL(O.TotalProvision, 0) <> NVL(T.TotalProvision, 0)
              OR NVL(O.BankProvsecured, 0) <> NVL(T.BankProvsecured, 0)
              OR NVL(O.BankProvUnsecured, 0) <> NVL(T.BankProvUnsecured, 0)
              OR NVL(O.BankTotalProvision, 0) <> NVL(T.BankTotalProvision, 0)
              OR NVL(O.RBIProvsecured, 0) <> NVL(T.RBIProvsecured, 0)
              OR NVL(O.RBIProvUnsecured, 0) <> NVL(T.RBIProvUnsecured, 0)
              OR NVL(O.RBITotalProvision, 0) <> NVL(T.RBITotalProvision, 0)
              OR NVL(O.InitialNpaDt, '1900-01-01') <> NVL(T.InitialNpaDt, '1900-01-01')
              OR NVL(O.FinalNpaDt, '1900-01-01') <> NVL(T.FinalNpaDt, '1900-01-01')
              OR NVL(O.SMA_Dt, '1900-01-01') <> NVL(T.SMA_Dt, '1900-01-01')
              OR NVL(O.UpgDate, '1900-01-01') <> NVL(T.UpgDate, '1900-01-01')
              OR NVL(O.InitialAssetClassAlt_Key, 0) <> NVL(T.InitialAssetClassAlt_Key, 0)
              OR NVL(O.FinalAssetClassAlt_Key, 0) <> NVL(T.FinalAssetClassAlt_Key, 0)
              OR NVL(O.ProvisionAlt_Key, 0) <> NVL(T.ProvisionAlt_Key, 0)
              OR NVL(O.PNPA_Reason, ' ') <> NVL(T.PNPA_Reason, ' ')
              OR NVL(O.SMA_Class, ' ') <> NVL(T.SMA_Class, ' ')
              OR NVL(O.SMA_Reason, ' ') <> NVL(T.SMA_Reason, ' ')
              OR NVL(O.FlgMoc, ' ') <> NVL(T.FlgMoc, ' ')
              OR NVL(O.MOC_Dt, '1900-01-01') <> NVL(T.MOC_Dt, '1900-01-01')
              OR NVL(O.CommonMocTypeAlt_Key, 0) <> NVL(T.CommonMocTypeAlt_Key, 0)
              OR NVL(O.FlgDeg, ' ') <> NVL(T.FlgDeg, ' ')
              OR NVL(O.FlgDirtyRow, ' ') <> NVL(T.FlgDirtyRow, ' ')
              OR NVL(O.FlgInMonth, ' ') <> NVL(T.FlgInMonth, ' ')
              OR NVL(O.FlgSMA, ' ') <> NVL(T.FlgSMA, ' ')
              OR NVL(O.FlgPNPA, ' ') <> NVL(T.FlgPNPA, ' ')
              OR NVL(O.FlgUpg, ' ') <> NVL(T.FlgUpg, ' ')
              OR NVL(O.FlgFITL, ' ') <> NVL(T.FlgFITL, ' ')
              OR NVL(O.FlgAbinitio, ' ') <> NVL(T.FlgAbinitio, ' ')
              OR NVL(O.NPA_Days, 0) <> NVL(T.NPA_Days, 0)
              OR NVL(O.RefPeriodOverdueUPG, 0) <> NVL(T.RefPeriodOverdueUPG, 0)
              OR NVL(O.RefPeriodOverDrawnUPG, 0) <> NVL(T.RefPeriodOverDrawnUPG, 0)
              OR NVL(O.RefPeriodNoCreditUPG, 0) <> NVL(T.RefPeriodNoCreditUPG, 0)
              OR NVL(O.RefPeriodIntServiceUPG, 0) <> NVL(T.RefPeriodIntServiceUPG, 0)
              OR NVL(O.RefPeriodStkStatementUPG, 0) <> NVL(T.RefPeriodStkStatementUPG, 0)
              OR NVL(O.RefPeriodReviewUPG, 0) <> NVL(T.RefPeriodReviewUPG, 0)
              OR NVL(O.AppGovGur, 0) <> NVL(T.AppGovGur, 0)
              OR NVL(O.UsedRV, 0) <> NVL(T.UsedRV, 0)
              OR NVL(O.ComputedClaim, 0) <> NVL(T.ComputedClaim, 0)
              OR NVL(O.UPG_RELAX_MSME, ' ') <> NVL(T.UPG_RELAX_MSME, ' ')
              OR NVL(O.DEG_RELAX_MSME, ' ') <> NVL(T.DEG_RELAX_MSME, ' ')
              OR NVL(O.PNPA_DATE, '1900-01-01') <> NVL(T.PNPA_DATE, '1900-01-01')
              OR NVL(O.NPA_Reason, ' ') <> NVL(T.NPA_Reason, ' ')
              OR NVL(O.PnpaAssetClassAlt_key, 0) <> NVL(T.PnpaAssetClassAlt_key, 0)
              OR NVL(O.DisbAmount, 0) <> NVL(T.DisbAmount, 0)
              OR NVL(O.PrincOutStd, 0) <> NVL(T.PrincOutStd, 0)
              OR NVL(O.PrincOverdue, 0) <> NVL(T.PrincOverdue, 0)
              OR NVL(O.PrincOverdueSinceDt, '1900-01-01') <> NVL(T.PrincOverdueSinceDt, '1900-01-01')
              OR NVL(O.IntOverdue, 0) <> NVL(T.IntOverdue, 0)
              OR NVL(O.IntOverdueSinceDt, '1900-01-01') <> NVL(T.IntOverdueSinceDt, '1900-01-01')
              OR NVL(O.OtherOverdue, 0) <> NVL(T.OtherOverdue, 0)
              OR NVL(O.OtherOverdueSinceDt, '1900-01-01') <> NVL(T.OtherOverdueSinceDt, '1900-01-01')
              OR NVL(O.RelationshipNumber, ' ') <> NVL(T.RelationshipNumber, ' ')
              OR NVL(O.AccountFlag, ' ') <> NVL(T.AccountFlag, ' ')
              OR NVL(O.CommercialFlag_AltKey, 0) <> NVL(T.CommercialFlag_AltKey, 0)
              OR NVL(O.Liability, ' ') <> NVL(T.Liability, ' ')
              OR NVL(O.CD, ' ') <> NVL(T.CD, ' ')
              OR NVL(O.AccountStatus, ' ') <> NVL(T.AccountStatus, ' ')
              OR NVL(O.AccountBlkCode1, ' ') <> NVL(T.AccountBlkCode1, ' ')
              OR NVL(O.AccountBlkCode2, ' ') <> NVL(T.AccountBlkCode2, ' ')
              OR NVL(O.ExposureType, ' ') <> NVL(T.ExposureType, ' ')
              OR NVL(O.Mtm_Value, 0) <> NVL(T.Mtm_Value, 0)
              OR NVL(O.BankAssetClass, ' ') <> NVL(T.BankAssetClass, ' ')
              OR NVL(O.NpaType, ' ') <> NVL(T.NpaType, ' ')
              OR NVL(O.SecApp, ' ') <> NVL(T.SecApp, ' ')
              OR NVL(O.BorrowerTypeID, 0) <> NVL(T.BorrowerTypeID, 0)
              OR NVL(O.LineCode, ' ') <> NVL(T.LineCode, ' ')
              OR NVL(O.ProvPerSecured, 0) <> NVL(T.ProvPerSecured, 0)
              OR NVL(O.ProvPerUnSecured, 0) <> NVL(T.ProvPerUnSecured, 0)
              OR NVL(O.MOCReason, ' ') <> NVL(T.MOCReason, ' ')
              OR NVL(O.AddlProvisionPer, 0) <> NVL(T.AddlProvisionPer, 0)
              OR NVL(O.FlgINFRA, ' ') <> NVL(T.FlgINFRA, ' ')
              OR NVL(O.RepossessionDate, '1900-01-01') <> NVL(T.RepossessionDate, '1900-01-01')
              OR NVL(O.DerecognisedInterest1, 0) <> NVL(T.DerecognisedInterest1, 0)
              OR NVL(O.DerecognisedInterest2, 0) <> NVL(T.DerecognisedInterest2, 0)
              OR NVL(O.ProductCode, ' ') <> NVL(T.ProductCode, ' ')
              OR NVL(O.FlgLCBG, ' ') <> NVL(T.FlgLCBG, ' ')
              OR NVL(O.unserviedint, 0) <> NVL(T.UnserviedInt, 0)
              OR NVL(O.PreQtrCredit, 0) <> NVL(T.PreQtrCredit, 0)
              OR NVL(O.PrvQtrInt, 0) <> NVL(T.PrvQtrInt, 0)
              OR NVL(O.CurQtrCredit, 0) <> NVL(T.CurQtrCredit, 0)
              OR NVL(O.CurQtrInt, 0) <> NVL(T.CurQtrInt, 0)
              OR NVL(O.OriginalBranchcode, ' ') <> NVL(T.OriginalBranchcode, ' ')
              OR NVL(O.AdvanceRecovery, 0) <> NVL(T.AdvanceRecovery, 0)
              OR NVL(O.NotionalInttAmt, 0) <> NVL(T.NotionalInttAmt, 0)
              OR NVL(O.PrvAssetClassAlt_Key, 0) <> NVL(T.PrvAssetClassAlt_Key, 0)
              OR NVL(O.MOCTYPE, ' ') <> NVL(T.MOCTYPE, ' ')
              OR NVL(O.FlgSecured, ' ') <> NVL(T.FlgSecured, ' ')
              OR NVL(O.RePossession, ' ') <> NVL(T.RePossession, ' ')
              OR NVL(O.RCPending, ' ') <> NVL(T.RCPending, ' ')
              OR NVL(O.PaymentPending, ' ') <> NVL(T.PaymentPending, ' ')
              OR NVL(O.WheelCase, ' ') <> NVL(T.WheelCase, ' ')
              OR NVL(O.CustomerLevelMaxPer, 0) <> NVL(T.CustomerLevelMaxPer, 0)
              OR NVL(O.FinalProvisionPer, 0) <> NVL(T.FinalProvisionPer, 0)
              OR NVL(O.IsIBPC, ' ') <> NVL(T.IsIBPC, ' ')
              OR NVL(O.IsSecuritised, ' ') <> NVL(T.IsSecuritised, ' ')
              OR NVL(O.RFA, ' ') <> NVL(T.RFA, ' ')
              OR NVL(O.IsNonCooperative, ' ') <> NVL(T.IsNonCooperative, ' ')
              OR NVL(O.Sarfaesi, ' ') <> NVL(T.Sarfaesi, ' ')
              OR NVL(O.WeakAccount, ' ') <> NVL(T.WeakAccount, ' ')
              OR NVL(O.PUI, ' ') <> NVL(T.PUI, ' ')
              OR NVL(O.FlgFraud, ' ') <> NVL(T.FlgFraud, ' ')
              OR NVL(O.FlgRestructure, ' ') <> NVL(T.FlgRestructure, ' ')
              OR NVL(O.RestructureDate, '1900-01-01') <> NVL(T.RestructureDate, '1900-01-01')
              OR NVL(O.SarfaesiDate, '1900-01-01') <> NVL(T.SarfaesiDate, '1900-01-01')
              OR NVL(O.FlgUnusualBounce, ' ') <> NVL(T.FlgUnusualBounce, ' ')
              OR NVL(O.UnusualBounceDate, '1900-01-01') <> NVL(T.UnusualBounceDate, '1900-01-01')
              OR NVL(O.FlgUnClearedEffect, ' ') <> NVL(T.FlgUnClearedEffect, ' ')
              OR NVL(O.UnClearedEffectDate, '1900-01-01') <> NVL(T.UnClearedEffectDate, '1900-01-01')
              OR NVL(O.FraudDate, '1900-01-01') <> NVL(T.FraudDate, '1900-01-01')
              OR NVL(O.WeakAccountDate, '1900-01-01') <> NVL(T.WeakAccountDate, '1900-01-01') )) src
            ON ( T.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET T.IsChanged = 'C';
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, 'U'
            FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                   JOIN PRO_RBL_MISDB_PROD.AccountCal_Hist B   ON B.AccountEntityID = A.AccountEntityID 
             WHERE B.EffectiveFromTimeKey = v_TimeKey
              AND A.IsChanged = 'C') src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.IsChanged = 'U';
            ----------For Changes Records
            MERGE INTO b 
            USING (SELECT b.ROWID row_id, v_VEFFECTIVETO
            FROM b ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                   JOIN PRO_RBL_MISDB_PROD.AccountCal_Hist B   ON B.AccountEntityID = A.AccountEntityID
                   AND B.EffectiveToTimeKey = 49999 
             WHERE B.EffectiveFromTimeKey < v_TimeKey
              AND A.IsChanged = 'C') src
            ON ( b.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET b.EffectiveToTimeKey = v_VEFFECTIVETO;
            MERGE INTO O 
            USING (SELECT O.ROWID row_id, T.UcifEntityID, T.CustomerEntityID, T.CustomerAcID, T.RefCustomerID, T.SourceSystemCustomerID, T.UCIF_ID, T.BranchCode, T.FacilityType, T.AcOpenDt, T.FirstDtOfDisb, T.ProductAlt_Key, T.SchemeAlt_key, T.SubSectorAlt_Key, T.SplCatg1Alt_Key, T.SplCatg2Alt_Key, T.SplCatg3Alt_Key, T.SplCatg4Alt_Key, T.SourceAlt_Key, T.ActSegmentCode, T.InttRate, T.Balance, T.BalanceInCrncy, T.CurrencyAlt_Key, T.DrawingPower, T.CurrentLimit, T.CurrentLimitDt, T.ContiExcessDt, T.StockStDt, T.DebitSinceDt, T.LastCrDate, T.InttServiced, T.IntNotServicedDt, T.OverdueAmt, T.OverDueSinceDt, T.ReviewDueDt, T.SecurityValue, T.DFVAmt, T.GovtGtyAmt, T.CoverGovGur, T.WriteOffAmount, T.UnAdjSubSidy, T.CreditsinceDt, T.DegReason, T.Asset_Norm, T.REFPeriodMax, T.RefPeriodOverdue, T.RefPeriodOverDrawn, T.RefPeriodNoCredit, T.RefPeriodIntService, T.RefPeriodStkStatement, T.RefPeriodReview, T.NetBalance, T.ApprRV, T.SecuredAmt, T.UnSecuredAmt, T.ProvDFV, T.Provsecured, T.ProvUnsecured, T.ProvCoverGovGur, T.AddlProvision, T.TotalProvision, T.BankProvsecured, T.BankProvUnsecured, T.BankTotalProvision, T.RBIProvsecured, T.RBIProvUnsecured, T.RBITotalProvision, T.InitialNpaDt, T.FinalNpaDt, T.SMA_Dt, T.UpgDate, T.InitialAssetClassAlt_Key, T.FinalAssetClassAlt_Key, T.ProvisionAlt_Key, T.PNPA_Reason, T.SMA_Class, T.SMA_Reason, T.FlgMoc, T.MOC_Dt, T.CommonMocTypeAlt_Key, T.FlgDeg, T.FlgDirtyRow, T.FlgInMonth, T.FlgSMA, T.FlgPNPA, T.FlgUpg, T.FlgFITL, T.FlgAbinitio, T.NPA_Days, T.RefPeriodOverdueUPG, T.RefPeriodOverDrawnUPG, T.RefPeriodNoCreditUPG, T.RefPeriodIntServiceUPG, T.RefPeriodStkStatementUPG, T.RefPeriodReviewUPG, T.AppGovGur, T.UsedRV, T.ComputedClaim, T.UPG_RELAX_MSME, T.DEG_RELAX_MSME, T.PNPA_DATE, T.NPA_Reason, T.PnpaAssetClassAlt_key, T.DisbAmount, T.PrincOutStd, T.PrincOverdue, T.PrincOverdueSinceDt, T.IntOverdue, T.IntOverdueSinceDt, T.OtherOverdue, T.OtherOverdueSinceDt, T.RelationshipNumber, T.AccountFlag, T.CommercialFlag_AltKey, T.Liability, T.CD, T.AccountStatus, T.AccountBlkCode1, T.AccountBlkCode2, T.ExposureType, T.Mtm_Value, T.BankAssetClass, T.NpaType, T.SecApp, T.BorrowerTypeID, T.LineCode, T.ProvPerSecured, T.ProvPerUnSecured, T.MOCReason, T.AddlProvisionPer, T.FlgINFRA, T.RepossessionDate, T.DerecognisedInterest1, T.DerecognisedInterest2, T.ProductCode, T.FlgLCBG, T.UnserviedInt, T.PreQtrCredit, T.PrvQtrInt, T.CurQtrCredit, T.CurQtrInt, T.OriginalBranchcode, T.AdvanceRecovery, T.NotionalInttAmt, T.PrvAssetClassAlt_Key, T.MOCTYPE, T.FlgSecured, T.RePossession, T.RCPending, T.PaymentPending, T.WheelCase, T.CustomerLevelMaxPer, T.FinalProvisionPer, T.IsIBPC, T.IsSecuritised, T.RFA, T.IsNonCooperative, T.Sarfaesi, T.WeakAccount, T.PUI, T.FlgFraud, T.FlgRestructure, T.RestructureDate, T.SarfaesiDate, T.FlgUnusualBounce, T.UnusualBounceDate, T.FlgUnClearedEffect, T.UnClearedEffectDate, T.FraudDate, T.WeakAccountDate
            FROM O ,PRO_RBL_MISDB_PROD.AccountCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL T   ON O.AccountEntityID = T.AccountEntityID 
             WHERE O.EffectiveFromTimeKey = v_TimeKey
              AND T.IsChanged = 'U') src
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
                                         T.unserviedint = src.UnserviedInt,
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
            ----------------------------------------------------------------------------------------------------------------------------------------------
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_VEFFECTIVETO
            FROM AA ,PRO_RBL_MISDB_PROD.AccountCal_Hist AA 
             WHERE AA.EffectiveToTimeKey = 49999
              AND NOT EXISTS ( SELECT 1 
                               FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL BB
                                WHERE  AA.AccountEntityID = BB.AccountEntityID )) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_VEFFECTIVETO;
            SELECT MAX(EntityKey)  

              INTO v_EntityKeyAc
              FROM PRO_RBL_MISDB_PROD.AccountCal_Hist ;
            IF v_EntityKeyAc IS NULL THEN

            BEGIN
               v_EntityKeyAc := 0 ;

            END;
            END IF;
            MERGE INTO TEMP 
            USING (SELECT TEMP.ROWID row_id, ACCT.EntityKeyNew
            FROM TEMP ,PRO_RBL_MISDB_PROD.ACCOUNTCAL TEMP
                   JOIN ( SELECT ACCOUNTCAL.AccountEntityId ,
                                 (v_EntityKeyAc + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                                   FROM DUAL  )  )) EntityKeyNew  
                          FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
                           WHERE  ACCOUNTCAL.IsChanged IN ( 'C','N' )
                         ) ACCT   ON TEMP.AccountEntityID = ACCT.AccountEntityId 
             WHERE Temp.IsChanged IN ( 'C','N' )
            ) src
            ON ( TEMP.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET TEMP.EntityKeyNew = src.EntityKeyNew;
            /***************************************************************************************************************/
            INSERT INTO PRO_RBL_MISDB_PROD.AccountCal_Hist
              ( EntityKey, AccountEntityID, UcifEntityID, CustomerEntityID, CustomerAcID, RefCustomerID, SourceSystemCustomerID, UCIF_ID, BranchCode, FacilityType, AcOpenDt, FirstDtOfDisb, ProductAlt_Key, SchemeAlt_key, SubSectorAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SourceAlt_Key, ActSegmentCode, InttRate, Balance, BalanceInCrncy, CurrencyAlt_Key, DrawingPower, CurrentLimit, CurrentLimitDt, ContiExcessDt, StockStDt, DebitSinceDt, LastCrDate, InttServiced, IntNotServicedDt, OverdueAmt, OverDueSinceDt, ReviewDueDt, SecurityValue, DFVAmt, GovtGtyAmt, CoverGovGur, WriteOffAmount, UnAdjSubSidy, CreditsinceDt, DegReason, Asset_Norm, REFPeriodMax, RefPeriodOverdue, RefPeriodOverDrawn, RefPeriodNoCredit, RefPeriodIntService, RefPeriodStkStatement, RefPeriodReview, NetBalance, ApprRV, SecuredAmt, UnSecuredAmt, ProvDFV, Provsecured, ProvUnsecured, ProvCoverGovGur, AddlProvision, TotalProvision, BankProvsecured, BankProvUnsecured, BankTotalProvision, RBIProvsecured, RBIProvUnsecured, RBITotalProvision, InitialNpaDt, FinalNpaDt, SMA_Dt, UpgDate, InitialAssetClassAlt_Key, FinalAssetClassAlt_Key, ProvisionAlt_Key, PNPA_Reason, SMA_Class, SMA_Reason, FlgMoc, MOC_Dt, CommonMocTypeAlt_Key, FlgDeg, FlgDirtyRow, FlgInMonth, FlgSMA, FlgPNPA, FlgUpg, FlgFITL, FlgAbinitio, NPA_Days, RefPeriodOverdueUPG, RefPeriodOverDrawnUPG, RefPeriodNoCreditUPG, RefPeriodIntServiceUPG, RefPeriodStkStatementUPG, RefPeriodReviewUPG, EffectiveFromTimeKey, EffectiveToTimeKey, AppGovGur, UsedRV, ComputedClaim, UPG_RELAX_MSME, DEG_RELAX_MSME, PNPA_DATE, NPA_Reason, PnpaAssetClassAlt_key, DisbAmount, PrincOutStd, PrincOverdue, PrincOverdueSinceDt, IntOverdue, IntOverdueSinceDt, OtherOverdue, OtherOverdueSinceDt, RelationshipNumber, AccountFlag, CommercialFlag_AltKey, Liability, CD, AccountStatus, AccountBlkCode1, AccountBlkCode2, ExposureType, Mtm_Value, BankAssetClass, NpaType, SecApp, BorrowerTypeID, LineCode, ProvPerSecured, ProvPerUnSecured, MOCReason, AddlProvisionPer, FlgINFRA, RepossessionDate, DerecognisedInterest1, DerecognisedInterest2, ProductCode, FlgLCBG, unserviedint, PreQtrCredit, PrvQtrInt, CurQtrCredit, CurQtrInt, OriginalBranchcode, AdvanceRecovery, NotionalInttAmt, PrvAssetClassAlt_Key, MOCTYPE, FlgSecured, RePossession, RCPending, PaymentPending, WheelCase, CustomerLevelMaxPer, FinalProvisionPer, IsIBPC, IsSecuritised, RFA, IsNonCooperative, Sarfaesi, WeakAccount, PUI, FlgFraud, FlgRestructure, RestructureDate, SarfaesiDate, FlgUnusualBounce, UnusualBounceDate, FlgUnClearedEffect, UnClearedEffectDate, FraudDate, WeakAccountDate, ScreenFlag, ChangeField )
              ( SELECT EntityKeyNew ,
                       AccountEntityID ,
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
                       v_TimeKey EffectiveFromTimeKey  ,
                       49999 EffectiveToTimeKey  ,
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
                       IntOverdue ,
                       IntOverdueSinceDt ,
                       OtherOverdue ,
                       OtherOverdueSinceDt ,
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
                       unserviedint ,
                       PreQtrCredit ,
                       PrvQtrInt ,
                       CurQtrCredit ,
                       CurQtrInt ,
                       OriginalBranchcode ,
                       AdvanceRecovery ,
                       NotionalInttAmt ,
                       PrvAssetClassAlt_Key ,
                       MOCTYPE ,
                       FlgSecured ,
                       RePossession ,
                       RCPending ,
                       PaymentPending ,
                       WheelCase ,
                       CustomerLevelMaxPer ,
                       FinalProvisionPer ,
                       IsIBPC ,
                       IsSecuritised ,
                       RFA ,
                       IsNonCooperative ,
                       Sarfaesi ,
                       WeakAccount ,
                       PUI ,
                       FlgFraud ,
                       FlgRestructure ,
                       RestructureDate ,
                       SarfaesiDate ,
                       FlgUnusualBounce ,
                       UnusualBounceDate ,
                       FlgUnClearedEffect ,
                       UnClearedEffectDate ,
                       FraudDate ,
                       WeakAccountDate ,
                       NULL ScreenFlag  ,
                       NULL ChangeField  

                --select SUM(BALANCE)/10000000,  count(1)
                FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL T
                 WHERE  NVL(T.IsChanged, 'N') IN ( 'C','N' )
               );
            /* MERGE DATA INTO MAIN ADVANCE TABLE */
            /* RESTRUCTURE WORK */
            MERGE INTO T 
            USING (SELECT T.ROWID row_id, 'E'
            FROM T ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal T   ON O.AccountEntityId = T.AccountEntityId
                   AND O.EffectiveToTimeKey = 49999 ) src
            ON ( T.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET T.IsChanged = 'E';
            MERGE INTO T 
            USING (SELECT T.ROWID row_id, 'C'
            FROM T ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal T   ON O.AccountEntityId = T.AccountEntityId
                   AND O.EffectiveToTimeKey = 49999 
             WHERE ( NVL(O.AssetClassAlt_KeyOnInvocation, 0) <> NVL(T.AssetClassAlt_KeyOnInvocation, 0)
              OR NVL(O.PreRestructureAssetClassAlt_Key, 0) <> NVL(T.PreRestructureAssetClassAlt_Key, 0)
              OR NVL(O.PreRestructureNPA_Date, '1900-01-01') <> NVL(T.PreRestructureNPA_Date, '1900-01-01')
              OR NVL(O.ProvPerOnRestrucure, 0) <> NVL(T.ProvPerOnRestrucure, 0)
              OR NVL(O.RestructureTypeAlt_Key, 0) <> NVL(T.RestructureTypeAlt_Key, 0)
              OR NVL(O.COVID_OTR_CatgAlt_Key, 0) <> NVL(T.COVID_OTR_CatgAlt_Key, 0)
              OR NVL(O.RestructureDt, '1900-01-01') <> NVL(T.RestructureDt, '1900-01-01')
              OR NVL(O.SP_ExpiryDate, '1900-01-01') <> NVL(T.SP_ExpiryDate, '1900-01-01')
              OR NVL(O.DPD_AsOnRestructure, 0) <> NVL(T.DPD_AsOnRestructure, 0)
              OR NVL(O.RestructureFailureDate, '1900-01-01') <> NVL(T.RestructureFailureDate, '1900-01-01')
              OR NVL(O.DPD_Breach_Date, '1900-01-01') <> NVL(T.DPD_Breach_Date, '1900-01-01')
              OR NVL(O.ZeroDPD_Date, '1900-01-01') <> NVL(T.ZeroDPD_Date, '1900-01-01')
              OR NVL(O.SP_ExpiryExtendedDate, '1900-01-01') <> NVL(T.SP_ExpiryExtendedDate, '1900-01-01')
              OR NVL(O.CurrentPOS, 0) <> NVL(T.CurrentPOS, 0)
              OR NVL(O.CurrentTOS, 0) <> NVL(T.CurrentTOS, 0)
              OR NVL(O.RestructurePOS, 0) <> NVL(T.RestructurePOS, 0)
              OR NVL(O.Res_POS_to_CurrentPOS_Per, 0) <> NVL(T.Res_POS_to_CurrentPOS_Per, 0)
              OR NVL(O.CurrentDPD, 0) <> NVL(T.CurrentDPD, 0)
              OR NVL(O.TotalDPD, 0) <> NVL(T.TotalDPD, 0)
              OR NVL(O.VDPD, 0) <> NVL(T.VDPD, 0)
              OR NVL(O.AddlProvPer, 0) <> NVL(T.AddlProvPer, 0)
              OR NVL(O.ProvReleasePer, 0) <> NVL(T.ProvReleasePer, 0)
              OR NVL(O.AppliedNormalProvPer, 0) <> NVL(T.AppliedNormalProvPer, 0)
              OR NVL(O.FinalProvPer, 0) <> NVL(T.FinalProvPer, 0)
              OR NVL(O.PreDegProvPer, 0) <> NVL(T.PreDegProvPer, 0)
              OR NVL(O.UpgradeDate, '1900-01-01') <> NVL(T.UpgradeDate, '1900-01-01')
              OR NVL(O.SurvPeriodEndDate, '1900-01-01') <> NVL(T.SurvPeriodEndDate, '1900-01-01')
              OR NVL(O.DegDurSP_PeriodProvPer, 0) <> NVL(T.DegDurSP_PeriodProvPer, 0)
              OR NVL(O.NonFinDPD, 0) <> NVL(T.NonFinDPD, 0)
              OR NVL(O.InitialAssetClassAlt_Key, 0) <> NVL(T.InitialAssetClassAlt_Key, 0)
              OR NVL(O.FinalAssetClassAlt_Key, 0) <> NVL(T.FinalAssetClassAlt_Key, 0)
              OR NVL(O.RestructureProvision, 0) <> NVL(T.RestructureProvision, 0)
              OR NVL(O.SecuredProvision, 0) <> NVL(T.SecuredProvision, 0)
              OR NVL(O.UnSecuredProvision, 0) <> NVL(T.UnSecuredProvision, 0)
              OR NVL(O.FlgDeg, ' ') <> NVL(T.FlgDeg, ' ')
              OR NVL(O.FlgUpg, ' ') <> NVL(T.FlgUpg, ' ')
              OR NVL(O.DegDate, '1900-01-01') <> NVL(T.DegDate, '1900-01-01')
              OR NVL(O.RC_Pending, ' ') <> NVL(T.RC_Pending, ' ')
              OR NVL(O.FinalNpaDt, '1900-01-01') <> NVL(T.FinalNpaDt, '1900-01-01')
              OR NVL(O.RestructureStage, ' ') <> NVL(T.RestructureStage, ' ')
              OR NVL(O.DegReason, ' ') <> NVL(T.DegReason, ' ')
              OR NVL(O.InvestmentGrade, ' ') <> NVL(T.InvestmentGrade, ' ')
              OR NVL(O.PreRestructureNPA_Prov, 0) <> NVL(T.PreRestructureNPA_Prov, 0)
              OR NVL(O.FlgMorat, ' ') <> NVL(T.FlgMorat, ' ')
              OR NVL(O.POS_10PerPaidDate, '1900-01-01') <> NVL(T.POS_10PerPaidDate, '1900-01-01') )) src
            ON ( T.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET T.IsChanged = 'C';
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, 'U'
            FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                   JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist B   ON B.AccountEntityId = A.AccountEntityId 
             WHERE B.EffectiveFromTimeKey = v_TimeKey
              AND A.IsChanged = 'C') src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.IsChanged = 'U';
            ----------For Changes Records
            MERGE INTO b 
            USING (SELECT b.ROWID row_id, v_VEFFECTIVETO
            FROM b ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                   JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist B   ON B.AccountEntityId = A.AccountEntityId
                   AND B.EffectiveToTimeKey = 49999 
             WHERE B.EffectiveFromTimeKey < v_TimeKey
              AND A.IsChanged = 'C') src
            ON ( b.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET b.EffectiveToTimeKey = v_VEFFECTIVETO;
            MERGE INTO O 
            USING (SELECT O.ROWID row_id, T.AssetClassAlt_KeyOnInvocation, T.PreRestructureAssetClassAlt_Key, T.PreRestructureNPA_Date, T.ProvPerOnRestrucure, T.RestructureTypeAlt_Key, T.COVID_OTR_CatgAlt_Key, T.RestructureDt, T.SP_ExpiryDate, T.DPD_AsOnRestructure, T.RestructureFailureDate, T.DPD_Breach_Date, T.ZeroDPD_Date, T.SP_ExpiryExtendedDate, T.CurrentPOS, T.CurrentTOS, T.RestructurePOS, T.Res_POS_to_CurrentPOS_Per, T.CurrentDPD, T.TotalDPD, T.VDPD, T.AddlProvPer, T.ProvReleasePer, T.AppliedNormalProvPer, T.FinalProvPer, T.PreDegProvPer, T.UpgradeDate, T.SurvPeriodEndDate, T.DegDurSP_PeriodProvPer, T.NonFinDPD, T.InitialAssetClassAlt_Key, T.FinalAssetClassAlt_Key, T.RestructureProvision, T.SecuredProvision, T.UnSecuredProvision, T.FlgDeg, T.FlgUpg, T.DegDate, T.RC_Pending, T.FinalNpaDt, T.RestructureStage, T.DegReason, T.InvestmentGrade, T.PreRestructureNPA_Prov, T.FlgMorat, T.POS_10PerPaidDate
            FROM O ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal T   ON O.AccountEntityId = T.AccountEntityId 
             WHERE O.EffectiveFromTimeKey = v_TimeKey
              AND T.IsChanged = 'U') src
            ON ( O.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET AssetClassAlt_KeyOnInvocation = src.AssetClassAlt_KeyOnInvocation,
                                         PreRestructureAssetClassAlt_Key = src.PreRestructureAssetClassAlt_Key,
                                         PreRestructureNPA_Date = src.PreRestructureNPA_Date,
                                         ProvPerOnRestrucure = src.ProvPerOnRestrucure,
                                         RestructureTypeAlt_Key = src.RestructureTypeAlt_Key,
                                         COVID_OTR_CatgAlt_Key = src.COVID_OTR_CatgAlt_Key,
                                         RestructureDt = src.RestructureDt,
                                         SP_ExpiryDate = src.SP_ExpiryDate,
                                         DPD_AsOnRestructure = src.DPD_AsOnRestructure,
                                         RestructureFailureDate = src.RestructureFailureDate,
                                         DPD_Breach_Date = src.DPD_Breach_Date,
                                         ZeroDPD_Date = src.ZeroDPD_Date,
                                         SP_ExpiryExtendedDate = src.SP_ExpiryExtendedDate,
                                         CurrentPOS = src.CurrentPOS,
                                         CurrentTOS = src.CurrentTOS,
                                         RestructurePOS = src.RestructurePOS,
                                         Res_POS_to_CurrentPOS_Per = src.Res_POS_to_CurrentPOS_Per,
                                         CurrentDPD = src.CurrentDPD,
                                         TotalDPD = src.TotalDPD,
                                         VDPD = src.VDPD,
                                         AddlProvPer = src.AddlProvPer,
                                         ProvReleasePer = src.ProvReleasePer,
                                         AppliedNormalProvPer = src.AppliedNormalProvPer,
                                         FinalProvPer = src.FinalProvPer,
                                         PreDegProvPer = src.PreDegProvPer,
                                         UpgradeDate = src.UpgradeDate,
                                         SurvPeriodEndDate = src.SurvPeriodEndDate,
                                         DegDurSP_PeriodProvPer = src.DegDurSP_PeriodProvPer,
                                         NonFinDPD = src.NonFinDPD,
                                         InitialAssetClassAlt_Key = src.InitialAssetClassAlt_Key,
                                         FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                         RestructureProvision = src.RestructureProvision,
                                         SecuredProvision = src.SecuredProvision,
                                         UnSecuredProvision = src.UnSecuredProvision,
                                         FlgDeg = src.FlgDeg,
                                         FlgUpg = src.FlgUpg,
                                         DegDate = src.DegDate,
                                         RC_Pending = src.RC_Pending,
                                         FinalNpaDt = src.FinalNpaDt,
                                         RestructureStage = src.RestructureStage,
                                         DegReason = src.DegReason,
                                         InvestmentGrade = src.InvestmentGrade,
                                         PreRestructureNPA_Prov = src.PreRestructureNPA_Prov,
                                         FlgMorat = src.FlgMorat,
                                         POS_10PerPaidDate = src.POS_10PerPaidDate;
            ----------------------------------------------------------------------------------------------------------------------------------------------
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_VEFFECTIVETO
            FROM AA ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist AA 
             WHERE AA.EffectiveToTimeKey = 49999
              AND NOT EXISTS ( SELECT 1 
                               FROM PRO_RBL_MISDB_PROD.AdvAcRestructureCal BB
                                WHERE  AA.AccountEntityId = BB.AccountEntityId )) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_VEFFECTIVETO;
            ----/*  New Customers Ac Key ID Update  */
            ----DECLARE @EntityKeyRestr BIGINT=0 
            ----SELECT @EntityKeyRestr=MAX(EntityKey) FROM  PRO.AdvAcRestructureCal_Hist
            ----IF @EntityKeyRestr IS NULL  
            ----BEGIN
            ----	SET @EntityKeyCust=0
            ----END
            ----UPDATE TEMP 
            ----SET TEMP.EntityKeyNew=ACCT.EntityKeyNew
            ---- FROM PRO.AdvAcRestructureCal TEMP
            ----INNER JOIN (SELECT AccountEntityId,(@EntityKeyRestr + ROW_NUMBER()OVER(ORDER BY (SELECT 1))) EntityKeyNew
            ----			FROM PRO.AdvAcRestructureCal Where IsChanged in ('C','N')
            ----			)ACCT ON TEMP.AccountEntityId=ACCT.AccountEntityId
            ----WHERE Temp.IsChanged in ('C','N')
            /***************************************************************************************************************/
            INSERT INTO PRO_RBL_MISDB_PROD.AdvAcRestructureCal_Hist
            --EntityKey
             --,

              ( AccountEntityId, AssetClassAlt_KeyOnInvocation, PreRestructureAssetClassAlt_Key, PreRestructureNPA_Date, ProvPerOnRestrucure, RestructureTypeAlt_Key, COVID_OTR_CatgAlt_Key, RestructureDt, SP_ExpiryDate, DPD_AsOnRestructure, RestructureFailureDate, DPD_Breach_Date, ZeroDPD_Date, SP_ExpiryExtendedDate, CurrentPOS, CurrentTOS, RestructurePOS, Res_POS_to_CurrentPOS_Per, CurrentDPD, TotalDPD, VDPD, AddlProvPer, ProvReleasePer, AppliedNormalProvPer, FinalProvPer, PreDegProvPer, UpgradeDate, SurvPeriodEndDate
            --------,DegDurSP_PeriodProvPer
            , NonFinDPD, InitialAssetClassAlt_Key, FinalAssetClassAlt_Key, RestructureProvision, SecuredProvision, UnSecuredProvision, FlgDeg, FlgUpg, DegDate, RC_Pending, FinalNpaDt, RestructureStage, EffectiveFromTimeKey, EffectiveToTimeKey, FlgMorat, InvestmentGrade, POS_10PerPaidDate, RestructureFacilityTypeAlt_Key )
              ( SELECT
                --EntityKeyNew
                 --,
                 AccountEntityId ,
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
                FROM PRO_RBL_MISDB_PROD.AdvAcRestructureCal T
                 WHERE  NVL(T.IsChanged, 'N') IN ( 'C','N' )
               );
            DELETE FROM tt_AdvAcRestructureDetail_15;
            UTILS.IDENTITY_RESET('tt_AdvAcRestructureDetail_15');

            INSERT INTO tt_AdvAcRestructureDetail_15 ( 
            	SELECT * ,
                    ' ' IsChanged  
            	  FROM AdvAcRestructureDetail 
            	 WHERE  EffectiveFromTimeKey <= v_TIMEKEY
                       AND EffectiveToTimeKey >= v_TIMEKEY );
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, NVL(B.AppliedNormalProvPer, 0) + NVL(B.FinalProvPer, 0) AS PreDegProvPer
            FROM A ,tt_AdvAcRestructureDetail_15 A
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
            FROM a ,tt_AdvAcRestructureDetail_15 a
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
                   JOIN tt_AdvAcRestructureDetail_15 T   ON O.AccountEntityID = T.AccountEntityID
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
                   JOIN tt_AdvAcRestructureDetail_15 B   ON A.AccountEntityId = B.AccountEntityId
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
            FROM A ,tt_AdvAcRestructureDetail_15 A
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
                FROM tt_AdvAcRestructureDetail_15 T
                 WHERE  NVL(T.IsChanged, 'U') = 'C' );
            /* END OF RESTR */
            /*PIU WORK */
            DELETE PRO_RBL_MISDB_PROD.PUI_CAL_hist

             WHERE  EffectiveFromTimeKey = v_TIMEKEY
                      AND EffectiveToTimeKey = v_TIMEKEY;
            INSERT INTO PRO_RBL_MISDB_PROD.PUI_CAL_hist
              ( CustomerEntityID, AccountEntityId, ProjectCategoryAlt_Key, ProjectSubCategoryAlt_key, DelayReasonChangeinOwnership, ProjectAuthorityAlt_key, OriginalDCCO, OriginalProjectCost, OriginalDebt, Debt_EquityRatio, ChangeinProjectScope, FreshOriginalDCCO, RevisedDCCO, CourtCaseArbitration, CIOReferenceDate, CIODCCO, TakeOutFinance, AssetClassSellerBookAlt_key, NPADateSellerBook, Restructuring, InitialExtension, BeyonControlofPromoters, DelayReasonOther, FLG_UPG, FLG_DEG, DEFAULT_REASON, ProjCategory, NPA_DATE, PUI_ProvPer, RestructureDate, ActualDCCO, ActualDCCO_Date, UpgradeDate, FinalAssetClassAlt_Key, DPD_Max, EffectiveFromTimeKey, EffectiveToTimeKey )
              ( SELECT CustomerEntityID ,
                       AccountEntityId ,
                       ProjectCategoryAlt_Key ,
                       ProjectSubCategoryAlt_key ,
                       DelayReasonChangeinOwnership ,
                       ProjectAuthorityAlt_key ,
                       OriginalDCCO ,
                       OriginalProjectCost ,
                       OriginalDebt ,
                       Debt_EquityRatio ,
                       ChangeinProjectScope ,
                       FreshOriginalDCCO ,
                       RevisedDCCO ,
                       CourtCaseArbitration ,
                       CIOReferenceDate ,
                       CIODCCO ,
                       TakeOutFinance ,
                       AssetClassSellerBookAlt_key ,
                       NPADateSellerBook ,
                       Restructuring ,
                       InitialExtension ,
                       BeyonControlofPromoters ,
                       DelayReasonOther ,
                       FLG_UPG ,
                       FLG_DEG ,
                       DEFAULT_REASON ,
                       ProjCategory ,
                       NPA_DATE ,
                       PUI_ProvPer ,
                       RestructureDate ,
                       ActualDCCO ,
                       ActualDCCO_Date ,
                       UpgradeDate ,
                       FinalAssetClassAlt_Key ,
                       DPD_Max ,
                       EffectiveFromTimeKey ,
                       EffectiveToTimeKey 
                FROM PRO_RBL_MISDB_PROD.PUI_CAL  );
            /* END OF PUI WORK */
            /* LOAN BUYOUT HIST MERGE MERGE */
            MERGE INTO T 
            USING (SELECT T.ROWID row_id, 'E'
            FROM T ,PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal T   ON O.AccountEntityId = T.AccountEntityId
                   AND O.EffectiveToTimeKey = 49999 ) src
            ON ( T.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET T.IsChanged = 'E';
            MERGE INTO T 
            USING (SELECT T.ROWID row_id, 'C'
            FROM T ,PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal T   ON O.AccountEntityId = T.AccountEntityId
                   AND O.EffectiveToTimeKey = 49999 
             WHERE ( NVL(O.DateofData, '1900-01-01') <> NVL(T.DateofData, '1900-01-01')
              OR NVL(O.ReportDate, '1900-01-01') <> NVL(T.ReportDate, '1900-01-01')
              OR NVL(O.SchemeCode, ' ') <> NVL(T.SchemeCode, ' ')
              OR NVL(O.NPA_ClassSeller, ' ') <> NVL(T.NPA_ClassSeller, ' ')
              OR NVL(O.NPA_DateSeller, '1900-01-01') <> NVL(T.NPA_DateSeller, '1900-01-01')
              OR NVL(O.DPD_Seller, 0) <> NVL(T.DPD_Seller, 0)
              OR NVL(O.PeakDPD, 0) <> NVL(T.PeakDPD, 0)
              OR NVL(O.PeakDPD_Date, '1900-01-01') <> NVL(T.PeakDPD_Date, '1900-01-01')
              OR NVL(O.NPA_DueToMainAdv, ' ') <> NVL(T.NPA_DueToMainAdv, ' ')
              OR NVL(O.NPA_EffectedToMainAdv, ' ') <> NVL(T.NPA_EffectedToMainAdv, ' ')
              OR NVL(O.NPA_Flag, ' ') <> NVL(T.NPA_Flag, ' ') )) src
            ON ( T.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET T.IsChanged = 'C';
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, 'U'
            FROM A ,PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal A
                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal_Hist B   ON B.AccountEntityId = A.AccountEntityId 
             WHERE B.EffectiveFromTimeKey = v_TimeKey
              AND A.IsChanged = 'C') src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.IsChanged = 'U';
            ----------For Changes Records
            MERGE INTO b 
            USING (SELECT b.ROWID row_id, v_VEFFECTIVETO
            FROM b ,PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal A
                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal_Hist B   ON B.AccountEntityId = A.AccountEntityId
                   AND B.EffectiveToTimeKey = 49999 
             WHERE B.EffectiveFromTimeKey < v_TimeKey
              AND A.IsChanged = 'C') src
            ON ( b.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET b.EffectiveToTimeKey = v_VEFFECTIVETO;
            MERGE INTO O 
            USING (SELECT O.ROWID row_id, T.DateofData, T.ReportDate, T.SchemeCode, T.NPA_ClassSeller, T.NPA_DateSeller, T.DPD_Seller, T.PeakDPD, T.PeakDPD_Date, T.NPA_DueToMainAdv, T.NPA_EffectedToMainAdv, T.NPA_Flag
            FROM O ,PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal_Hist O
                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal T   ON O.AccountEntityId = T.AccountEntityId 
             WHERE O.EffectiveFromTimeKey = v_TimeKey
              AND T.IsChanged = 'U') src
            ON ( O.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET O.DateofData = src.DateofData,
                                         O.ReportDate = src.ReportDate,
                                         O.SchemeCode = src.SchemeCode,
                                         O.NPA_ClassSeller = src.NPA_ClassSeller,
                                         O.NPA_DateSeller = src.NPA_DateSeller,
                                         O.DPD_Seller = src.DPD_Seller,
                                         O.PeakDPD = src.PeakDPD,
                                         O.PeakDPD_Date = src.PeakDPD_Date,
                                         O.NPA_DueToMainAdv = src.NPA_DueToMainAdv,
                                         O.NPA_EffectedToMainAdv = src.NPA_EffectedToMainAdv,
                                         O.NPA_Flag = src.NPA_Flag;
            ----------------------------------------------------------------------------------------------------------------------------------------------
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_VEFFECTIVETO
            FROM AA ,PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal_Hist AA 
             WHERE AA.EffectiveToTimeKey = 49999
              AND NOT EXISTS ( SELECT 1 
                               FROM PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal BB
                                WHERE  AA.AccountEntityId = BB.AccountEntityId )) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_VEFFECTIVETO;
            /***************************************************************************************************************/
            INSERT INTO PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal_Hist
              ( DateofData, ReportDate, CustomerAcID, AccountEntityId, SchemeCode, NPA_ClassSeller, NPA_DateSeller, DPD_Seller, PeakDPD, PeakDPD_Date, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, NPA_DueToMainAdv, NPA_EffectedToMainAdv, NPA_Flag )
              ( SELECT DateofData ,
                       ReportDate ,
                       CustomerAcID ,
                       AccountEntityId ,
                       SchemeCode ,
                       NPA_ClassSeller ,
                       NPA_DateSeller ,
                       DPD_Seller ,
                       PeakDPD ,
                       PeakDPD_Date ,
                       AuthorisationStatus ,
                       EffectiveFromTimeKey ,
                       49999 EffectiveToTimeKey  ,
                       NPA_DueToMainAdv ,
                       NPA_EffectedToMainAdv ,
                       NPA_Flag 
                FROM PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal T
                 WHERE  NVL(T.IsChanged, 'N') IN ( 'C','N' )
               );
            /* END OF LOAN BUYOUT HIST MERGE MERGE */
            -----------------------------------------Added by prashant-------01-11-2022---DPD STORED IN HIST TABLE-----------------------------------------------
            DELETE PRO_RBL_MISDB_PROD.Accountcal_hist_DPD

             WHERE  TimeKey = v_TIMEKEY;
            INSERT INTO PRO_RBL_MISDB_PROD.Accountcal_hist_DPD
              ( AccountEntityid, TimeKey, DPD_IntService, DPD_NoCredit, DPD_Overdrawn, DPD_Overdue, DPD_Renewal, DPD_StockStmt, DPD_MAX, DPD_SMA, DPD_PrincOverdue, DPD_IntOverdueSince, DPD_OtherOverdueSince )
              ( SELECT AccountEntityid ,
                       EffectiveFromTimeKey ,
                       DPD_IntService ,
                       DPD_NoCredit ,
                       DPD_Overdrawn ,
                       DPD_Overdue ,
                       DPD_Renewal ,
                       DPD_StockStmt ,
                       DPD_MAX ,
                       DPD_SMA ,
                       DPD_PrincOverdue ,
                       DPD_IntOverdueSince ,
                       DPD_OtherOverdueSince 
                FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
                 WHERE  DPD_Max > 0 );
            --Added By Mandeep For CoBorrower History insert 20-08-2023 --------------------------------
            BEGIN
               SELECT 1 INTO v_temp
                 FROM DUAL
                WHERE EXISTS ( SELECT 1 
                               FROM PRO_RBL_MISDB_PROD.CoBorrowerCal_Hist 
                                WHERE  TIMEKEY = v_TIMEKEY );
            EXCEPTION
               WHEN OTHERS THEN
                  NULL;
            END;

            IF v_temp = 1 THEN

            BEGIN
               DELETE PRO_RBL_MISDB_PROD.CoBorrowerCal_Hist

                WHERE  TIMEKEY = v_TIMEKEY;

            END;
            END IF;
            INSERT INTO PRO_RBL_MISDB_PROD.CoBorrowerCal_Hist
              ( SELECT * 
                FROM PRO_RBL_MISDB_PROD.CoBorrowerCal  );
            ------------------------------------------------------------------------------------------------------
            UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
               SET COMPLETED = 'Y',
                   ERRORDATE = NULL,
                   ERRORDESCRIPTION = NULL,
                   COUNT = NVL(COUNT, 0) + 1
             WHERE  RUNNINGPROCESSNAME = 'InsertDataIntoHistTable';

         END;

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'InsertDataIntoHistTable';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_OPT_21082024" TO "ADF_CDR_RBL_STGDB";
