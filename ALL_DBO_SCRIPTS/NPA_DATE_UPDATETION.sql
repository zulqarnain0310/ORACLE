--------------------------------------------------------
--  DDL for Table NPA_DATE_UPDATETION
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" 
   (	"UCIC" VARCHAR2(50 CHAR), 
	"CIF_ID" VARCHAR2(50 CHAR), 
	"ACCOUNT_NO" VARCHAR2(50 CHAR), 
	"NPA_DATE_MARCH_DATE_TO_BE_TAKEN" VARCHAR2(50 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "RBL_MISDB_PROD"."NPA_DATE_UPDATETION"."CIF_ID" IS 'ORIGINAL NAME:CIF ID';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."NPA_DATE_UPDATETION"."ACCOUNT_NO" IS 'ORIGINAL NAME:Account No ';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."NPA_DATE_UPDATETION"."NPA_DATE_MARCH_DATE_TO_BE_TAKEN" IS 'ORIGINAL NAME:npa date march date to be taken';
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."NPA_DATE_UPDATETION" TO "ADF_CDR_RBL_STGDB";
