--------------------------------------------------------
--  DDL for Procedure ADVFACCREDITCARDDETAIL_MAIN_16032023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" 
AS
   -- SET NOCOUNT ON added to prevent extra result sets from
   -- interfering with SELECT statements.
   v_VEFFECTIVETO NUMBER(10,0);
   -------------------------------
   /*  New Customers Ac Key ID Update  */
   v_EntityKey NUMBER(19,0) := 0;

BEGIN

   SELECT TIMEKEY - 1 

     INTO v_VEFFECTIVETO
     FROM RBL_MISDB.AUTOMATE_ADVANCES 
    WHERE  EXT_FLG = 'Y';
   ----------For New Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'N'
   FROM A ,RBL_TEMPDB.TempAdvFacCreditCardDetail A 
    WHERE NOT EXISTS ( SELECT 1 
                       FROM RBL_MISDB_PROD.AdvFacCreditCardDetail B
                        WHERE  B.EffectiveToTimeKey = 49999
                                 AND B.AccountEntityId = A.AccountEntityId
                                 AND A.CreditCardEntityId = B.CreditCardEntityId )) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged
                                ----Select * 
                                 = 'N';
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM O ,RBL_MISDB_PROD.AdvFacCreditCardDetail O
          JOIN RBL_TEMPDB.TempAdvFacCreditCardDetail T   ON O.AccountEntityID = T.AccountEntityID
          AND O.CreditCardEntityId = T.CreditCardEntityId
          AND O.EffectiveToTimeKey = 49999
          AND T.EffectiveToTimeKey = 49999 
    WHERE ( NVL(O.CorporateUCIC_ID, ' ') <> NVL(T.CorporateUCIC_ID, ' ')
     OR NVL(O.CorporateCustomerID, ' ') <> NVL(T.CorporateCustomerID, ' ')
     OR NVL(O.Liability, 0) <> NVL(T.Liability, 0)
     OR NVL(O.MinimumAmountDue, 0) <> NVL(T.MinimumAmountDue, 0)
     OR NVL(O.CD, 0) <> NVL(T.CD, 0)
     OR NVL(O.Bucket, 0) <> NVL(T.Bucket, 0)
     OR NVL(O.DPD, 0) <> NVL(T.DPD, 0)
     OR NVL(O.RefSystemAcId, ' ') <> NVL(T.RefSystemAcId, ' ')
     OR NVL(O.AccountStatus, ' ') <> NVL(T.AccountStatus, ' ')
     OR NVL(O.AccountBlkCode2, ' ') <> NVL(T.AccountBlkCode2, ' ')
     OR NVL(O.AccountBlkCode1, ' ') <> NVL(T.AccountBlkCode1, ' ')
     OR NVL(O.ChargeoffY_N, ' ') <> NVL(T.ChargeoffY_N, ' ') )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = v_vEffectiveto,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSER';
   ----------For Changes Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'C'
   FROM A ,RBL_TEMPDB.TempAdvFacCreditCardDetail A
          JOIN RBL_MISDB_PROD.AdvFacCreditCardDetail B   ON B.AccountEntityId = A.AccountEntityId
          AND A.CreditCardEntityId = B.CreditCardEntityId 
    WHERE B.EffectiveToTimeKey = v_vEffectiveto) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged
                                ----Select * 
                                 = 'C';
   ---------------------------------------------------------------------------------------------------------------
   -------Expire the records
   MERGE INTO AA 
   USING (SELECT AA.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM AA ,RBL_MISDB_PROD.AdvFacCreditCardDetail AA 
    WHERE AA.EffectiveToTimeKey = 49999
     AND NOT EXISTS ( SELECT 1 
                      FROM RBL_TEMPDB.TempAdvFacCreditCardDetail BB
                       WHERE  AA.AccountEntityID = BB.AccountEntityID
                                AND AA.CreditCardEntityId = BB.CreditCardEntityId
                                AND BB.EffectiveToTimeKey = 49999 )) src
   ON ( AA.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto,
                                DateModified = pos_3,
                                ModifiedBy = 'SSISUSER';
   SELECT MAX(EntityKey)  

     INTO v_EntityKey
     FROM RBL_MISDB.AdvFacCreditCardDetail ;
   IF v_EntityKey IS NULL THEN

   BEGIN
      v_EntityKey := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKey
   FROM TEMP ,RBL_TEMPDB.TempAdvFacCreditCardDetail TEMP
          JOIN ( SELECT "TEMPADVFACCREDITCARDDETAIL".RefSystemAcId ,
                        (v_EntityKey + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                        FROM DUAL  )  )) EntityKey  
                 FROM RBL_TEMPDB.TempAdvFacCreditCardDetail 
                  WHERE  "TEMPADVFACCREDITCARDDETAIL".EntityKey = 0
                           OR "TEMPADVFACCREDITCARDDETAIL".EntityKey IS NULL ) ACCT   ON TEMP.RefSystemAcId = ACCT.RefSystemAcId 
    WHERE Temp.IsChanged IN ( 'N','C' )
   ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKey = src.EntityKey;
   /***************************************************************************************************************/
   INSERT INTO RBL_MISDB_PROD.AdvFacCreditCardDetail
     ( EntityKey, AccountEntityId, CreditCardEntityId, CorporateUCIC_ID, CorporateCustomerID, Liability, MinimumAmountDue, CD, Bucket, DPD, RefSystemAcId, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, D2Ktimestamp, MocStatus, MocDate, AccountStatus, AccountBlkCode2, AccountBlkCode1, ChargeoffY_N )
     ( SELECT T.EntityKey ,
              T.AccountEntityId ,
              T.CreditCardEntityId ,
              T.CorporateUCIC_ID ,
              T.CorporateCustomerID ,
              T.Liability ,
              T.MinimumAmountDue ,
              T.CD ,
              T.Bucket ,
              T.DPD ,
              T.RefSystemAcId ,
              T.AuthorisationStatus ,
              T.EffectiveFromTimeKey ,
              T.EffectiveToTimeKey ,
              T.CreatedBy ,
              T.DateCreated ,
              T.ModifiedBy ,
              T.DateModified ,
              T.ApprovedBy ,
              T.DateApproved ,
              SYSDATE D2Ktimestamp  ,
              T.MocStatus ,
              T.MocDate ,
              T.AccountStatus ,
              CASE 
                   WHEN B.AccountBlkCode2 = 'K' THEN 'K'
              ELSE T.AccountBlkCode2
                 END col  ,
              T.AccountBlkCode1 ,
              T.ChargeoffY_N 
       FROM RBL_TEMPDB.TempAdvFacCreditCardDetail T
              LEFT JOIN RBL_MISDB_PROD.AdvFacCreditCardDetail B   ON T.AccountEntityId = B.AccountEntityId
              AND B.EffectiveFromTimeKey <= v_VEFFECTIVETO
              AND B.EffectiveToTimeKey >= v_VEFFECTIVETO
              AND B.AccountBlkCode2 = 'K'
        WHERE  NVL(T.IsChanged, 'U') IN ( 'N','C' )
      );

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVFACCREDITCARDDETAIL_MAIN_16032023" TO "ADF_CDR_RBL_STGDB";
