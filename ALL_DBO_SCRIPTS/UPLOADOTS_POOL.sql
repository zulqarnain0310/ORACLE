--------------------------------------------------------
--  DDL for Table UPLOADOTS_POOL
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."UPLOADOTS_POOL" 
   (	"ENTITY_KEY" NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"SRNO" CLOB, 
	"ACCOUNTNUMBER" CLOB, 
	"DATEOFAPPROVALOFSETTLEMENT" CLOB, 
	"APPROVINGAUTHORITY" CLOB, 
	"PRINCIPALOUTSTANDINGATTHETIMEOFSETTLEMENT" CLOB, 
	"INTERESTDUEATTHETIMEOFSETTLEMENT" CLOB, 
	"FEESCHARGESDUEATTHETIMEOFSETTLEMENT" CLOB, 
	"SETTLEMENTAMOUNT" CLOB, 
	"PRINCIPALSACRIFICE" CLOB, 
	"INTERESTWAIVER" CLOB, 
	"FEEWAIVER" CLOB, 
	"SETTLEMENTFAILURE" CLOB, 
	"ACTION" CLOB, 
	"ACCOUNTCLOSUREDATEINSYSTEM" CLOB, 
	"FILNAME" CLOB, 
	"ERRORMESSAGE" CLOB, 
	"ERRORINCOLUMN" CLOB, 
	"SRNOOFERRONEOUSROWS" CLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("SRNO") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("ACCOUNTNUMBER") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("DATEOFAPPROVALOFSETTLEMENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("APPROVINGAUTHORITY") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("PRINCIPALOUTSTANDINGATTHETIMEOFSETTLEMENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("INTERESTDUEATTHETIMEOFSETTLEMENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("FEESCHARGESDUEATTHETIMEOFSETTLEMENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("SETTLEMENTAMOUNT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("PRINCIPALSACRIFICE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("INTERESTWAIVER") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("FEEWAIVER") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("SETTLEMENTFAILURE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("ACTION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("ACCOUNTCLOSUREDATEINSYSTEM") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("FILNAME") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("ERRORMESSAGE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("ERRORINCOLUMN") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("SRNOOFERRONEOUSROWS") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."UPLOADOTS_POOL" TO "ADF_CDR_RBL_STGDB";
