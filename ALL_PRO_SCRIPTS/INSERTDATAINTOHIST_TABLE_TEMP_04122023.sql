--------------------------------------------------------
--  DDL for Procedure INSERTDATAINTOHIST_TABLE_TEMP_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" 
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   DELETE PRO_RBL_MISDB_PROD.CustomerCal_Hist_Before_Opt

    WHERE  EffectiveFromTimeKey = v_TIMEKEY
             AND EffectiveToTimeKey = v_TIMEKEY;
   INSERT INTO PRO_RBL_MISDB_PROD.CustomerCal_Hist_Before_Opt
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
   DELETE PRO_RBL_MISDB_PROD.Accountcal_Hist_Before_Opt

    WHERE  EffectiveFromTimeKey = v_TIMEKEY
             AND EffectiveToTimeKey = v_TIMEKEY;
   INSERT INTO PRO_RBL_MISDB_PROD.Accountcal_Hist_Before_Opt
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
       FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL  );--ALTER TABLE PRO.ACCOUNTCAL DROP COLUMN DPD_IntService 
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
   /* RESTRUCTURE WORK */
   ------------	DELETE PRO.AdvAcRestructureCal_Hist WHERE EffectiveFromTimeKey=@TIMEKEY and EffectiveToTimeKey=@TIMEKEY
   ------------	INSERT INTO PRO.AdvAcRestructureCal_Hist
   ------------		(
   ------------			 AccountEntityId
   ------------			,AssetClassAlt_KeyOnInvocation
   ------------			,PreRestructureAssetClassAlt_Key
   ------------			,PreRestructureNPA_Date
   ------------			,ProvPerOnRestrucure
   ------------			,RestructureTypeAlt_Key
   ------------			,COVID_OTR_CatgAlt_Key
   ------------			,RestructureDt
   ------------			,SP_ExpiryDate
   ------------			,DPD_AsOnRestructure
   ------------			,RestructureFailureDate
   ------------			,DPD_Breach_Date
   ------------			,ZeroDPD_Date
   ------------			,SP_ExpiryExtendedDate
   ------------			,CurrentPOS
   ------------			,CurrentTOS
   ------------			,RestructurePOS
   ------------			,Res_POS_to_CurrentPOS_Per
   ------------			,CurrentDPD
   ------------			,TotalDPD
   ------------			,VDPD
   ------------			,AddlProvPer
   ------------			,ProvReleasePer
   ------------			,AppliedNormalProvPer
   ------------			,FinalProvPer
   ------------			,PreDegProvPer
   ------------			,UpgradeDate
   ------------			,SurvPeriodEndDate
   ------------			--------,DegDurSP_PeriodProvPer
   ------------			,NonFinDPD
   ------------			,InitialAssetClassAlt_Key
   ------------			,FinalAssetClassAlt_Key
   ------------			,RestructureProvision
   ------------			,SecuredProvision
   ------------			,UnSecuredProvision
   ------------			,FlgDeg
   ------------			,FlgUpg
   ------------			,DegDate
   ------------			,RC_Pending
   ------------			,FinalNpaDt
   ------------			,RestructureStage
   ------------			,EffectiveFromTimeKey
   ------------			,EffectiveToTimeKey
   ------------			,FlgMorat
   ------------			,InvestmentGrade
   ------------			,POS_10PerPaidDate
   ------------			,RestructureFacilityTypeAlt_Key
   ------------		)
   ------------	SELECT
   ------------			 AccountEntityId
   ------------			,AssetClassAlt_KeyOnInvocation
   ------------			,PreRestructureAssetClassAlt_Key
   ------------			,PreRestructureNPA_Date
   ------------			,ProvPerOnRestrucure
   ------------			,RestructureTypeAlt_Key
   ------------			,COVID_OTR_CatgAlt_Key
   ------------			,RestructureDt
   ------------			,SP_ExpiryDate
   ------------			,DPD_AsOnRestructure
   ------------			,RestructureFailureDate
   ------------			,DPD_Breach_Date
   ------------			,ZeroDPD_Date
   ------------			,SP_ExpiryExtendedDate
   ------------			,CurrentPOS
   ------------			,CurrentTOS
   ------------			,RestructurePOS
   ------------			,Res_POS_to_CurrentPOS_Per
   ------------			,CurrentDPD
   ------------			,TotalDPD
   ------------			,VDPD
   ------------			,AddlProvPer
   ------------			,ProvReleasePer
   ------------			,AppliedNormalProvPer
   ------------			,FinalProvPer
   ------------			,PreDegProvPer
   ------------			,UpgradeDate
   ------------			,SurvPeriodEndDate
   ------------			--------,DegDurSP_PeriodProvPer
   ------------			,NonFinDPD
   ------------			,InitialAssetClassAlt_Key
   ------------			,FinalAssetClassAlt_Key
   ------------			,RestructureProvision
   ------------			,SecuredProvision
   ------------			,UnSecuredProvision
   ------------			,FlgDeg
   ------------			,FlgUpg
   ------------			,DegDate
   ------------			,RC_Pending
   ------------			,FinalNpaDt
   ------------			,RestructureStage
   ------------			,EffectiveFromTimeKey
   ------------			,EffectiveToTimeKey
   ------------			,FlgMorat
   ------------			,InvestmentGrade
   ------------			,POS_10PerPaidDate
   ------------			,RestructureFacilityTypeAlt_Key
   ------------	FROM PRO.AdvAcRestructureCal
   ------------	/* RESTRUCTURE DETAIL	*/
   ------------	drop table if exists #AdvAcRestructureDetail
   ------------	DECLARE @Procdate DATE=(SELECT DATE FROM SysDayMatrix WHERE TIMEKEY=@TIMEKEY)
   ------------	SELECT * ,'' IsChanged INTO #AdvAcRestructureDetail 
   ------------	FROM AdvAcRestructureDetail 
   ------------		WHERE EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY
   ------------	DECLARE @PrevTimeKey INT =(SELECT MAX(EffectiveFromTimeKey) FROM PRO.AdvAcRestructureCal_Hist WHERE EffectiveFromTimeKey <@TIMEKEY)
   ------------		UPDATE A
   ------------			SET A.PreDegProvPer=ISNULL(B.AppliedNormalProvPer,0)+ISNULL(B.FinalProvPer,0)
   ------------			FROM #AdvAcRestructureDetail A
   ------------		INNER JOIN PRO.AdvAcRestructureCal_Hist B
   ------------			ON A.AccountEntityId=B.AccountEntityID	
   ------------			AND (B.EffectiveFromTimeKey<=@PrevTimeKey AND B.EffectiveToTimeKey>=@PrevTimeKey)
   ------------		INNER JOIN PRO.AdvAcRestructureCal C
   ------------			ON A.AccountEntityId=C.AccountEntityID	
   ------------			AND C.InitialAssetClassAlt_Key =1 AND C.FinalAssetClassAlt_Key >1
   ------------	/* 1- UPDATE DPD_30_90_Breach_Date IN RESTRCTURE CAL - IF ACCOUNT IS NPA AND DPD >90,   UPDATE ZERO_DPD_DATE =NULL, SP_ExpiryExtendedDate = NULL */ 
   ------------	UPDATE a 
   ------------		SET  DPD_Breach_Date=b.DPD_Breach_Date
   ------------			,ZeroDPD_Date=b.ZeroDPD_Date
   ------------			,SP_ExpiryExtendedDate =b.SP_ExpiryExtendedDate 
   ------------			,A.RestructureStage=B.RestructureStage
   ------------			,A.POS_10PerPaidDate=b.POS_10PerPaidDate
   ------------			,A.SurvPeriodEndDate=b.SurvPeriodEndDate
   ------------			,A.UpgradeDate=b.UpgradeDate
   ------------	from #AdvAcRestructureDetail a
   ------------		inner join pro.AdvAcRestructureCal b
   ------------			on a.AccountEntityId =b.AccountEntityID
   ------------	/* MERGE DATA IN ADVACRESTRUCTURE DETAIL-IN CASE OF EFFECTIVEFROMTIKE IS LESS THAN @TIMEKEY*/
   ------------	UPDATE O SET O.EffectiveToTimeKey=@TIMEKEY-1,
   ------------		 O.DateModified=CONVERT(DATE,GETDATE(),103),
   ------------		 O.ModifiedBy='ACL-PROCESS'
   ------------	FROM CURDAT.AdvAcRestructureDetail AS O
   ------------		INNER JOIN #AdvAcRestructureDetail AS T
   ------------			ON O.AccountEntityID=T.AccountEntityID
   ------------			AND O.EffectiveToTimeKey=49999
   ------------			AND T.EffectiveToTimeKey=49999
   ------------			AND O.EffectiveFromTimeKey <@TIMEKEY
   ------------		WHERE 
   ------------		(  
   ------------		   		 ISNULL(O.RestructureStage,'1990-01-01')			<> ISNULL(T.RestructureStage,'1990-01-01')
   ------------				OR ISNULL(O.ZeroDPD_Date,'1990-01-01')				<> ISNULL(T.ZeroDPD_Date,'1990-01-01')
   ------------				OR ISNULL(O.SP_ExpiryExtendedDate,'1990-01-01')		<> ISNULL(T.SP_ExpiryExtendedDate,'1990-01-01')
   ------------				OR ISNULL(O.DPD_Breach_Date,'1990-01-01')			<> ISNULL(T.DPD_Breach_Date,'1990-01-01')
   ------------				OR ISNULL(O.UpgradeDate,'1990-01-01')				<> ISNULL(T.UpgradeDate,'1990-01-01')
   ------------				OR ISNULL(O.POS_10PerPaidDate,'1990-01-01')			<> ISNULL(T.POS_10PerPaidDate,'1990-01-01')
   ------------				OR ISNULL(O.SurvPeriodEndDate,'1990-01-01')			<> ISNULL(T.SurvPeriodEndDate,'1990-01-01')
   ------------				OR ISNULL(O.RestructureStage,'')					<> ISNULL(T.RestructureStage,'')
   ------------				OR ISNULL(O.PreDegProvPer,0)						<> ISNULL(T.PreDegProvPer,0)				
   ------------		)
   ------------		/* UPODATE DATA FOR SAME TIMEKEY */
   ------------		UPDATE A
   ------------			SET A.RestructureStage =B.RestructureStage
   ------------				,A.ZeroDPD_Date=B.ZeroDPD_Date
   ------------				,A.SP_ExpiryExtendedDate=B.SP_ExpiryExtendedDate
   ------------				,A.DPD_Breach_Date=B.DPD_Breach_Date
   ------------				,A.UpgradeDate=B.UpgradeDate
   ------------				,A.SurvPeriodEndDate=B.SurvPeriodEndDate
   ------------				,A.POS_10PerPaidDate=B.POS_10PerPaidDate
   ------------				,A.PreDegProvPer=B.PreDegProvPer
   ------------		FROM  CURDAT.AdvAcRestructureDetail A
   ------------			INNER JOIN #AdvAcRestructureDetail B
   ------------				ON A.AccountEntityId =B.AccountEntityId
   ------------				AND A.EffectiveFromTimeKey<=@TIMEKEY AND A.EffectiveToTimeKey>=@TIMEKEY
   ------------				AND A.EffectiveFromTimeKey=@TIMEKEY
   ------------		----------For Changes Records
   ------------		UPDATE A SET A.IsChanged='C'
   ------------		----Select * 
   ------------		from #AdvAcRestructureDetail A
   ------------		INNER JOIN CurDat.AdvAcRestructureDetail B 
   ------------		ON B.AccountEntityId=A.AccountEntityId 
   ------------		Where B.EffectiveToTimeKey= @TIMEKEY -1
   ------------			AND B.ModifiedBy='ACL-PROCESS'
   ------------		/***************************************************************************************************************/
   ------------		INSERT INTO CurDat.AdvAcRestructureDetail
   ------------			(
   ------------				 AccountEntityId
   ------------				,RestructureTypeAlt_Key
   ------------				,RestructureProposalDt
   ------------				,RestructureDt
   ------------				,RestructureAmt
   ------------				,RestructureApprovalDt
   ------------				,RestructureSequenceRefNo
   ------------				,DiminutionAmount
   ------------				,RestructureByAlt_Key
   ------------				,RefCustomerId
   ------------				,RefSystemAcId
   ------------				,SDR_INVOKED
   ------------				,SDR_REFER_DATE
   ------------				,Remark
   ------------				,RestructureFacilityTypeAlt_Key
   ------------				,BankingRelationTypeAlt_Key
   ------------				,InvocationDate
   ------------				,AssetClassAlt_KeyOnInvocation
   ------------				,EquityConversionYN
   ------------				,ConversionDate
   ------------				,PrincRepayStartDate
   ------------				,InttRepayStartDate
   ------------				,PreRestructureAssetClassAlt_Key
   ------------				,PreRestructureNPA_Date
   ------------				,ProvPerOnRestrucure
   ------------				,COVID_OTR_CatgAlt_Key
   ------------				,RestructureApprovingAuthority
   ------------				,RestructreTOS
   ------------				,UnserviceInttAsOnRestructure
   ------------				,RestructurePOS
   ------------				,RestructureStage
   ------------				,RestructureStatus
   ------------				,DPD_AsOnRestructure
   ------------				,DPD_Breach_Date
   ------------				,ZeroDPD_Date
   ------------				,SurvPeriodEndDate
   ------------				,AuthorisationStatus
   ------------				,EffectiveFromTimeKey
   ------------				,EffectiveToTimeKey
   ------------				,CreatedBy
   ------------				,DateCreated
   ------------				,ModifiedBy
   ------------				,DateModified
   ------------				,ApprovedBy
   ------------				,DateApproved
   ------------				,RestructureFailureDate
   ------------				,UpgradeDate
   ------------				,PreDegProvPer
   ------------				,SP_ExpiryExtendedDate
   ------------				,FlgMorat
   ------------				,InvestmentGrade
   ------------				,POS_10PerPaidDate
   ------------			)
   ------------		SELECT  
   ------------			AccountEntityId
   ------------			,RestructureTypeAlt_Key
   ------------			,RestructureProposalDt
   ------------			,RestructureDt
   ------------			,RestructureAmt
   ------------			,RestructureApprovalDt
   ------------			,RestructureSequenceRefNo
   ------------			,DiminutionAmount
   ------------			,RestructureByAlt_Key
   ------------			,RefCustomerId
   ------------			,RefSystemAcId
   ------------			,SDR_INVOKED
   ------------			,SDR_REFER_DATE
   ------------			,Remark
   ------------			,RestructureFacilityTypeAlt_Key
   ------------			,BankingRelationTypeAlt_Key
   ------------			,InvocationDate
   ------------			,AssetClassAlt_KeyOnInvocation
   ------------			,EquityConversionYN
   ------------			,ConversionDate
   ------------			,PrincRepayStartDate
   ------------			,InttRepayStartDate
   ------------			,PreRestructureAssetClassAlt_Key
   ------------			,PreRestructureNPA_Date
   ------------			,ProvPerOnRestrucure
   ------------			,COVID_OTR_CatgAlt_Key
   ------------			,RestructureApprovingAuthority
   ------------			,RestructreTOS
   ------------			,UnserviceInttAsOnRestructure
   ------------			,RestructurePOS
   ------------			,RestructureStage
   ------------			,RestructureStatus
   ------------			,DPD_AsOnRestructure
   ------------			,DPD_Breach_Date
   ------------			,ZeroDPD_Date
   ------------			,SurvPeriodEndDate
   ------------			,AuthorisationStatus
   ------------			,@TIMEKEY EffectiveFromTimeKey
   ------------			,49999 EffectiveToTimeKey
   ------------			,CreatedBy
   ------------			,DateCreated
   ------------			,'ACL-PROCESS' ModifiedBy
   ------------			,GETDATE()    DateModified
   ------------			,ApprovedBy
   ------------			,DateApproved
   ------------			,RestructureFailureDate
   ------------			,UpgradeDate
   ------------			,PreDegProvPer
   ------------			,SP_ExpiryExtendedDate
   ------------			,FlgMorat
   ------------			,InvestmentGrade
   ------------			,POS_10PerPaidDate
   ------------		FROM #AdvAcRestructureDetail T Where ISNULL(T.IsChanged,'U') ='C'
   ------------/* END OF RESTR */

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAINTOHIST_TABLE_TEMP_04122023" TO "ADF_CDR_RBL_STGDB";
