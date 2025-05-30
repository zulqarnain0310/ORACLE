--------------------------------------------------------
--  DDL for Table ILM_RESULTS$
--------------------------------------------------------

  CREATE TABLE "SYS"."ILM_RESULTS$" SHARING=METADATA 
   (	"EXECUTION_ID" NUMBER, 
	"JOBNAME" VARCHAR2(128 BYTE), 
	"JOBTYPE" NUMBER, 
	"JOBTYPE1" NUMBER, 
	"JOB_STATUS" NUMBER, 
	"START_TIME" TIMESTAMP (6), 
	"COMPLETION_TIME" TIMESTAMP (6), 
	"PAYLOAD" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"STATISTICS" CLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(4000 BYTE), 
	"SPARE5" VARCHAR2(4000 BYTE), 
	"SPARE6" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" 
 LOB ("STATISTICS") STORE AS SECUREFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
