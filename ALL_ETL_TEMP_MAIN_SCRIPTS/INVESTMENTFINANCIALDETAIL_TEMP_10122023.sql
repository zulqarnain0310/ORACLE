--------------------------------------------------------
--  DDL for Procedure INVESTMENTFINANCIALDETAIL_TEMP_10122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" 
-- =============================================
 -- Author:		<Author,,Name>
 -- Create date: <Create Date,,>
 -- Description:	<Description,,>
 -- =============================================

AS
   -- SET NOCOUNT ON added to prevent extra result sets from
   -- interfering with SELECT statements.
   -- Insert statements for procedure here
   v_vEffectivefrom NUMBER(10,0);
   v_TimeKey NUMBER(10,0);
   v_DATE VARCHAR2(200) := ( SELECT Date_ 
     FROM RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
   v_VEFFECTIVETO NUMBER(10,0);
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
   SELECT TIMEKEY - 1 

     INTO v_VEFFECTIVETO
     FROM RBL_MISDB.AUTOMATE_ADVANCES 
    WHERE  EXT_FLG = 'Y';
   EXECUTE IMMEDIATE ' TRUNCATE TABLE TempInvestmentFinancialDetail ';
   INSERT INTO TempInvestmentFinancialDetail
     ( Time_Key, InvEntityId, RefIssuerID, RefInvID, HoldingNature, CurrencyAlt_Key, CurrencyConvRate, BookType, BookValue, BookValueINR, MTMValue, MTMValueINR, EncumberedMTM, AssetClass_AltKey, NPIDt, TotalProvison, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, Interest_DividendDueDate, Interest_DividendDueAmount, LatestBSDate, PartialRedumptionDueDate, PartialRedumptionSettledY_N, BalanceSheetDate, ListedShares )
     ( SELECT v_TimeKey Time_Key  ,
              InvEntityId ,
              A.IssuerID ,
              (A.InvID || '_' || UTILS.CONVERT_TO_VARCHAR2(HoldingNature,10)) InvID  ,
              HoldingNature ,
              C.CurrencyAlt_Key ,
              CurrencyConvRate ,
              BookType ,
              BookValue ,
              BookValueINR ,
              MTMValue ,
              MTMValueINR ,
              EncumberedMTM ,
              B.AssetClassAlt_Key ,
              A.NPADt NPIDt  ,
              NULL TotalProvison  ,
              NULL AuthorisationStatus  ,
              v_vEffectivefrom EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              'SSISUSER' CreatedBy  ,
              SYSDATE DateCreated  ,
              NULL ModifiedBy  ,
              NULL DateModified  ,
              NULL ApprovedBy  ,
              NULL DateApproved  ,
              Interest_DividendoVERDueDate ,
              Interest_DividendOVERDueAmount ,
              LatestBSDate ,
              RedumptionDueDate ,
              RedumptionProceedSettledY_N ,
              BalanceSheetDate ,
              ListedShares 

       ----SELECT *		
       FROM RBL_STGDB.INVFINANCIAL_SOURCESYSTEM_STG A
              LEFT JOIN RBL_MISDB.DimAssetClass B   ON A.AssetClass = B.SrcSysClassCode
              AND B.EffectiveFromTimeKey <= v_TimeKey
              AND B.EffectiveToTimeKey >= v_TimeKey
              LEFT JOIN RBL_MISDB.DimCurrency C   ON A.CurrencyCode = C.SrcSysCurrencyCode
              AND C.EffectiveFromTimeKey <= v_TimeKey
              AND C.EffectiveToTimeKey >= v_TimeKey
              JOIN RBL_TEMPDB.TempInvestmentBasicDetail I   ON I.InvID = (A.InvID || '_' || UTILS.CONVERT_TO_VARCHAR2(HoldingNature,10)) );
   /*********************************************************************************************************/
   /*  Existing Customers Customer Entity ID Update  */
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, O.FLGDEG, T.DEGREASON, T.DPD, O.FLGUPG, T.UpgDate, T.PROVISIONALT_KEY, T.InitialAssetAlt_Key, T.InitialNPIDt, T.RefIssuerID, T.DPD_Maturity, T.DPD_DivOverdue, T.FinalAssetClassAlt_Key, T.NPIDt
   FROM O ,RBL_TEMPDB.TempInvestmentFinancialDetail O
          JOIN RBL_MISDB.InvestmentFinancialDetail T   ON O.InvEntityId = T.InvEntityId
          AND O.EffectiveToTimeKey = 49999
          AND T.EffectivefromTimeKey <= v_VEFFECTIVETO
          AND T.EffectiveToTimeKey >= v_VEFFECTIVETO ) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.FLGDEG = src.FLGDEG,
                                O.DEGREASON = src.DEGREASON,
                                O.DPD = src.DPD,
                                O.FLGUPG = src.FLGUPG,
                                O.UpgDate = src.UpgDate,
                                O.PROVISIONALT_KEY = src.PROVISIONALT_KEY,
                                O.InitialAssetAlt_Key = src.InitialAssetAlt_Key,
                                O.InitialNPIDt = src.InitialNPIDt,
                                O.RefIssuerID = src.RefIssuerID,
                                O.DPD_Maturity = src.DPD_Maturity,
                                O.DPD_DivOverdue = src.DPD_DivOverdue,
                                O.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                O.NPIDt = src.NPIDt;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTFINANCIALDETAIL_TEMP_10122023" TO "ADF_CDR_RBL_STGDB";
