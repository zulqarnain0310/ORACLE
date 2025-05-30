--------------------------------------------------------
--  DDL for Table BILL_SOURCESYSTEM_STG_ERROR_JAN2024
--------------------------------------------------------

  CREATE TABLE "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" 
   (	"DATEOFDATA" VARCHAR2(500 CHAR), 
	"ACCOUNTID" VARCHAR2(500 CHAR), 
	"BILLDT" VARCHAR2(500 CHAR), 
	"BILLAMT" VARCHAR2(500 CHAR), 
	"BILLREFNO" VARCHAR2(500 CHAR), 
	"SUBBILLRENO" VARCHAR2(500 CHAR), 
	"BILLPURDT" VARCHAR2(500 CHAR), 
	"ADVAMOUNT" VARCHAR2(500 CHAR), 
	"BILLDUEDT" VARCHAR2(500 CHAR), 
	"BILLEXTENDEDDUEDT" VARCHAR2(500 CHAR), 
	"CRYSTALISATIONDT" VARCHAR2(500 CHAR), 
	"COMMERCIALISATIONDT" VARCHAR2(500 CHAR), 
	"CURRENCYCODE" VARCHAR2(500 CHAR), 
	"BALANCEININR" VARCHAR2(500 CHAR), 
	"BALANCEINCURRENCY" VARCHAR2(500 CHAR), 
	"UNAPPLIEDINTT" VARCHAR2(500 CHAR), 
	"ADJDT" VARCHAR2(500 CHAR), 
	"ADJREASONCODE" VARCHAR2(500 CHAR), 
	"BILLUNDERLC_YN" VARCHAR2(500 CHAR), 
	"BILLPRODUCTCODE" VARCHAR2(500 CHAR), 
	"LCNO" VARCHAR2(500 CHAR), 
	"LCAMT" VARCHAR2(500 CHAR), 
	"LCISSUINGBANKCODE" VARCHAR2(500 CHAR), 
	"LCISSUINGBANK" VARCHAR2(500 CHAR), 
	"BILLNATURECODE" VARCHAR2(500 CHAR), 
	"ERRORCODE" NUMBER(10,0), 
	"ERRORCOLUMN" NUMBER(10,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."BILL_SOURCESYSTEM_STG_ERROR_JAN2024" TO "ADF_CDR_RBL_STGDB";
