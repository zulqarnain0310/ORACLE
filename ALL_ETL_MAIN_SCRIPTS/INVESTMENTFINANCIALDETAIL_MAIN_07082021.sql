--------------------------------------------------------
--  DDL for Procedure INVESTMENTFINANCIALDETAIL_MAIN_07082021
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" 
-- =============================================
 -- Author:		<Author,,Name>
 -- Create date: <Create Date,,>
 -- Description:	<Description,,>
 -- =============================================

AS
   -- SET NOCOUNT ON added to prevent extra result sets from
   -- interfering with SELECT statements.
   v_VEFFECTIVETO NUMBER(10,0);
-- Add the parameters for the stored procedure here

BEGIN

   SELECT TIMEKEY - 1 

     INTO v_VEFFECTIVETO
     FROM RBL_MISDB.AUTOMATE_ADVANCES 
    WHERE  EXT_FLG = 'Y';
   ----------For New Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'N'
   FROM A ,RBL_TEMPDB.TempInvestmentFinancialDetail A 
    WHERE NOT EXISTS ( SELECT 1 
                       FROM RBL_MISDB_PROD.InvestmentFinancialDetail B
                        WHERE  B.EffectiveToTimeKey = 49999
                                 AND A.InvEntityId = B.InvEntityId )) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged
                                ----Select * 
                                 = 'N';
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM O ,RBL_MISDB_PROD.InvestmentFinancialDetail O
          JOIN RBL_TEMPDB.TempInvestmentFinancialDetail T   ON O.InvEntityId = T.InvEntityId
          AND O.EffectiveToTimeKey = 49999
          AND T.EffectiveToTimeKey = 49999
        --O.Time_Key <> T.Time_Key 

    WHERE ( NVL(O.HoldingNature, 0) <> NVL(T.HoldingNature, 0)
     OR NVL(O.CurrencyAlt_Key, 0) <> NVL(T.CurrencyAlt_Key, 0)
     OR NVL(O.CurrencyConvRate, 0) <> NVL(T.CurrencyConvRate, 0)
     OR NVL(O.BookType, 0) <> NVL(T.BookType, 0)
     OR NVL(O.BookValue, 0) <> NVL(T.BookValue, 0)
     OR NVL(O.BookValueINR, 0) <> NVL(T.BookValueINR, 0)
     OR NVL(O.MTMValue, 0) <> NVL(T.MTMValue, 0)
     OR NVL(O.MTMValueINR, 0) <> NVL(T.MTMValueINR, 0)
     OR NVL(O.EncumberedMTM, 0) <> NVL(T.EncumberedMTM, 0)
     OR NVL(O.AssetClass_AltKey, 0) <> NVL(T.AssetClass_AltKey, 0)
     OR NVL(O.NPIDt, '1990-01-01') <> NVL(T.NPIDt, '1990-01-01')
     OR NVL(O.TotalProvison, 0) <> NVL(T.TotalProvison, 0) )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = v_vEffectiveto,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSER';
   ----------For Changes Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'C'
   FROM A ,RBL_TEMPDB.TempInvestmentFinancialDetail A
          JOIN RBL_MISDB_PROD.InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId 
    WHERE B.EffectiveToTimeKey = v_vEffectiveto) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged
                                ----Select * 
                                 = 'C';
   ---------------------------------------------------------------------------------------------------------------
   -------Expire the records
   MERGE INTO AA 
   USING (SELECT AA.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM AA ,RBL_MISDB_PROD.InvestmentFinancialDetail AA 
    WHERE AA.EffectiveToTimeKey = 49999
     AND NOT EXISTS ( SELECT 1 
                      FROM RBL_TEMPDB.TempInvestmentFinancialDetail BB
                       WHERE  AA.InvEntityId = BB.InvEntityId
                                AND BB.EffectiveToTimeKey = 49999 )) src
   ON ( AA.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto,
                                DateModified = pos_3,
                                ModifiedBy = 'SSISUSER';
   --INSERT INTO DBO.InvestmentFinancialDetail
   --     (	
   --       --[Time_Key]
   --      --[Inv_Key]
   --	  InvEntityId
   --      ,[HoldingNature]
   --      ,[CurrencyAlt_Key]
   --      ,[CurrencyConvRate]
   --      ,[BookType]
   --      ,[BookValue]
   --      ,[BookValueINR]
   --      ,[MTMValue]
   --      ,[MTMValueINR]
   --      ,[EncumberedMTM]
   --      ,[AssetClass_AltKey]
   --      ,[NPIDt]
   --      ,[TotalProvison]
   --      ,[AuthorisationStatus]
   --      ,[EffectiveFromTimeKey]
   --      ,[EffectiveToTimeKey]
   --      ,[CreatedBy]
   --      ,[DateCreated]
   --      ,[ModifiedBy]
   --      ,[DateModified]
   --      ,[ApprovedBy]
   --      ,[DateApproved]
   --		   )
   --SELECT
   --       --[Time_Key]
   --      --[Inv_Key]
   --	  InvEntityId
   --      ,[HoldingNature]
   --      ,[CurrencyAlt_Key]
   --      ,[CurrencyConvRate]
   --      ,[BookType]
   --      ,[BookValue]
   --      ,[BookValueINR]
   --      ,[MTMValue]
   --      ,[MTMValueINR]
   --      ,[EncumberedMTM]
   --      ,[AssetClass_AltKey]
   --      ,[NPIDt]
   --      ,[TotalProvison]
   --      ,[AuthorisationStatus]
   --      ,[EffectiveFromTimeKey]
   --      ,[EffectiveToTimeKey]
   --      ,[CreatedBy]
   --      ,[DateCreated]
   --      ,[ModifiedBy]
   --      ,[DateModified]
   --      ,[ApprovedBy]
   --      ,[DateApproved]
   --		   FROM RBL_TEMPDB.dbo.TempInvestmentFinancialDetail T Where ISNULL(T.IsChanged,'U') IN ('N','C')
   INSERT INTO RBL_MISDB_PROD.InvestmentFinancialDetail
     ( EntityKey, InvEntityId, RefInvID, HoldingNature, CurrencyAlt_Key, CurrencyConvRate, BookType, BookValue, BookValueINR, MTMValue, MTMValueINR, EncumberedMTM, AssetClass_AltKey, NPIDt, TotalProvison, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, DBTDate, LatestBSDate, Interest_DividendDueDate, Interest_DividendDueAmount, PartialRedumptionDueDate, PartialRedumptionSettledY_N, FLGDEG, DEGREASON, DPD, FLGUPG, UpgDate, PROVISIONALT_KEY, InitialAssetAlt_Key, InitialNPIDt, RefIssuerID, DPD_Maturity, DPD_DivOverdue, FinalAssetClassAlt_Key )
     ( SELECT EntityKey ,
              InvEntityId ,
              RefInvID ,
              HoldingNature ,
              CurrencyAlt_Key ,
              CurrencyConvRate ,
              BookType ,
              BookValue ,
              BookValueINR ,
              MTMValue ,
              MTMValueINR ,
              EncumberedMTM ,
              AssetClass_AltKey ,
              NPIDt ,
              TotalProvison ,
              AuthorisationStatus ,
              EffectiveFromTimeKey ,
              EffectiveToTimeKey ,
              CreatedBy ,
              DateCreated ,
              ModifiedBy ,
              DateModified ,
              ApprovedBy ,
              DateApproved ,
              DBTDate ,
              LatestBSDate ,
              Interest_DividendDueDate ,
              Interest_DividendDueAmount ,
              PartialRedumptionDueDate ,
              PartialRedumptionSettledY_N ,
              FLGDEG ,
              DEGREASON ,
              DPD ,
              FLGUPG ,
              UpgDate ,
              PROVISIONALT_KEY ,
              InitialAssetAlt_Key ,
              InitialNPIDt ,
              RefIssuerID ,
              DPD_Maturity ,
              DPD_DivOverdue ,
              FinalAssetClassAlt_Key 
       FROM RBL_TEMPDB.TempInvestmentFinancialDetail T
        WHERE  NVL(T.IsChanged, 'U') IN ( 'N','C' )

                 AND InvEntityId IS NOT NULL );

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."INVESTMENTFINANCIALDETAIL_MAIN_07082021" TO "ADF_CDR_RBL_STGDB";
