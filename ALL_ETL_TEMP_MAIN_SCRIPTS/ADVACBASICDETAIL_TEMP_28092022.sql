--------------------------------------------------------
--  DDL for Procedure ADVACBASICDETAIL_TEMP_28092022
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" 
-- =============================================
 -- Author:		<Author,,Name>
 -- Create date: <Create Date,,>
 -- Description:	<Description,,>
 -- =============================================

AS
   --GO
   /*********************************************************************************************************/
   /*  New Customers Account Entity ID Update  */
   v_AccountEntityId NUMBER(10,0) := 0;

BEGIN

   DECLARE
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      -- Insert statements for procedure here
      v_vEffectivefrom NUMBER(10,0);
      v_TimeKey NUMBER(10,0);
      v_DATE VARCHAR2(200) := ( SELECT Date_ 
        FROM RBL_MISDB.Automate_Advances 
       WHERE  EXT_FLG = 'Y' );
   -- Add the parameters for the stored procedure here

   BEGIN
      SELECT TimeKey 

        INTO v_vEffectiveFrom
        FROM RBL_MISDB.Automate_Advances 
       WHERE  EXT_FLG = 'Y';
      SELECT TimeKey 

        INTO v_TimeKey
        FROM RBL_MISDB.Automate_Advances 
       WHERE  EXT_FLG = 'Y';
      --------------------------------------------------------------------------------------------------------------------------------------------------- 
      EXECUTE IMMEDIATE ' TRUNCATE TABLE TempAdvAcBasicDetail ';
      INSERT INTO TempAdvAcBasicDetail
        ( BranchCode, AccountEntityId, CustomerEntityId, SystemACID, CustomerACID, GLAlt_Key, ProductAlt_Key, GLProductAlt_Key, FacilityType, SectorAlt_Key, SubSectorAlt_Key, ActivityAlt_Key, IndustryAlt_Key, SchemeAlt_Key, DistrictAlt_Key, AreaAlt_Key, VillageAlt_Key, StateAlt_Key, CurrencyAlt_Key, OriginalSanctionAuthAlt_Key, OriginalLimitRefNo, OriginalLimit, OriginalLimitDt, DtofFirstDisb, FlagReliefWavier, UnderLineActivityAlt_Key, MicroCredit, segmentcode, ScrCrError, AdjDt, AdjReasonAlt_Key, MarginType, Pref_InttRate, CurrentLimitRefNo, GuaranteeCoverAlt_Key, AccountName, AssetClass, JointAccount, LastDisbDt, ScrCrErrorBackup, AccountOpenDate, Ac_LADDt, Ac_DocumentDt, CurrentLimit, InttTypeAlt_Key, InttRateLoadFactor, Margin, CurrentLimitDt, Ac_DueDt, DrawingPowerAlt_Key, RefCustomerId, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, D2Ktimestamp, MocStatus, MocDate, MocTypeAlt_Key, IsLAD, FincaleBasedIndustryAlt_key, AcCategoryAlt_Key, OriginalSanctionAuthLevelAlt_Key, AcTypeAlt_Key, ScrCrErrorSeq, BSRUNID, AdditionalProv, AclattestDevelopment, SourceAlt_Key, LoanSeries, LoanRefNo, SecuritizationCode, Full_Disb, OriginalBranchcode, ProjectCost, FlgSecured )
        ( 
          -------------    FINACLE  ---------
          SELECT A.BranchCode ,
                 0 AccountEntityId  ,
                 0 CustomerEntityId  ,
                 A.CustomerACID SystemACID  ,
                 A.CustomerACID CustomerACID  ,
                 B.GLAlt_Key ,
                 C.ProductAlt_Key ,
                 NULL GLProductAlt_Key  ,
                 C.FacilityType FacilityType  ,
                 NULL SectorAlt_Key  ,
                 E.SubSectorAlt_Key ,
                 D.ActivityAlt_Key ,
                 F.IndustryAlt_Key ,
                 NULL SchemeAlt_Key  ,
                 NULL DistrictAlt_Key  ,
                 NULL AreaAlt_Key  ,
                 NULL VillageAlt_Key  ,
                 NULL StateAlt_Key  ,
                 G.CurrencyAlt_Key ,
                 NULL OriginalSanctionAuthAlt_Key  ,
                 NULL OriginalLimitRefNo  ,
                 NULL OriginalLimit  ,
                 NULL OriginalLimitDt  ,
                 NULL DtofFirstDisb  ,
                 NULL FlagReliefWavier  ,
                 NULL UnderLineActivityAlt_Key  ,
                 NULL MicroCredit  ,
                 AcSegmentCode segmentcode  ,
                 NULL ScrCrError  ,
                 NULL AdjDt  ,
                 NULL AdjReasonAlt_Key  ,
                 NULL MarginType  ,
                 NULL Pref_InttRate  ,
                 NULL CurrentLimitRefNo  ,
                 NULL GuaranteeCoverAlt_Key  ,
                 NULL AccountName  ,
                 NULL AssetClass  ,
                 NULL JointAccount  ,
                 NULL LastDisbDt  ,
                 NULL ScrCrErrorBackup  ,
                 A.AcOpenDt AccountOpenDate  ,
                 NULL Ac_LADDt  ,
                 NULL Ac_DocumentDt  ,
                 A.CurrentLimit CurrentLimit  ,
                 NULL InttTypeAlt_Key  ,
                 NULL InttRateLoadFactor  ,
                 NULL Margin  ,
                 NULL CurrentLimitDt  ,
                 NULL Ac_DueDt  ,
                 NULL DrawingPowerAlt_Key  ,
                 A.CustomerID RefCustomerId  ,
                 NULL AuthorisationStatus  ,
                 v_vEffectivefrom EffectiveFromTimeKey  ,
                 49999 EffectiveToTimeKey  ,
                 'SSISUSER' CreatedBy  ,
                 SYSDATE DateCreated  ,
                 NULL ModifiedBy  ,
                 NULL DateModified  ,
                 NULL ApprovedBy  ,
                 NULL DateApproved  ,
                 NULL D2Ktimestamp  ,
                 NULL MocStatus  ,
                 NULL MocDate  ,
                 NULL MocTypeAlt_Key  ,
                 CASE 
                      WHEN C.ProductGroup = 'FDSEC' THEN 1
                 ELSE NULL
                    END IsLAD  ,
                 NULL FincaleBasedIndustryAlt_key  ,
                 NULL AcCategoryAlt_Key  ,
                 NULL OriginalSanctionAuthLevelAlt_Key  ,
                 NULL AcTypeAlt_Key  ,
                 NULL ScrCrErrorSeq  ,
                 NULL BSRUNID  ,
                 NULL AdditionalProv  ,
                 NULL AclattestDevelopment  ,
                 S.SourceAlt_Key SourceAlt_Key  ,
                 NULL LoanSeries  ,
                 NULL LoanRefNo  ,
                 NULL SecuritizationCode  ,
                 NULL Full_Disb  ,
                 NULL OriginalBranchcode  ,
                 NULL ProjectCost  ,
                 SecuredStatus 
          FROM RBL_STGDB.ACCOUNT_ALL_SOURCE_SYSTEM A
                 LEFT JOIN RBL_MISDB.DimGL B   ON A.GLCode = B.GLCode
                 AND B.EffectiveFromTimeKey <= v_TimeKey
                 AND B.EffectiveToTimeKey >= v_TimeKey
                 LEFT JOIN RBL_MISDB.DimProduct C   ON C.ProductCode = A.Scheme_ProductCode
                 AND C.EffectiveFromTimeKey <= v_TimeKey
                 AND C.EffectiveToTimeKey >= v_TimeKey
                 LEFT JOIN RBL_MISDB.DimActivity D   ON D.SrcSysActivityCode = A.PurposeofAdvance
                 AND D.EffectiveFromTimeKey <= v_TimeKey
                 AND D.EffectiveToTimeKey >= v_TimeKey
                 LEFT JOIN RBL_MISDB.DimSubSector E   ON E.SubSectorName = A.Sector
                 AND E.EffectiveFromTimeKey <= v_TimeKey
                 AND E.EffectiveToTimeKey >= v_TimeKey
                 LEFT JOIN RBL_MISDB.DimIndustry F   ON F.SrcSysIndustryCode = A.IndustryCode
                 AND F.EffectiveFromTimeKey <= v_TimeKey
                 AND F.EffectiveToTimeKey >= v_TimeKey
                 LEFT JOIN RBL_MISDB.DimCurrency G   ON G.SrcSysCurrencyCode = A.CurrencyCode
                 AND G.EffectiveFromTimeKey <= v_TimeKey
                 AND G.EffectiveToTimeKey >= v_TimeKey
                 LEFT JOIN RBL_MISDB.DIMSOURCEDB S   ON S.SourceName = A.SourceSystem
                 AND S.EffectiveFromTimeKey <= v_TimeKey
                 AND S.EffectiveToTimeKey >= v_TimeKey );

   END;
   /*
   	UNION
   	----------------------  INDUS-------
   	SELECT   A.BranchCode
   			,0 AccountEntityId
   			,0 CustomerEntityId
   			,A.CustomerACID SystemACID
   			,A.CustomerACID CustomerACID
   			,B.GLAlt_Key
   			,C.ProductAlt_Key
   			,NULL GLProductAlt_Key
   			,C.FacilityType FacilityType
   			,NULL SectorAlt_Key
   			,E.SubSectorAlt_Key
   			,D.ActivityAlt_Key
   			,F.IndustryAlt_Key
   			,NULL SchemeAlt_Key
   			,NULL DistrictAlt_Key
   			,NULL AreaAlt_Key
   			,NULL VillageAlt_Key
   			,NULL StateAlt_Key
   			,G.CurrencyAlt_Key
   			,NULL OriginalSanctionAuthAlt_Key
   			,NULL OriginalLimitRefNo
   			,NULL OriginalLimit
   			,NULL OriginalLimitDt
   			,NULL DtofFirstDisb
   			,NULL FlagReliefWavier
   			,NULL UnderLineActivityAlt_Key
   			,NULL MicroCredit
   			,NULL segmentcode
   			,NULL ScrCrError
   			,NULL AdjDt
   			,NULL AdjReasonAlt_Key
   			,NULL MarginType
   			,NULL Pref_InttRate
   			,NULL CurrentLimitRefNo
   			,NULL GuaranteeCoverAlt_Key
   			,NULL AccountName
   			,NULL AssetClass
   			,NULL JointAccount
   			,NULL LastDisbDt
   			,NULL ScrCrErrorBackup
   			,A.[AcOpenDt] AccountOpenDate
   			,NULL Ac_LADDt
   			,NULL Ac_DocumentDt
   			,A.[CurrentLimit] CurrentLimit
   			,NULL InttTypeAlt_Key
   			,NULL InttRateLoadFactor
   			,NULL Margin
   			,NULL CurrentLimitDt
   			,NULL Ac_DueDt
   			,NULL DrawingPowerAlt_Key
   			,A.CustomerID RefCustomerId
   			,NULL AuthorisationStatus
   			,@vEffectivefrom EffectiveFromTimeKey
   			,49999 EffectiveToTimeKey
   			,'SSISUSER' CreatedBy
   			,GETDATE() DateCreated
   			,NULL ModifiedBy
   			,NULL DateModified
   			,NULL ApprovedBy
   			,NULL DateApproved
   			,NULL D2Ktimestamp
   			,NULL MocStatus
   			,NULL MocDate
   			,NULL MocTypeAlt_Key
   			,NULL IsLAD
   			,NULL FincaleBasedIndustryAlt_key
   			,NULL AcCategoryAlt_Key
   			,NULL OriginalSanctionAuthLevelAlt_Key
   			,NULL AcTypeAlt_Key
   			,NULL ScrCrErrorSeq
   			,NULL BSRUNID
   			,NULL AdditionalProv
   			,NULL AclattestDevelopment
   			,S.SourceAlt_Key SourceAlt_Key
   			,NULL LoanSeries
   			,NULL LoanRefNo
   			,NULL SecuritizationCode
   			,NULL Full_Disb
   			,NULL OriginalBranchcode
   			,NULL ProjectCost
   	FROM			RBL_STGDB.[dbo].[ACCOUNT_SOURCESYSTEM02_STG] A
   	LEFT JOIN		RBL_MISDB.[dbo].[DimGL] B ON A.GLCode=B.GLCode
   					AND B.EffectiveFromTimeKey<=@TimeKey AND B.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimProduct] C ON C.ProductCode=A.Scheme_ProductCode
   					AND C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimActivity] D ON D.SrcSysActivityCode=A.[PurposeofAdvance]
   					AND D.EffectiveFromTimeKey<=@TimeKey AND D.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimSubSector] E ON E.SubSectorName=A.[Sector]
   					AND E.EffectiveFromTimeKey<=@TimeKey AND E.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimIndustry] F ON F.SrcSysIndustryCode=A.IndustryCode
   					AND F.EffectiveFromTimeKey<=@TimeKey AND F.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimCurrency] G ON G.SrcSysCurrencyCode=A.CurrencyCode
   					AND G.EffectiveFromTimeKey<=@TimeKey AND G.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].DIMSOURCEDB S ON S.SourceName=A.SourceSystem
   					AND S.EffectiveFromTimeKey<=@TimeKey AND S.EffectiveToTimeKey>=@TimeKey

   	UNION
   	----------------------------ECBF------------
   	SELECT   A.BranchCode
   			,0 AccountEntityId
   			,0 CustomerEntityId
   			,A.CustomerACID SystemACID
   			,A.CustomerACID CustomerACID
   			,B.GLAlt_Key
   			,C.ProductAlt_Key
   			,NULL GLProductAlt_Key
   			,C.FacilityType FacilityType
   			,NULL SectorAlt_Key
   			,E.SubSectorAlt_Key
   			,D.ActivityAlt_Key
   			,F.IndustryAlt_Key
   			,NULL SchemeAlt_Key
   			,NULL DistrictAlt_Key
   			,NULL AreaAlt_Key
   			,NULL VillageAlt_Key
   			,NULL StateAlt_Key
   			,G.CurrencyAlt_Key
   			,NULL OriginalSanctionAuthAlt_Key
   			,NULL OriginalLimitRefNo
   			,NULL OriginalLimit
   			,NULL OriginalLimitDt
   			,NULL DtofFirstDisb
   			,NULL FlagReliefWavier
   			,NULL UnderLineActivityAlt_Key
   			,NULL MicroCredit
   			,NULL segmentcode
   			,NULL ScrCrError
   			,NULL AdjDt
   			,NULL AdjReasonAlt_Key
   			,NULL MarginType
   			,NULL Pref_InttRate
   			,NULL CurrentLimitRefNo
   			,NULL GuaranteeCoverAlt_Key
   			,NULL AccountName
   			,NULL AssetClass
   			,NULL JointAccount
   			,NULL LastDisbDt
   			,NULL ScrCrErrorBackup
   			,A.[AcOpenDt] AccountOpenDate
   			,NULL Ac_LADDt
   			,NULL Ac_DocumentDt
   			,A.[CurrentLimit] CurrentLimit
   			,NULL InttTypeAlt_Key
   			,NULL InttRateLoadFactor
   			,NULL Margin
   			,NULL CurrentLimitDt
   			,NULL Ac_DueDt
   			,NULL DrawingPowerAlt_Key
   			,A.CustomerID RefCustomerId
   			,NULL AuthorisationStatus
   			,@vEffectivefrom EffectiveFromTimeKey
   			,49999 EffectiveToTimeKey
   			,'SSISUSER' CreatedBy
   			,GETDATE() DateCreated
   			,NULL ModifiedBy
   			,NULL DateModified
   			,NULL ApprovedBy
   			,NULL DateApproved
   			,NULL D2Ktimestamp
   			,NULL MocStatus
   			,NULL MocDate
   			,NULL MocTypeAlt_Key
   			,NULL IsLAD
   			,NULL FincaleBasedIndustryAlt_key
   			,NULL AcCategoryAlt_Key
   			,NULL OriginalSanctionAuthLevelAlt_Key
   			,NULL AcTypeAlt_Key
   			,NULL ScrCrErrorSeq
   			,NULL BSRUNID
   			,NULL AdditionalProv
   			,NULL AclattestDevelopment
   			,S.SourceAlt_Key SourceAlt_Key
   			,NULL LoanSeries
   			,NULL LoanRefNo
   			,NULL SecuritizationCode
   			,NULL Full_Disb
   			,NULL OriginalBranchcode
   			,NULL ProjectCost
   	FROM			RBL_STGDB.[dbo].[ACCOUNT_SOURCESYSTEM03_STG] A
   	LEFT JOIN		RBL_MISDB.[dbo].[DimGL] B ON A.GLCode=B.GLCode
   					AND B.EffectiveFromTimeKey<=@TimeKey AND B.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimProduct] C ON C.ProductCode=A.Scheme_ProductCode
   					AND C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimActivity] D ON D.SrcSysActivityCode=A.[PurposeofAdvance]
   					AND D.EffectiveFromTimeKey<=@TimeKey AND D.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimSubSector] E ON E.SubSectorName=A.[Sector]
   					AND E.EffectiveFromTimeKey<=@TimeKey AND E.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimIndustry] F ON F.SrcSysIndustryCode=A.IndustryCode
   					AND F.EffectiveFromTimeKey<=@TimeKey AND F.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimCurrency] G ON G.SrcSysCurrencyCode=A.CurrencyCode
   					AND G.EffectiveFromTimeKey<=@TimeKey AND G.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].DIMSOURCEDB S ON S.SourceName=A.SourceSystem
   					AND S.EffectiveFromTimeKey<=@TimeKey AND S.EffectiveToTimeKey>=@TimeKey

   	UNION
   	---------------- MIFIN-----------
   	SELECT   A.BranchCode
   			,0 AccountEntityId
   			,0 CustomerEntityId
   			,A.CustomerACID SystemACID
   			,A.CustomerACID CustomerACID
   			,B.GLAlt_Key
   			,C.ProductAlt_Key
   			,NULL GLProductAlt_Key
   			,C.FacilityType FacilityType
   			,NULL SectorAlt_Key
   			,E.SubSectorAlt_Key
   			,D.ActivityAlt_Key
   			,F.IndustryAlt_Key
   			,NULL SchemeAlt_Key
   			,NULL DistrictAlt_Key
   			,NULL AreaAlt_Key
   			,NULL VillageAlt_Key
   			,NULL StateAlt_Key
   			,G.CurrencyAlt_Key
   			,NULL OriginalSanctionAuthAlt_Key
   			,NULL OriginalLimitRefNo
   			,NULL OriginalLimit
   			,NULL OriginalLimitDt
   			,NULL DtofFirstDisb
   			,NULL FlagReliefWavier
   			,NULL UnderLineActivityAlt_Key
   			,NULL MicroCredit
   			,NULL segmentcode
   			,NULL ScrCrError
   			,NULL AdjDt
   			,NULL AdjReasonAlt_Key
   			,NULL MarginType
   			,NULL Pref_InttRate
   			,NULL CurrentLimitRefNo
   			,NULL GuaranteeCoverAlt_Key
   			,NULL AccountName
   			,NULL AssetClass
   			,NULL JointAccount
   			,NULL LastDisbDt
   			,NULL ScrCrErrorBackup
   			,A.[AcOpenDt] AccountOpenDate
   			,NULL Ac_LADDt
   			,NULL Ac_DocumentDt
   			,A.[CurrentLimit] CurrentLimit
   			,NULL InttTypeAlt_Key
   			,NULL InttRateLoadFactor
   			,NULL Margin
   			,NULL CurrentLimitDt
   			,NULL Ac_DueDt
   			,NULL DrawingPowerAlt_Key
   			,A.CustomerID RefCustomerId
   			,NULL AuthorisationStatus
   			,@vEffectivefrom EffectiveFromTimeKey
   			,49999 EffectiveToTimeKey
   			,'SSISUSER' CreatedBy
   			,GETDATE() DateCreated
   			,NULL ModifiedBy
   			,NULL DateModified
   			,NULL ApprovedBy
   			,NULL DateApproved
   			,NULL D2Ktimestamp
   			,NULL MocStatus
   			,NULL MocDate
   			,NULL MocTypeAlt_Key
   			,NULL IsLAD
   			,NULL FincaleBasedIndustryAlt_key
   			,NULL AcCategoryAlt_Key
   			,NULL OriginalSanctionAuthLevelAlt_Key
   			,NULL AcTypeAlt_Key
   			,NULL ScrCrErrorSeq
   			,NULL BSRUNID
   			,NULL AdditionalProv
   			,NULL AclattestDevelopment
   			,S.SourceAlt_Key SourceAlt_Key
   			,NULL LoanSeries
   			,NULL LoanRefNo
   			,NULL SecuritizationCode
   			,NULL Full_Disb
   			,NULL OriginalBranchcode
   			,NULL ProjectCost
   	FROM			RBL_STGDB.[dbo].[ACCOUNT_SOURCESYSTEM04_STG] A
   	LEFT JOIN		RBL_MISDB.[dbo].[DimGL] B ON A.GLCode=B.GLCode
   					AND B.EffectiveFromTimeKey<=@TimeKey AND B.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimProduct] C ON C.ProductCode=A.Scheme_ProductCode
   					AND C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimActivity] D ON D.SrcSysActivityCode=A.[PurposeofAdvance]
   					AND D.EffectiveFromTimeKey<=@TimeKey AND D.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimSubSector] E ON E.SubSectorName=A.[Sector]
   					AND E.EffectiveFromTimeKey<=@TimeKey AND E.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimIndustry] F ON F.SrcSysIndustryCode=A.IndustryCode
   					AND F.EffectiveFromTimeKey<=@TimeKey AND F.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimCurrency] G ON G.SrcSysCurrencyCode=A.CurrencyCode
   					AND G.EffectiveFromTimeKey<=@TimeKey AND G.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].DIMSOURCEDB S ON S.SourceName=A.SourceSystem
   					AND S.EffectiveFromTimeKey<=@TimeKey AND S.EffectiveToTimeKey>=@TimeKey

   	UNION
   ----------------------   GENSAVA----------------
   	SELECT   A.BranchCode
   			,0 AccountEntityId
   			,0 CustomerEntityId
   			,A.CustomerACID SystemACID
   			,A.CustomerACID CustomerACID
   			,B.GLAlt_Key
   			,C.ProductAlt_Key
   			,NULL GLProductAlt_Key
   			,C.FacilityType FacilityType
   			,NULL SectorAlt_Key
   			,E.SubSectorAlt_Key
   			,D.ActivityAlt_Key
   			,F.IndustryAlt_Key
   			,NULL SchemeAlt_Key
   			,NULL DistrictAlt_Key
   			,NULL AreaAlt_Key
   			,NULL VillageAlt_Key
   			,NULL StateAlt_Key
   			,G.CurrencyAlt_Key
   			,NULL OriginalSanctionAuthAlt_Key
   			,NULL OriginalLimitRefNo
   			,NULL OriginalLimit
   			,NULL OriginalLimitDt
   			,NULL DtofFirstDisb
   			,NULL FlagReliefWavier
   			,NULL UnderLineActivityAlt_Key
   			,NULL MicroCredit
   			,NULL segmentcode
   			,NULL ScrCrError
   			,NULL AdjDt
   			,NULL AdjReasonAlt_Key
   			,NULL MarginType
   			,NULL Pref_InttRate
   			,NULL CurrentLimitRefNo
   			,NULL GuaranteeCoverAlt_Key
   			,NULL AccountName
   			,NULL AssetClass
   			,NULL JointAccount
   			,NULL LastDisbDt
   			,NULL ScrCrErrorBackup
   			,A.[AcOpenDt] AccountOpenDate
   			,NULL Ac_LADDt
   			,NULL Ac_DocumentDt
   			,A.[CurrentLimit] CurrentLimit
   			,NULL InttTypeAlt_Key
   			,NULL InttRateLoadFactor
   			,NULL Margin
   			,NULL CurrentLimitDt
   			,NULL Ac_DueDt
   			,NULL DrawingPowerAlt_Key
   			,A.CustomerID RefCustomerId
   			,NULL AuthorisationStatus
   			,@vEffectivefrom EffectiveFromTimeKey
   			,49999 EffectiveToTimeKey
   			,'SSISUSER' CreatedBy
   			,GETDATE() DateCreated
   			,NULL ModifiedBy
   			,NULL DateModified
   			,NULL ApprovedBy
   			,NULL DateApproved
   			,NULL D2Ktimestamp
   			,NULL MocStatus
   			,NULL MocDate
   			,NULL MocTypeAlt_Key
   			,NULL IsLAD
   			,NULL FincaleBasedIndustryAlt_key
   			,NULL AcCategoryAlt_Key
   			,NULL OriginalSanctionAuthLevelAlt_Key
   			,NULL AcTypeAlt_Key
   			,NULL ScrCrErrorSeq
   			,NULL BSRUNID
   			,NULL AdditionalProv
   			,NULL AclattestDevelopment
   			,S.SourceAlt_Key SourceAlt_Key
   			,NULL LoanSeries
   			,NULL LoanRefNo
   			,NULL SecuritizationCode
   			,NULL Full_Disb
   			,NULL OriginalBranchcode
   			,NULL ProjectCost
   	FROM			RBL_STGDB.[dbo].[ACCOUNT_SOURCESYSTEM05_STG] A
   	LEFT JOIN		RBL_MISDB.[dbo].[DimGL] B ON A.GLCode=B.GLCode
   					AND B.EffectiveFromTimeKey<=@TimeKey AND B.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimProduct] C ON C.ProductCode=A.Scheme_ProductCode
   					AND C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimActivity] D ON D.SrcSysActivityCode=A.[PurposeofAdvance]
   					AND D.EffectiveFromTimeKey<=@TimeKey AND D.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimSubSector] E ON E.SubSectorName=A.[Sector]
   					AND E.EffectiveFromTimeKey<=@TimeKey AND E.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimIndustry] F ON F.SrcSysIndustryCode=A.IndustryCode
   					AND F.EffectiveFromTimeKey<=@TimeKey AND F.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimCurrency] G ON G.SrcSysCurrencyCode=A.CurrencyCode
   					AND G.EffectiveFromTimeKey<=@TimeKey AND G.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].DIMSOURCEDB S ON S.SourceName=A.SourceSystem
   					AND S.EffectiveFromTimeKey<=@TimeKey AND S.EffectiveToTimeKey>=@TimeKey

   	UNION
   -------------- VisionPlus    --------------------
   	SELECT   A.BranchCode
   			,0 AccountEntityId
   			,0 CustomerEntityId
   			,A.CustomerACID SystemACID
   			,A.CustomerACID CustomerACID
   			,B.GLAlt_Key
   			,C.ProductAlt_Key
   			,NULL GLProductAlt_Key
   			,C.FacilityType FacilityType
   			,NULL SectorAlt_Key
   			,E.SubSectorAlt_Key
   			,D.ActivityAlt_Key
   			,F.IndustryAlt_Key
   			,NULL SchemeAlt_Key
   			,NULL DistrictAlt_Key
   			,NULL AreaAlt_Key
   			,NULL VillageAlt_Key
   			,NULL StateAlt_Key
   			,G.CurrencyAlt_Key
   			,NULL OriginalSanctionAuthAlt_Key
   			,NULL OriginalLimitRefNo
   			,NULL OriginalLimit
   			,NULL OriginalLimitDt
   			,NULL DtofFirstDisb
   			,NULL FlagReliefWavier
   			,NULL UnderLineActivityAlt_Key
   			,NULL MicroCredit
   			,NULL segmentcode
   			,NULL ScrCrError
   			,NULL AdjDt
   			,NULL AdjReasonAlt_Key
   			,NULL MarginType
   			,NULL Pref_InttRate
   			,NULL CurrentLimitRefNo
   			,NULL GuaranteeCoverAlt_Key
   			,NULL AccountName
   			,NULL AssetClass
   			,NULL JointAccount
   			,NULL LastDisbDt
   			,NULL ScrCrErrorBackup
   			,A.[AcOpenDt] AccountOpenDate
   			,NULL Ac_LADDt
   			,NULL Ac_DocumentDt
   			,A.[CurrentLimit] CurrentLimit
   			,NULL InttTypeAlt_Key
   			,NULL InttRateLoadFactor
   			,NULL Margin
   			,NULL CurrentLimitDt
   			,NULL Ac_DueDt
   			,NULL DrawingPowerAlt_Key
   			,A.CustomerID RefCustomerId
   			,NULL AuthorisationStatus
   			,@vEffectivefrom EffectiveFromTimeKey
   			,49999 EffectiveToTimeKey
   			,'SSISUSER' CreatedBy
   			,GETDATE() DateCreated
   			,NULL ModifiedBy
   			,NULL DateModified
   			,NULL ApprovedBy
   			,NULL DateApproved
   			,NULL D2Ktimestamp
   			,NULL MocStatus
   			,NULL MocDate
   			,NULL MocTypeAlt_Key
   			,NULL IsLAD
   			,NULL FincaleBasedIndustryAlt_key
   			,NULL AcCategoryAlt_Key
   			,NULL OriginalSanctionAuthLevelAlt_Key
   			,NULL AcTypeAlt_Key
   			,NULL ScrCrErrorSeq
   			,NULL BSRUNID
   			,NULL AdditionalProv
   			,NULL AclattestDevelopment
   			,S.SourceAlt_Key SourceAlt_Key
   			,NULL LoanSeries
   			,NULL LoanRefNo
   			,NULL SecuritizationCode
   			,NULL Full_Disb
   			,NULL OriginalBranchcode
   			,NULL ProjectCost
   	FROM			RBL_STGDB.[dbo].[ACCOUNT_SOURCESYSTEM06_STG] A
   	LEFT JOIN		RBL_MISDB.[dbo].[DimGL] B ON A.GLCode=B.GLCode
   					AND B.EffectiveFromTimeKey<=@TimeKey AND B.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimProduct] C ON C.ProductCode=A.Scheme_ProductCode
   					AND C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimActivity] D ON D.SrcSysActivityCode=A.[PurposeofAdvance]
   					AND D.EffectiveFromTimeKey<=@TimeKey AND D.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimSubSector] E ON E.SubSectorName=A.[Sector]
   					AND E.EffectiveFromTimeKey<=@TimeKey AND E.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimIndustry] F ON F.SrcSysIndustryCode=A.IndustryCode
   					AND F.EffectiveFromTimeKey<=@TimeKey AND F.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].[DimCurrency] G ON G.SrcSysCurrencyCode=A.CurrencyCode
   					AND G.EffectiveFromTimeKey<=@TimeKey AND G.EffectiveToTimeKey>=@TimeKey
   	LEFT JOIN		RBL_MISDB.[dbo].DIMSOURCEDB S ON S.SourceName=A.SourceSystem
   					AND S.EffectiveFromTimeKey<=@TimeKey AND S.EffectiveToTimeKey>=@TimeKey

   */
   ---GO
   /*********************************************************************************************************/
   /*  Existing Customers Account Entity ID Update  */
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, MAIN.AccountEntityId
   FROM TEMP ,RBL_TEMPDB.TempAdvAcBasicDetail TEMP
          JOIN RBL_MISDB.AdvAcBasicDetail MAIN   ON TEMP.CustomerAcId = MAIN.CustomerAcId 
    WHERE MAIN.EffectiveToTimeKey = 49999) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.AccountEntityId = src.AccountEntityId;
   SELECT MAX(AccountEntityId)  

     INTO v_AccountEntityId
     FROM RBL_MISDB.AdvAcBasicDetail ;
   IF v_AccountEntityId IS NULL THEN

   BEGIN
      v_AccountEntityId := 0 ;

   END;
   END IF;
   --;WITH CTE_ENNTID
   --AS
   --(
   TABLE IF  --SQLDEV: NOT RECOGNIZED
   IF tt_CTE_ENNTID  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_CTE_ENNTID;
   UTILS.IDENTITY_RESET('tt_CTE_ENNTID');

   INSERT INTO tt_CTE_ENNTID SELECT CustomerAcId ,
                                    (v_AccountEntityId + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                                          FROM DUAL  )  )) AccountEntityId  
        FROM RBL_TEMPDB.TempAdvAcBasicDetail 
       WHERE  AccountEntityId = 0
                OR AccountEntityId IS NULL;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.AccountEntityId
   FROM TEMP ,RBL_TEMPDB.TempAdvAcBasicDetail TEMP
          JOIN tt_CTE_ENNTID 
        --(SELECT CustomerAcId,(@AccountEntityId + ROW_NUMBER()OVER(ORDER BY (SELECT 1))) AccountEntityId

        --			FROM RBL_TEMPDB.DBO.[TempAdvAcBasicDetail]

        --			WHERE AccountEntityId=0 OR AccountEntityId IS NULL)
        ACCT   ON TEMP.CustomerAcId = ACCT.CustomerAcId ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.AccountEntityId = src.AccountEntityId;
   IF  --SQLDEV: NOT RECOGNIZED
   /********************************************************************************************************/
   IF tt_CTE_ENNTID  --SQLDEV: NOT RECOGNIZED
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'U'
   FROM A ,ETL_TEMP_RBL_TEMPDB.TempAdvAcBasicDetail A
          JOIN CURDAT_UATRestore_RBL_MISDB.AdvAcRestructureDetail B   ON A.AccountEntityId = B.AccountEntityId
          AND B.EffectiveToTimeKey = 49999 
    WHERE B.RestructureFacilityTypeAlt_Key = 3) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET FlgSecured = 'U';/*********************************************************************************************************/
   --/*  Existing Customers Ac Key ID Update  */
   --UPDATE TEMP 
   --SET TEMP.Ac_Key=MAIN.Ac_Key
   --FROM  RBL_TEMPDB.DBO.[TempAdvAcBasicDetail] TEMP
   --INNER JOIN RBL_MISDB.[DBO].[AdvAcBasicDetail] MAIN ON TEMP.CustomerAcId=MAIN.CustomerAcId
   --WHERE MAIN.EffectiveToTimeKey=49999
   ----GO
   --/*********************************************************************************************************/
   --/*  New Customers Ac Key ID Update  */
   --DECLARE @Ac_Key BIGINT=0 
   --SELECT @Ac_Key=MAX(Ac_Key) FROM  RBL_MISDB.[dbo].[AdvAcBasicDetail] 
   --IF @Ac_Key IS NULL  
   --BEGIN
   --SET @Ac_Key=0
   --END
   --UPDATE TEMP 
   --SET TEMP.Ac_Key=ACCT.Ac_Key
   -- FROM RBL_TEMPDB.DBO.[TempAdvAcBasicDetail] TEMP
   --INNER JOIN (SELECT CustomerAcId,(@Ac_Key + ROW_NUMBER()OVER(ORDER BY (SELECT 1))) Ac_Key
   --			FROM RBL_TEMPDB.DBO.[TempAdvAcBasicDetail]
   --			WHERE Ac_Key=0 OR Ac_Key IS NULL)ACCT ON TEMP.CustomerAcId=ACCT.CustomerAcId
   --GO

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBASICDETAIL_TEMP_28092022" TO "ADF_CDR_RBL_STGDB";
