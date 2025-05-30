--------------------------------------------------------
--  DDL for Procedure ADVACOTHERDETAIL_TEMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
EXECUTE IMMEDIATE 'TRUNCATE TABLE RBL_TEMPDB.TempAdvAcOtherDetail';

INSERT INTO RBL_TEMPDB.TempAdvAcOtherDetail
			(AccountEntityId
			,GovGurAmt
			,SplCatg1Alt_Key
			,SplCatg2Alt_Key
			,RefinanceAgencyAlt_Key
			,RefinanceAmount
			,BankAlt_Key
			,TransferAmt
			,ProjectId
			,ConsortiumId
			,RefSystemAcId
			,AuthorisationStatus
			,EffectiveFromTimeKey
			,EffectiveToTimeKey
			,CreatedBy
			,DateCreated
			,ModifiedBy
			,DateModified
			,ApprovedBy
			,DateApproved
			,D2Ktimestamp
			,MocStatus
			,MocDate
			,SplCatg3Alt_Key
			,SplCatg4Alt_Key
			,MocTypeAlt_Key
			,GovGurExpDt
			)

SELECT		A.AccountEntityId
			,NULL GovGurAmt
			,NULL SplCatg1Alt_Key
			,NULL SplCatg2Alt_Key
			,NULL RefinanceAgencyAlt_Key
			,NULL RefinanceAmount
			,NULL BankAlt_Key
			,NULL TransferAmt
			,NULL ProjectId
			,NULL ConsortiumId
			,A.SystemACID RefSystemAcId
			,NULL AuthorisationStatus
			,A.EffectiveFromTimeKey EffectiveFromTimeKey
			,A.EffectiveToTimeKey EffectiveToTimeKey
			,A.CreatedBy CreatedBy
			,A.DateCreated DateCreated
			,NULL ModifiedBy
			,NULL DateModified
			,NULL ApprovedBy
			,NULL DateApproved
			,NULL D2Ktimestamp
			,NULL MocStatus
			,NULL MocDate
			,NULL SplCatg3Alt_Key
			,NULL SplCatg4Alt_Key
			,NULL MocTypeAlt_Key
			,NULL GovGurExpDt

FROM RBL_TEMPDB.TempAdvAcBasicDetail  A;

END;



/

  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACOTHERDETAIL_TEMP" TO "ADF_CDR_RBL_STGDB";
