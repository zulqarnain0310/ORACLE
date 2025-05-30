--------------------------------------------------------
--  DDL for Table OS_PERFORMANCE_COUNTERS_SNAPSHOT
--------------------------------------------------------

  CREATE TABLE "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" 
   (	"NAME" NVARCHAR2(128), 
	"VALUE" NUMBER(18,0), 
	"OBJECT" NVARCHAR2(128), 
	"INSTANCE_NAME" NVARCHAR2(128), 
	"TYPE" NUMBER(10,0), 
	"START_TIME" VARCHAR2(200 CHAR), 
	"END_TIME" VARCHAR2(200 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "MAIN_PRO";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_ALL_DB";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_ALL_DB";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_ALL_DB";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_ALL_DB";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_ALL_DB";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_STGDB";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "QPI_RBL_MISDB_PROD"."OS_PERFORMANCE_COUNTERS_SNAPSHOT" TO "ADF_CDR_RBL_STGDB";
