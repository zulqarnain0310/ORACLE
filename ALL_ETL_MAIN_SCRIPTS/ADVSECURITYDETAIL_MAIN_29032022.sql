--------------------------------------------------------
--  DDL for Procedure ADVSECURITYDETAIL_MAIN_29032022
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" 
-- =============================================
 -- Author:		<Author,,Name>
 -- Create date: <Create Date,,>
 -- Description:	<Description,,>
 -- =============================================

AS
   -- SET NOCOUNT ON added to prevent extra result sets from
   -- interfering with SELECT statements.
   v_VEFFECTIVETO NUMBER(10,0);
   v_cursor SYS_REFCURSOR;
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
   FROM A ,RBL_TEMPDB.tempadvsecuritydetail A 
    WHERE NOT EXISTS ( SELECT 1 
                       FROM RBL_MISDB_PROD.AdvSecurityDetail B
                        WHERE  B.EffectiveToTimeKey = 49999
                                 AND B.AccountEntityId = A.AccountEntityId
                                 AND A.SecurityEntityID = B.SecurityEntityID )) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged
                                ----Select * 
                                 = 'N';
   OPEN  v_cursor FOR
      SELECT * 
        FROM RBL_TEMPDB.tempadvsecuritydetail  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM O ,RBL_MISDB_PROD.AdvSecurityDetail O
          JOIN RBL_TEMPDB.tempadvsecuritydetail T   ON O.AccountEntityID = T.AccountEntityID
          AND O.SecurityEntityID = T.SecurityEntityID
          AND O.EffectiveToTimeKey = 49999
          AND T.EffectiveToTimeKey = 49999 
    WHERE ( NVL(o.CustomerEntityId, 0) <> NVL(T.CustomerEntityId, 0)
     OR NVL(o.SecurityType, 0) <> NVL(T.SecurityType, 0)
     OR NVL(o.CollateralType, 0) <> NVL(T.CollateralType, 0)
     OR NVL(o.SecurityAlt_Key, 0) <> NVL(T.SecurityAlt_Key, 0)
     OR NVL(o.Security_RefNo, 0) <> NVL(T.Security_RefNo, 0)
     OR NVL(o.SecurityNature, 0) <> NVL(T.SecurityNature, 0)
     OR NVL(o.SecurityChargeTypeAlt_Key, 0) <> NVL(T.SecurityChargeTypeAlt_Key, 0)
     OR NVL(o.CurrencyAlt_Key, 0) <> NVL(T.CurrencyAlt_Key, 0)
     OR NVL(o.EntryType, 0) <> NVL(T.EntryType, 0)
     OR NVL(o.ScrCrError, 0) <> NVL(T.ScrCrError, 0)
     OR NVL(o.InwardNo, 0) <> NVL(T.InwardNo, 0)
     OR NVL(o.Limitnode_Flag, 0) <> NVL(T.Limitnode_Flag, 0)
     OR NVL(o.RefCustomerId, 0) <> NVL(T.RefCustomerId, 0)
     OR NVL(o.RefSystemAcId, 0) <> NVL(T.RefSystemAcId, 0)
     OR NVL(o.SecurityParticular, 0) <> NVL(T.SecurityParticular, 0)
     OR NVL(o.OwnerTypeAlt_Key, 0) <> NVL(T.OwnerTypeAlt_Key, 0)
     OR NVL(o.AssetOwnerName, 0) <> NVL(T.AssetOwnerName, 0)
     OR NVL(o.ValueAtSanctionTime, 0) <> NVL(T.ValueAtSanctionTime, 0)
     OR NVL(o.BranchLastInspecDate, '1990-01-01') <> NVL(T.BranchLastInspecDate, '1990-01-01')
     OR NVL(o.SatisfactionNo, 0) <> NVL(T.SatisfactionNo, 0)
     OR NVL(o.SatisfactionDate, '1990-01-01') <> NVL(T.SatisfactionDate, '1990-01-01')
     OR NVL(o.BankShare, 0) <> NVL(T.BankShare, 0)
     OR NVL(o.ActionTakenRemark, 0) <> NVL(T.ActionTakenRemark, 0)
     OR NVL(o.SecCharge, 0) <> NVL(T.SecCharge, 0) )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = v_vEffectiveto,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSER';
   ----------For Changes Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'C'
   FROM A ,RBL_TEMPDB.tempadvsecuritydetail A
          JOIN RBL_MISDB_PROD.AdvSecurityDetail B   ON B.AccountEntityId = A.AccountEntityId
          AND A.SecurityEntityID = B.SecurityEntityID 
    WHERE B.EffectiveToTimeKey = v_vEffectiveto) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged
                                ----Select * 
                                 = 'C';
   ---------------------------------------------------------------------------------------------------------------
   -------Expire the records
   MERGE INTO AA 
   USING (SELECT AA.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM AA ,RBL_MISDB_PROD.AdvSecurityDetail AA
          JOIN RBL_TEMPDB.TempAdvAcBasicDetail BB   ON AA.AccountEntityId = BB.ACCOUNTENTITYID 
    WHERE AA.EffectiveToTimeKey = 49999
     AND BB.SourceAlt_Key = 4
     AND NOT EXISTS ( SELECT 1 
                      FROM RBL_TEMPDB.tempadvsecuritydetail BB
                       WHERE  AA.AccountEntityID = BB.AccountEntityID
                                AND AA.SecurityEntityID = BB.SecurityEntityID
                                AND AA.COLLATERALID = BB.COLLATERALID
                                AND BB.EffectiveToTimeKey = 49999 )) src
   ON ( AA.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto,
                                DateModified = pos_3,
                                ModifiedBy = 'SSISUSER';
   SELECT MAX(EntityKey)  

     INTO v_EntityKey
     FROM RBL_MISDB.AdvSecurityDetail ;
   IF v_EntityKey IS NULL THEN

   BEGIN
      v_EntityKey := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKey
   FROM TEMP ,RBL_TEMPDB.tempadvsecuritydetail TEMP
          JOIN ( SELECT "TEMPADVSECURITYDETAIL".AccountEntityId ,
                        "TEMPADVSECURITYDETAIL".COLLATERALID ,
                        "TEMPADVSECURITYDETAIL".SecurityEntityID ,
                        (v_EntityKey + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                        FROM DUAL  )  )) EntityKey  
                 FROM RBL_TEMPDB.tempadvsecuritydetail 
                  WHERE  "TEMPADVSECURITYDETAIL".EntityKey = 0
                           OR "TEMPADVSECURITYDETAIL".EntityKey IS NULL ) ACCT   ON TEMP.AccountEntityId = ACCT.AccountEntityId
          AND TEMP.COLLATERALID = ACCT.COLLATERALID
          AND TEMP.SecurityEntityID = ACCT.SecurityEntityID 
    WHERE Temp.IsChanged IN ( 'N','C' )
   ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKey = src.EntityKey;
   ------------------------------
   INSERT INTO RBL_MISDB_PROD.AdvSecurityDetail
     ( ENTITYKEY, AccountEntityId, CustomerEntityId, SecurityType, CollateralType, SecurityAlt_Key, SecurityEntityID, Security_RefNo, SecurityNature, SecurityChargeTypeAlt_Key, CurrencyAlt_Key, EntryType, ScrCrError, InwardNo, Limitnode_Flag, RefCustomerId, RefSystemAcId, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, D2Ktimestamp, MocTypeAlt_Key, MocStatus, MocDate, SecurityParticular, OwnerTypeAlt_Key, AssetOwnerName, ValueAtSanctionTime, BranchLastInspecDate, SatisfactionNo, SatisfactionDate, BankShare, ActionTakenRemark, SecCharge, CollateralID, UCICID, CustomerName, TaggingAlt_Key, DistributionAlt_Key, CollateralCode, CollateralSubTypeAlt_Key, CollateralOwnerShipTypeAlt_Key, ChargeNatureAlt_Key, ShareAvailabletoBankAlt_Key, CollateralShareamount, IfPercentagevalue_or_Absolutevalue, CollateralValueatSanctioninRs, CollateralValueasonNPAdateinRs, ApprovedByFirstLevel, DateApprovedFirstLevel, ChangeField )
     ( SELECT ENTITYKEY ,
              AccountEntityId ,
              CustomerEntityId ,
              SecurityType ,
              CollateralType ,
              SecurityAlt_Key ,
              SecurityEntityID ,
              Security_RefNo ,
              SecurityNature ,
              SecurityChargeTypeAlt_Key ,
              CurrencyAlt_Key ,
              EntryType ,
              ScrCrError ,
              InwardNo ,
              Limitnode_Flag ,
              RefCustomerId ,
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
              MocTypeAlt_Key ,
              MocStatus ,
              MocDate ,
              SecurityParticular ,
              OwnerTypeAlt_Key ,
              AssetOwnerName ,
              ValueAtSanctionTime ,
              BranchLastInspecDate ,
              SatisfactionNo ,
              SatisfactionDate ,
              BankShare ,
              ActionTakenRemark ,
              SecCharge ,
              CollateralID ,
              UCICID ,
              CustomerName ,
              TaggingAlt_Key ,
              DistributionAlt_Key ,
              CollateralCode ,
              CollateralSubTypeAlt_Key ,
              CollateralOwnerShipTypeAlt_Key ,
              ChargeNatureAlt_Key ,
              ShareAvailabletoBankAlt_Key ,
              CollateralShareamount ,
              IfPercentagevalue_or_Absolutevalue ,
              CollateralValueatSanctioninRs ,
              CollateralValueasonNPAdateinRs ,
              ApprovedByFirstLevel ,
              DateApprovedFirstLevel ,
              ChangeField 
       FROM RBL_TEMPDB.tempadvsecuritydetail T
        WHERE  NVL(T.IsChanged, 'U') IN ( 'N','C' )
      );

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVSECURITYDETAIL_MAIN_29032022" TO "ADF_CDR_RBL_STGDB";
