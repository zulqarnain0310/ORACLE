--------------------------------------------------------
--  DDL for Table MANUAL_NPA
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."MANUAL_NPA" 
   (	"CUSTOMER_ID" NVARCHAR2(255), 
	"CUSTOMER_NAME" NVARCHAR2(255), 
	"ACCOUNT_NO" NVARCHAR2(255), 
	"NPA_MANUAL_AUTOMATIC" NVARCHAR2(255), 
	"REASON" NVARCHAR2(255), 
	"SOURCE_SYSTEM" NVARCHAR2(255), 
	"DATE_OF_DATA" VARCHAR2(200 CHAR), 
	"VALID_UPTO" VARCHAR2(200 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "RBL_MISDB_PROD"."MANUAL_NPA"."CUSTOMER_ID" IS 'ORIGINAL NAME:Customer ID';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."MANUAL_NPA"."CUSTOMER_NAME" IS 'ORIGINAL NAME:Customer Name';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."MANUAL_NPA"."ACCOUNT_NO" IS 'ORIGINAL NAME:Account No';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."MANUAL_NPA"."NPA_MANUAL_AUTOMATIC" IS 'ORIGINAL NAME:NPA (Manual/Automatic)';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."MANUAL_NPA"."SOURCE_SYSTEM" IS 'ORIGINAL NAME:Source system';
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."MANUAL_NPA" TO "ADF_CDR_RBL_STGDB";
