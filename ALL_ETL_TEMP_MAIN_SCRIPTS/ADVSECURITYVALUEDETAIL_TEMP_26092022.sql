--------------------------------------------------------
--  DDL for Procedure ADVSECURITYVALUEDETAIL_TEMP_26092022
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" 
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
     FROM UATRestore_RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
-- Add the parameters for the stored procedure here

BEGIN

   SELECT TimeKey 

     INTO v_vEffectiveFrom
     FROM UATRestore_RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   SELECT TimeKey 

     INTO v_TimeKey
     FROM UATRestore_RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   --------------------------------------------------------------------------------------------------------------------------------------------------- 
   EXECUTE IMMEDIATE ' TRUNCATE TABLE TempAdvSecurityValueDetail ';
   INSERT INTO TempAdvSecurityValueDetail
     ( SecurityEntityID, ValuationSourceAlt_Key, ValuationDate, CurrentValue, ValuationExpiryDate, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, D2Ktimestamp )
     ( 
       -------------    FINACLE  ---------
       SELECT C.SecurityEntityID ,
              NULL ValuationSourceAlt_Key  ,
              A.ValuationDate ,
              A.SecurityValue CurrentValue  ,
              A.ValuationExpiryDate ,
              NULL AuthorisationStatus  ,
              v_vEffectivefrom EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              'SSISUSER' CreatedBy  ,
              SYSDATE DateCreated  ,
              NULL ModifiedBy  ,
              NULL DateModified  ,
              NULL ApprovedBy  ,
              NULL DateApproved  ,
              NULL D2Ktimestamp  
       FROM RBL_STGDB.SECURITY_SOURCESYSTEM01_STG A
              LEFT JOIN TempAdvAcBasicDetail B   ON A.AccountID = B.CustomerAcid
              AND B.EffectiveFromTimeKey <= v_TimeKey
              AND B.EffectiveToTimeKey >= v_TimeKey
              LEFT JOIN TempAdvSecurityDetail C   ON C.AccountEntityId = B.AccountEntityId
              AND C.EffectiveFromTimeKey <= v_TimeKey
              AND C.EffectiveToTimeKey >= v_TimeKey
       UNION 

       -------------    INDUS  ---------
       SELECT C.SecurityEntityID ,
              NULL ValuationSourceAlt_Key  ,
              A.ValuationDate ,
              A.SecurityValue CurrentValue  ,
              A.ValuationExpiryDate ,
              NULL AuthorisationStatus  ,
              v_vEffectivefrom EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              'SSISUSER' CreatedBy  ,
              SYSDATE DateCreated  ,
              NULL ModifiedBy  ,
              NULL DateModified  ,
              NULL ApprovedBy  ,
              NULL DateApproved  ,
              NULL D2Ktimestamp  
       FROM RBL_STGDB.SECURITY_SOURCESYSTEM02_STG A
              LEFT JOIN TempAdvAcBasicDetail B   ON A.AccountID = B.CustomerAcid
              AND B.EffectiveFromTimeKey <= v_TimeKey
              AND B.EffectiveToTimeKey >= v_TimeKey
              LEFT JOIN TempAdvSecurityDetail C   ON C.AccountEntityId = B.AccountEntityId
              AND C.EffectiveFromTimeKey <= v_TimeKey
              AND C.EffectiveToTimeKey >= v_TimeKey
       UNION 

       -------------    MIFIN  ---------
       SELECT C.SecurityEntityID ,
              NULL ValuationSourceAlt_Key  ,
              NULL ValuationDate  ,
              NULL CurrentValue ,--A.SecurityValue CurrentValue

              NULL ValuationExpiryDate  ,
              NULL AuthorisationStatus  ,
              v_vEffectivefrom EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              'SSISUSER' CreatedBy  ,
              SYSDATE DateCreated  ,
              NULL ModifiedBy  ,
              NULL DateModified  ,
              NULL ApprovedBy  ,
              NULL DateApproved  ,
              NULL D2Ktimestamp  
       FROM RBL_STGDB.SECURITY_SOURCESYSTEM04_STG A
              LEFT JOIN TempAdvAcBasicDetail B   ON A.AccountID = B.CustomerAcid
              AND B.EffectiveFromTimeKey <= v_TimeKey
              AND B.EffectiveToTimeKey >= v_TimeKey
              LEFT JOIN TempAdvSecurityDetail C   ON C.AccountEntityId = B.AccountEntityId
              AND C.EffectiveFromTimeKey <= v_TimeKey
              AND C.EffectiveToTimeKey >= v_TimeKey );

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_26092022" TO "ADF_CDR_RBL_STGDB";
