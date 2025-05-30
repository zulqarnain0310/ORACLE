--------------------------------------------------------
--  DDL for Table ALL_ACCTBAL_INTRATE
--------------------------------------------------------

  CREATE TABLE "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" 
   (	"ACCOUNT_NO" NUMBER(10,0), 
	"RATE_DATE" VARCHAR2(200 CHAR), 
	"DEBIT_RATE_OF_INTEREST" NUMBER(3,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ROLE_ALL_DB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ROLE_ALL_DB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ROLE_ALL_DB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ROLE_ALL_DB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ROLE_ALL_DB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "MAIN_PRO";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."ALL_ACCTBAL_INTRATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
