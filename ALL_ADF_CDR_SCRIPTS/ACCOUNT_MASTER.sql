--------------------------------------------------------
--  DDL for Table ACCOUNT_MASTER
--------------------------------------------------------

  CREATE TABLE "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" 
   (	"DATEOFDATA" VARCHAR2(200 CHAR), 
	"SOURCESYSTEM" VARCHAR2(30 CHAR), 
	"BRANCHCODE" VARCHAR2(30 CHAR), 
	"UCIC" VARCHAR2(30 CHAR), 
	"CUSTOMER_CODE" VARCHAR2(30 CHAR), 
	"ACCOUNT_NO" VARCHAR2(30 CHAR), 
	"AC_OPEN_DT" VARCHAR2(200 CHAR), 
	"SCHEME_TYPE" VARCHAR2(30 CHAR), 
	"PRODUCT_CODE" VARCHAR2(30 CHAR), 
	"ACCT_BUSINESS_SEGMENT" VARCHAR2(20 CHAR), 
	"ACCOUNT_TYPE" VARCHAR2(30 CHAR), 
	"GL_SUB_HEAD_CODE" VARCHAR2(30 CHAR), 
	"PSL_CODE_SECTOR" VARCHAR2(50 CHAR), 
	"DRAWING_POWER" NUMBER(16,0), 
	"ADVANCE_PURPOSE" VARCHAR2(30 CHAR), 
	"SCHEMETYPE" VARCHAR2(30 CHAR), 
	"CURRENCYCODE" VARCHAR2(10 CHAR), 
	"LIMIT_REVIEW_DATE" VARCHAR2(200 CHAR), 
	"LIMIT_EXPIRY_DATE" VARCHAR2(200 CHAR), 
	"ACID" VARCHAR2(30 CHAR), 
	"BRANCH_CODE" VARCHAR2(30 CHAR), 
	"OPENING_DATE" VARCHAR2(200 CHAR), 
	"PSL_CODE" VARCHAR2(30 CHAR), 
	"CURRENCY_CODE" VARCHAR2(30 CHAR), 
	"LAST_CREDIT_TRAN_DATE" VARCHAR2(200 CHAR), 
	"RM" VARCHAR2(30 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ROLE_ALL_DB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ROLE_ALL_DB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ROLE_ALL_DB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ROLE_ALL_DB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ROLE_ALL_DB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "MAIN_PRO";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ACCOUNT_MASTER" TO "DATAUPLOAD_RBL_MISDB_PROD";
