--------------------------------------------------------
--  DDL for Table XSTREAM$_PARAMETERS
--------------------------------------------------------

  CREATE TABLE "SYS"."XSTREAM$_PARAMETERS" SHARING=METADATA 
   (	"SERVER_NAME" VARCHAR2(128 BYTE), 
	"SERVER_TYPE" NUMBER, 
	"POSITION" NUMBER, 
	"PARAM_KEY" VARCHAR2(100 BYTE), 
	"SCHEMA_NAME" VARCHAR2(128 BYTE), 
	"OBJECT_NAME" VARCHAR2(128 BYTE), 
	"USER_NAME" VARCHAR2(128 BYTE), 
	"CREATION_TIME" TIMESTAMP (6), 
	"MODIFICATION_TIME" TIMESTAMP (6), 
	"FLAGS" NUMBER, 
	"DETAILS" CLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" TIMESTAMP (6), 
	"SPARE5" VARCHAR2(4000 BYTE), 
	"SPARE6" VARCHAR2(4000 BYTE), 
	"SPARE7" RAW(64), 
	"SPARE8" DATE, 
	"SPARE9" CLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("DETAILS") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("SPARE9") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
