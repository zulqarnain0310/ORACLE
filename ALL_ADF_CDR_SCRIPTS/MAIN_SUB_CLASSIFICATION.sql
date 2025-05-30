--------------------------------------------------------
--  DDL for Table MAIN_SUB_CLASSIFICATION
--------------------------------------------------------

  CREATE TABLE "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" 
   (	"SUB_CLASSIFICATION_USER" VARCHAR2(30 CHAR), 
	"NPA_DATE" VARCHAR2(200 CHAR), 
	"FORACID" NUMBER(10,0), 
	"ASSET_CLASSIFICATION" VARCHAR2(30 CHAR), 
	"SECURED_UNSECURED" VARCHAR2(30 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ROLE_ALL_DB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ROLE_ALL_DB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ROLE_ALL_DB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ROLE_ALL_DB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ROLE_ALL_DB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "MAIN_PRO";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "ADF_CDR_RBL_STGDB"."MAIN_SUB_CLASSIFICATION" TO "DATAUPLOAD_RBL_MISDB_PROD";
