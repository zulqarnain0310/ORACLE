--------------------------------------------------------
--  DDL for Procedure ADVACRELATION_MAIN_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" 
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
   FROM A ,RBL_TEMPDB.TempAdvAcRelations A 
    WHERE NOT EXISTS ( SELECT 1 
                       FROM RBL_MISDB_PROD.AdvAcRelations B
                        WHERE  B.EffectiveToTimeKey = 49999
                                 AND B.CustomerEntityId = A.CustomerEntityId
                                 AND B.RelationEntityId = A.RelationEntityId )) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged = 'N';
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM O ,RBL_MISDB_PROD.AdvAcRelations O
          JOIN RBL_TEMPDB.TempAdvAcRelations T   ON O.CustomerEntityId = T.CustomerEntityId
          AND O.RelationEntityId = T.RelationEntityId
          AND O.EffectiveToTimeKey = 49999
          AND T.EffectiveToTimeKey = 49999 
    WHERE ( NVL(O.RelationEntityId, 0) <> NVL(T.RelationEntityId, 0)
     OR NVL(O.CustomerEntityId, 0) <> NVL(T.CustomerEntityId, 0)
     OR NVL(O.RelationTypeAlt_Key, 0) <> NVL(T.RelationTypeAlt_Key, 0)
     OR NVL(O.RelationSrNo, 0) <> NVL(T.RelationSrNo, 0)
     OR NVL(O.GuaranteeValue, 0) <> NVL(T.GuaranteeValue, 0)
     OR NVL(O.RefCustomerID, 0) <> NVL(T.RefCustomerID, 0) )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = v_vEffectiveto,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSER';
   ----------For Changes Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'C'
   FROM A ,RBL_TEMPDB.TempAdvAcRelations A
          JOIN RBL_MISDB_PROD.AdvAcRelations B   ON B.CustomerEntityId = A.CustomerEntityId
          AND B.RelationEntityId = A.RelationEntityId 
    WHERE B.EffectiveToTimeKey = v_vEffectiveto) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged = 'C';
   -------Expire the records
   MERGE INTO AA 
   USING (SELECT AA.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM AA ,RBL_MISDB_PROD.AdvAcRelations AA 
    WHERE AA.EffectiveToTimeKey = 49999
     AND NOT EXISTS ( SELECT 1 
                      FROM RBL_TEMPDB.TempAdvAcRelations BB
                       WHERE  AA.CustomerEntityId = BB.CustomerEntityId
                                AND AA.RelationEntityId = BB.RelationEntityId
                                AND BB.EffectiveToTimeKey = 49999 )) src
   ON ( AA.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto,
                                DateModified = pos_3,
                                ModifiedBy = 'SSISUSER';
   /********************************************************************************************************/
   INSERT INTO RBL_MISDB_PROD.AdvAcRelations
     ( EntityKey, BranchCode, RelationEntityId, CustomerEntityId, AccountEntityId, RelationTypeAlt_Key, RelationSrNo, RelationshipAuthorityCodeAlt_Key, InwardNo, FacilityNo, GuaranteeValue, RefCustomerID, RefSystemAcId, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved
   -- ,[D2Ktimestamp]
   , StatusActionTaken )
     ( SELECT EntityKey ,
              BranchCode ,
              RelationEntityId ,
              CustomerEntityId ,
              AccountEntityId ,
              RelationTypeAlt_Key ,
              RelationSrNo ,
              RelationshipAuthorityCodeAlt_Key ,
              InwardNo ,
              FacilityNo ,
              GuaranteeValue ,
              RefCustomerID ,
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
              --,D2Ktimestamp
              StatusActionTaken 
       FROM RBL_TEMPDB.TempAdvAcRelations T
        WHERE  NVL(T.IsChanged, 'U') IN ( 'N','C' )
      );

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVACRELATION_MAIN_04122023" TO "ADF_CDR_RBL_STGDB";
