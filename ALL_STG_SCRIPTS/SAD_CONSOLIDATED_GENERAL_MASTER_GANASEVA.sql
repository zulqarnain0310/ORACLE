--------------------------------------------------------
--  DDL for Table SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA
--------------------------------------------------------

  CREATE TABLE "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" 
   (	"MAS_ID" VARCHAR2(30 CHAR), 
	"MAS_MASTERTYPE" VARCHAR2(30 CHAR), 
	"MAS_DELFLAG" VARCHAR2(30 CHAR), 
	"MAS_DESCRIPTION" VARCHAR2(30 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."SAD_CONSOLIDATED_GENERAL_MASTER_GANASEVA" TO "ADF_CDR_RBL_STGDB";
