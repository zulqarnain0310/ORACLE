--------------------------------------------------------
--  DDL for Procedure ADVACBALANCEDETAIL_MAIN_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" 
-- =============================================
 -- Author:		<Author,,Name>
 -- Create date: <Create Date,,>
 -- Description:	<Description,,>
 -- =============================================

AS
   -- SET NOCOUNT ON added to prevent extra result sets from
   -- interfering with SELECT statements.
   v_VEFFECTIVETO NUMBER(10,0);
   -------------------------------
   /*  New Customers EntityKey ID Update  */
   v_EntityKey NUMBER(19,0) := 0;
-- Add the parameters for the stored procedure here

BEGIN

   SELECT TIMEKEY - 1 

     INTO v_VEFFECTIVETO
     FROM RBL_MISDB.AUTOMATE_ADVANCES 
    WHERE  EXT_FLG = 'Y';
   ----------For New Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'N'
   FROM A ,RBL_TEMPDB.TempAdVAcBalanceDetail A 
    WHERE NOT EXISTS ( SELECT 1 
                       FROM RBL_MISDB_PROD.AdvAcBalanceDetail B
                        WHERE  B.EffectiveToTimeKey = 49999
                                 AND B.AccountEntityId = A.AccountEntityId )) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged = 'N';
   /*update AssetClassAlt_Key,TotalProv from main table */
   MERGE INTO T 
   USING (SELECT T.ROWID row_id, bAl.ASSETCLASSALT_KEY, bAl.TOTALPROV
   FROM T ,RBL_TEMPDB.TempAdVAcBalanceDetail T
          JOIN AdvAcBalanceDetail bal   ON ( bAl.EffectiveToTimeKey = 49999 )
          AND t.AccountEntityId = bal.AccountEntityId 
    WHERE ( NVL(T.ASSETCLASSALT_KEY, 0) <> NVL(bal.ASSETCLASSALT_KEY, 0)
     OR NVL(T.TOTALPROV, 0) <> NVL(bal.TOTALPROV, 0) )) src
   ON ( T.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET T.ASSETCLASSALT_KEY = src.ASSETCLASSALT_KEY,
                                T.TOTALPROV = src.TOTALPROV;
   /* end of update AssetClassAlt_Key,TotalProv from main table */
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM O ,RBL_MISDB_PROD.AdvAcBalanceDetail O
          JOIN RBL_TEMPDB.TempAdVAcBalanceDetail T   ON O.AccountEntityID = T.AccountEntityID
          AND O.EffectiveToTimeKey = 49999
          AND T.EffectiveToTimeKey = 49999 
    WHERE ( NVL(O.BalanceInCurrency, 0) <> NVL(T.BalanceInCurrency, 0)
     OR NVL(O.Balance, 0) <> NVL(T.Balance, 0)
     OR NVL(O.SignBalance, 0) <> NVL(T.SignBalance, 0)
     OR NVL(O.LastCrDt, '1990-01-01') <> NVL(T.LastCrDt, '1990-01-01')
     OR NVL(O.PS_Balance, 0) <> NVL(T.PS_Balance, 0)
     OR NVL(O.NPS_Balance, 0) <> NVL(T.NPS_Balance, 0)
     OR NVL(O.OverDue, 0) <> NVL(T.OverDue, 0)
     OR NVL(O.RefCustomerId, 'AA') <> NVL(T.RefCustomerId, 'AA')
     OR NVL(O.PS_NPS_FLAG, 'AA') <> NVL(T.PS_NPS_FLAG, 'AA')
     OR NVL(O.OverDueSinceDt, '1990-01-01') <> NVL(T.OverDueSinceDt, '1990-01-01')
     OR NVL(O.IntReverseAmt, 0) <> NVL(T.IntReverseAmt, 0)
     OR NVL(O.UnAppliedIntAmount, 0) <> NVL(T.UnAppliedIntAmount, 0)
     OR NVL(O.UpgradeDate, '1990-01-01') <> NVL(T.UpgradeDate, '1990-01-01')
     OR NVL(O.OverduePrincipal, 0) <> NVL(T.OverduePrincipal, 0)
     OR NVL(O.NotionalInttAmt, 0) <> NVL(T.NotionalInttAmt, 0)
     OR NVL(O.PrincipalBalance, 0) <> NVL(T.PrincipalBalance, 0)
     OR NVL(O.Overdueinterest, 0) <> NVL(T.Overdueinterest, 0)
     OR NVL(O.AdvanceRecovery, 0) <> NVL(T.AdvanceRecovery, 0)
     OR NVL(O.DFVAmt, 0) <> NVL(T.DFVAmt, 0)
     OR NVL(O.InterestReceivable, 0) <> NVL(T.InterestReceivable, 0)
     OR NVL(O.OverduePrincipalDt, '1990-01-01') <> NVL(T.OverduePrincipalDt, '1990-01-01')
     OR NVL(O.OverdueIntDt, '1990-01-01') <> NVL(T.OverdueIntDt, '1990-01-01')
     OR NVL(O.OverOtherdue, 0) <> NVL(T.OverOtherdue, 0)
     OR NVL(O.OverdueOtherDt, '1990-01-01') <> NVL(T.OverdueOtherDt, '1990-01-01')
     OR NVL(O.SourceNpaDate, '1990-01-01') <> NVL(T.SourceNpaDate, '1990-01-01')
     OR NVL(O.SourceAssetClass, ' ') <> NVL(T.SourceAssetClass, ' ') )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = v_vEffectiveto,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSER';
   ----------For Changes Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'C'
   FROM A ,RBL_TEMPDB.TempAdVAcBalanceDetail A
          JOIN RBL_MISDB_PROD.AdvAcBalanceDetail B   ON B.AccountEntityId = A.AccountEntityId 
    WHERE B.EffectiveToTimeKey = v_vEffectiveto) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged = 'C';
   ---------------------------------------------------------------------------------------------------------------
   -------Expire the records
   MERGE INTO AA 
   USING (SELECT AA.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM AA ,RBL_MISDB_PROD.AdvAcBalanceDetail AA 
    WHERE AA.EffectiveToTimeKey = 49999
     AND NOT EXISTS ( SELECT 1 
                      FROM RBL_TEMPDB.TempAdVAcBalanceDetail BB
                       WHERE  AA.AccountEntityID = BB.AccountEntityID
                                AND BB.EffectiveToTimeKey = 49999 )) src
   ON ( AA.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto,
                                DateModified = pos_3,
                                ModifiedBy = 'SSISUSER';
   SELECT MAX(EntityKey)  

     INTO v_EntityKey
     FROM RBL_MISDB.AdvAcBalanceDetail ;
   IF v_EntityKey IS NULL THEN

   BEGIN
      v_EntityKey := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKey
   FROM TEMP ,RBL_TEMPDB.TempAdVAcBalanceDetail TEMP
          JOIN ( SELECT "TEMPADVACBALANCEDETAIL".AccountEntityId ,
                        (v_EntityKey + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                        FROM DUAL  )  )) EntityKey  
                 FROM RBL_TEMPDB.TempAdVAcBalanceDetail 
                  WHERE  "TEMPADVACBALANCEDETAIL".EntityKey = 0
                           OR "TEMPADVACBALANCEDETAIL".EntityKey IS NULL ) ACCT   ON TEMP.AccountEntityId = ACCT.AccountEntityId 
    WHERE Temp.IsChanged IN ( 'N','C' )
   ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKey = src.EntityKey;
   ------------------------------
   INSERT INTO RBL_MISDB_PROD.AdvAcBalanceDetail
     ( EntityKey, AccountEntityId, AssetClassAlt_Key, BalanceInCurrency, Balance, SignBalance, LastCrDt, OverDue, TotalProv, RefCustomerId, RefSystemAcId, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, OverDueSinceDt, MocStatus, MocDate, MocTypeAlt_Key, Old_OverDueSinceDt, Old_OverDue, ORG_TotalProv, IntReverseAmt, UnAppliedIntAmount, PS_Balance, NPS_Balance, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, CreatedBy, UpgradeDate, OverduePrincipal, NotionalInttAmt, PrincipalBalance, Overdueinterest, AdvanceRecovery, PS_NPS_FLAG, DFVAmt, InterestReceivable, OverduePrincipalDt, OverdueIntDt, OverOtherdue, OverdueOtherDt, SourceAssetClass, SourceNpaDate )
     ( SELECT EntityKey ,
              AccountEntityId ,
              AssetClassAlt_Key ,
              BalanceInCurrency ,
              Balance ,
              SignBalance ,
              LastCrDt ,
              OverDue ,
              TotalProv ,
              RefCustomerId ,
              RefSystemAcId ,
              AuthorisationStatus ,
              EffectiveFromTimeKey ,
              EffectiveToTimeKey ,
              OverDueSinceDt ,
              MocStatus ,
              MocDate ,
              MocTypeAlt_Key ,
              Old_OverDueSinceDt ,
              Old_OverDue ,
              ORG_TotalProv ,
              IntReverseAmt ,
              UnAppliedIntAmount ,
              PS_Balance ,
              NPS_Balance ,
              DateCreated ,
              ModifiedBy ,
              DateModified ,
              ApprovedBy ,
              DateApproved ,
              CreatedBy ,
              UpgradeDate ,
              OverduePrincipal ,
              NotionalInttAmt ,
              PrincipalBalance ,
              Overdueinterest ,
              AdvanceRecovery ,
              PS_NPS_FLAG ,
              DFVAmt ,
              InterestReceivable ,
              OverduePrincipalDt ,
              OverdueIntDt ,
              OverOtherdue ,
              OverdueOtherDt ,
              SourceAssetClass ,
              SourceNpaDate 
       FROM RBL_TEMPDB.TempAdVAcBalanceDetail T
        WHERE  NVL(T.IsChanged, 'U') IN ( 'N','C' )
      );

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_MAIN_04122023" TO "ADF_CDR_RBL_STGDB";
