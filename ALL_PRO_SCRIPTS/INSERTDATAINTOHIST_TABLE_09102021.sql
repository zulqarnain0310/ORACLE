--------------------------------------------------------
--  DDL for Procedure INSERTDATAINTOHIST_TABLE_09102021
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" 
(
  v_TIMEKEY IN NUMBER
)
AS

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
   --exec [PRO].CustAccountMerge
   UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
      SET COMPLETED = 'Y',
          ERRORDATE = NULL,
          ERRORDESCRIPTION = NULL,
          COUNT = NVL(COUNT, 0) + 1
    WHERE  RUNNINGPROCESSNAME = 'InsertDataIntoHistTable';

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_09102021" TO "ADF_CDR_RBL_STGDB";
