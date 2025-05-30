--------------------------------------------------------
--  DDL for Table SCHEDULER$_STEP_STATE
--------------------------------------------------------

  CREATE TABLE "SYS"."SCHEDULER$_STEP_STATE" SHARING=METADATA 
   (	"JOB_OID" NUMBER, 
	"STEP_NAME" VARCHAR2(128 BYTE), 
	"STATUS" CHAR(1 BYTE), 
	"ERROR_CODE" NUMBER, 
	"START_DATE" TIMESTAMP (6) WITH TIME ZONE, 
	"END_DATE" TIMESTAMP (6) WITH TIME ZONE, 
	"JOB_STEP_OID" NUMBER, 
	"JOB_STEP_LOG_ID" NUMBER, 
	"DESTINATION" VARCHAR2(261 BYTE), 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
