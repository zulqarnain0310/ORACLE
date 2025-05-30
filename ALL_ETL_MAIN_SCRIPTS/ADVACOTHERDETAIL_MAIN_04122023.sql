--------------------------------------------------------
--  DDL for Procedure ADVACOTHERDETAIL_MAIN_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" 
-- =============================================
 -- Author:		<Author,,Name>
 -- Create date: <Create Date,,>
 -- Description:	<Description,,>
 -- =============================================

AS
   -- SET NOCOUNT ON added to prevent extra result sets from
   -- interfering with SELECT statements.
   v_VEFFECTIVETO NUMBER(10,0);
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
   FROM A ,RBL_TEMPDB.TempAdvAcOtherDetail A 
    WHERE NOT EXISTS ( SELECT 1 
                       FROM RBL_MISDB_PROD.AdvAcOtherDetail B
                        WHERE  B.EffectiveToTimeKey = 49999
                                 AND B.AccountEntityId = A.AccountEntityId )) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged = 'N';
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM O ,RBL_MISDB_PROD.AdvAcOtherDetail O
          JOIN RBL_TEMPDB.TempAdvAcOtherDetail T   ON O.AccountEntityID = T.AccountEntityID
          AND O.EffectiveToTimeKey = 49999
          AND T.EffectiveToTimeKey = 49999 
    WHERE ( NVL(O.GovGurAmt, 0) <> NVL(T.GovGurAmt, 0)
     OR NVL(O.SplCatg1Alt_Key, 0) <> NVL(T.SplCatg1Alt_Key, 0)
     OR NVL(O.SplCatg2Alt_Key, 0) <> NVL(T.SplCatg2Alt_Key, 0)
     OR NVL(O.RefinanceAgencyAlt_Key, 0) <> NVL(T.RefinanceAgencyAlt_Key, 0)
     OR NVL(O.RefinanceAmount, 0) <> NVL(T.RefinanceAmount, 0)
     OR NVL(O.BankAlt_Key, 0) <> NVL(T.BankAlt_Key, 0)
     OR NVL(O.TransferAmt, 0) <> NVL(T.TransferAmt, 0)
     OR NVL(O.ProjectId, 0) <> NVL(T.ProjectId, 0)
     OR NVL(O.ConsortiumId, 0) <> NVL(T.ConsortiumId, 0)
     OR NVL(O.RefSystemAcId, 0) <> NVL(T.RefSystemAcId, 0)
     OR NVL(O.MocStatus, 0) <> NVL(T.MocStatus, 0)
     OR NVL(O.MocDate, '1990-01-01') <> NVL(T.MocDate, '1990-01-01')
     OR NVL(O.SplCatg3Alt_Key, 0) <> NVL(T.SplCatg3Alt_Key, 0)
     OR NVL(O.SplCatg4Alt_Key, 0) <> NVL(T.SplCatg4Alt_Key, 0)
     OR NVL(O.MocTypeAlt_Key, 0) <> NVL(T.MocTypeAlt_Key, 0)
     OR NVL(O.GovGurExpDt, '1990-01-01') <> NVL(T.GovGurExpDt, '1990-01-01') )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = v_vEffectiveto,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSER';
   ----------For Changes Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'C'
   FROM A ,RBL_TEMPDB.TempAdvAcOtherDetail A
          JOIN RBL_MISDB_PROD.AdvAcOtherDetail B   ON B.AccountEntityId = A.AccountEntityId 
    WHERE B.EffectiveToTimeKey = v_vEffectiveto) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged = 'C';
   ---------------------------------------------------------------------------------------------------------------
   -------Expire the records
   MERGE INTO AA 
   USING (SELECT AA.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM AA ,RBL_MISDB_PROD.AdvAcOtherDetail AA 
    WHERE AA.EffectiveToTimeKey = 49999
     AND NOT EXISTS ( SELECT 1 
                      FROM RBL_TEMPDB.TempAdvAcOtherDetail BB
                       WHERE  AA.AccountEntityID = BB.AccountEntityID
                                AND BB.EffectiveToTimeKey = 49999 )) src
   ON ( AA.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto,
                                DateModified = pos_3,
                                ModifiedBy = 'SSISUSER';
   SELECT MAX(EntityKey)  

     INTO v_EntityKey
     FROM RBL_MISDB.AdvAcOtherDetail ;
   IF v_EntityKey IS NULL THEN

   BEGIN
      v_EntityKey := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKey
   FROM TEMP ,RBL_TEMPDB.TempAdvAcOtherDetail TEMP
          JOIN ( SELECT "TEMPADVACOTHERDETAIL".AccountEntityId ,
                        (v_EntityKey + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                        FROM DUAL  )  )) EntityKey  
                 FROM RBL_TEMPDB.TempAdvAcOtherDetail 
                  WHERE  "TEMPADVACOTHERDETAIL".EntityKey = 0
                           OR "TEMPADVACOTHERDETAIL".EntityKey IS NULL ) ACCT   ON TEMP.AccountEntityId = ACCT.AccountEntityId 
    WHERE Temp.IsChanged IN ( 'N','C' )
   ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKey = src.EntityKey;
   ------------------------------
   INSERT INTO RBL_MISDB_PROD.AdvAcOtherDetail
     ( EntityKey, AccountEntityId, GovGurAmt, SplCatg1Alt_Key, SplCatg2Alt_Key, RefinanceAgencyAlt_Key, RefinanceAmount, BankAlt_Key, TransferAmt, ProjectId, ConsortiumId, RefSystemAcId, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, D2Ktimestamp, MocStatus, MocDate, SplCatg3Alt_Key, SplCatg4Alt_Key, MocTypeAlt_Key, GovGurExpDt, SplFlag )
     ( SELECT EntityKey ,
              AccountEntityId ,
              GovGurAmt ,
              SplCatg1Alt_Key ,
              SplCatg2Alt_Key ,
              RefinanceAgencyAlt_Key ,
              RefinanceAmount ,
              BankAlt_Key ,
              TransferAmt ,
              ProjectId ,
              ConsortiumId ,
              RefSystemAcId ,
              AuthorisationStatus ,
              EffectiveFromTimeKey ,
              EffectiveToTimeKey ,
              CreatedBy ,
              DateCreated ,
              ModifiedBy ,
              DateModified ,
              ApprovedBy ,
              DateApproved ,
              SYSDATE D2Ktimestamp  ,
              MocStatus ,
              MocDate ,
              SplCatg3Alt_Key ,
              SplCatg4Alt_Key ,
              MocTypeAlt_Key ,
              GovGurExpDt ,
              NULL Splflag  
       FROM RBL_TEMPDB.TempAdvAcOtherDetail T
        WHERE  NVL(T.IsChanged, 'U') IN ( 'N','C' )
      );

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACOTHERDETAIL_MAIN_04122023" TO "ADF_CDR_RBL_STGDB";
