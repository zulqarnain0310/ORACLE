--------------------------------------------------------
--  DDL for Table ACCOUNTLVLMOCDETAILS_STG
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" 
   (	"SLNO" CLOB, 
	"ACCOUNTID" CLOB, 
	"POSINRS" CLOB, 
	"INTERESTRECEIVABLEINRS" CLOB, 
	"ADDITIONALPROVISIONABSOLUTEINRS" CLOB, 
	"RESTRUCTUREFLAGYN" CLOB, 
	"RESTRUCTUREDATE" CLOB, 
	"FITLFLAGYN" CLOB, 
	"DFVAMOUNT" CLOB, 
	"REPOSSESSSIONFLAGYN" CLOB, 
	"REPOSSESSIONDATE" CLOB, 
	"INHERENTWEAKNESSFLAG" CLOB, 
	"INHERENTWEAKNESSDATE" CLOB, 
	"SARFAESIFLAG" CLOB, 
	"SARFAESIDATE" CLOB, 
	"UNUSUALBOUNCEFLAG" CLOB, 
	"UNUSUALBOUNCEDATE" CLOB, 
	"UNCLEAREDEFFECTSFLAG" CLOB, 
	"UNCLEAREDEFFECTSDATE" CLOB, 
	"FRAUDFLAG" CLOB, 
	"FRAUDDATE" CLOB, 
	"TWOFLAG" CLOB, 
	"TWODATE" CLOB, 
	"TWOAMOUNT" CLOB, 
	"SOURCESYSTEM" CLOB, 
	"MOCSOURCE" CLOB, 
	"MOCREASON" CLOB, 
	"FILNAME" CLOB, 
	"SOURCEALT_KEY" CLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("SLNO") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("ACCOUNTID") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("POSINRS") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("INTERESTRECEIVABLEINRS") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("ADDITIONALPROVISIONABSOLUTEINRS") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("RESTRUCTUREFLAGYN") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("RESTRUCTUREDATE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("FITLFLAGYN") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("DFVAMOUNT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("REPOSSESSSIONFLAGYN") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("REPOSSESSIONDATE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("INHERENTWEAKNESSFLAG") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("INHERENTWEAKNESSDATE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("SARFAESIFLAG") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("SARFAESIDATE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("UNUSUALBOUNCEFLAG") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("UNUSUALBOUNCEDATE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("UNCLEAREDEFFECTSFLAG") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("UNCLEAREDEFFECTSDATE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("FRAUDFLAG") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("FRAUDDATE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("TWOFLAG") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("TWODATE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("TWOAMOUNT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("SOURCESYSTEM") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("MOCSOURCE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("MOCREASON") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("FILNAME") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("SOURCEALT_KEY") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACCOUNTLVLMOCDETAILS_STG" TO "ADF_CDR_RBL_STGDB";
