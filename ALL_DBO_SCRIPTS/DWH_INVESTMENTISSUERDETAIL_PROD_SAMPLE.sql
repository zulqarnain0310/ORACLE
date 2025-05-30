--------------------------------------------------------
--  DDL for Table DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" 
   (	"DATE_OF_DATA" VARCHAR2(200 CHAR), 
	"SOURCE_SYSTEM_NAME" VARCHAR2(30 CHAR), 
	"BRANCH_CODE" VARCHAR2(100 CHAR), 
	"UCIC_ID" VARCHAR2(20 CHAR), 
	"ISSUERID" VARCHAR2(20 CHAR), 
	"ISSUUERNAME" VARCHAR2(100 CHAR), 
	"REF_TXN_SYS_CUST_ID" VARCHAR2(256 CHAR), 
	"PAN" VARCHAR2(20 CHAR), 
	"ISSUER_CATEGORY_CODE" VARCHAR2(64 CHAR), 
	"GRPENTITYOFBANK" CHAR(1 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DWH_INVESTMENTISSUERDETAIL_PROD_SAMPLE" TO "ADF_CDR_RBL_STGDB";
