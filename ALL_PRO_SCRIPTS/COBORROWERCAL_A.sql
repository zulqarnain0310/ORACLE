--------------------------------------------------------
--  DDL for Table COBORROWERCAL_A
--------------------------------------------------------

  CREATE TABLE "MAIN_PRO"."COBORROWERCAL_A" 
   (	"BORROWER_NAME" NVARCHAR2(255), 
	"CUST_ID" VARCHAR2(50 CHAR), 
	"UCIC" VARCHAR2(50 CHAR), 
	"ACCOUNT_NO" VARCHAR2(30 CHAR), 
	"TYPE" NVARCHAR2(255), 
	"COHORT_NO#" NUMBER(5,0), 
	"INITIALASSETCLASS_ALTKEY" NUMBER(5,0), 
	"FINALASSETCLASS_ALTKEY" NUMBER(5,0), 
	"INITIALNPADT" VARCHAR2(200 CHAR), 
	"FINALNPADT" VARCHAR2(200 CHAR), 
	"DPD" NUMBER(5,0), 
	"MAINCUSTID" VARCHAR2(30 CHAR), 
	"DEGRADEREASON" VARCHAR2(50 CHAR), 
	"FLGUPG" CHAR(1 CHAR), 
	"ASSET_NORM" VARCHAR2(10 CHAR), 
	"COBORRLEVEL" NUMBER(5,0), 
	"COHORT_NEW" VARCHAR2(30 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "MAIN_PRO"."COBORROWERCAL_A"."BORROWER_NAME" IS 'ORIGINAL NAME:Borrower Name';
   COMMENT ON COLUMN "MAIN_PRO"."COBORROWERCAL_A"."COHORT_NO#" IS 'ORIGINAL NAME:Cohort No#';
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_ALL_DB";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_ALL_DB";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_ALL_DB";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_ALL_DB";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_ALL_DB";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."COBORROWERCAL_A" TO "ADF_CDR_RBL_STGDB";
