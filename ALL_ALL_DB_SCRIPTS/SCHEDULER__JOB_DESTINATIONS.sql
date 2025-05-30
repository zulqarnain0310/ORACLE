--------------------------------------------------------
--  DDL for Table SCHEDULER$_JOB_DESTINATIONS
--------------------------------------------------------

  CREATE TABLE "SYS"."SCHEDULER$_JOB_DESTINATIONS" SHARING=METADATA 
   (	"OID" NUMBER, 
	"JOB_DEST_ID" NUMBER, 
	"CREDOID" NUMBER, 
	"CREDENTIAL" VARCHAR2(261 BYTE), 
	"DESTOID" NUMBER, 
	"DESTINATION" VARCHAR2(261 BYTE), 
	"JOB_STATUS" NUMBER, 
	"NEXT_START_DATE" TIMESTAMP (6) WITH TIME ZONE, 
	"RUN_COUNT" NUMBER, 
	"RETRY_COUNT" NUMBER, 
	"FAILURE_COUNT" NUMBER, 
	"LAST_ENABLED_TIME" TIMESTAMP (6) WITH TIME ZONE, 
	"LAST_START_DATE" TIMESTAMP (6) WITH TIME ZONE, 
	"LAST_END_DATE" TIMESTAMP (6) WITH TIME ZONE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
