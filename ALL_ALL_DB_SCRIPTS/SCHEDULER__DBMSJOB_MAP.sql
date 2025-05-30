--------------------------------------------------------
--  DDL for Table SCHEDULER$_DBMSJOB_MAP
--------------------------------------------------------

  CREATE TABLE "SYS"."SCHEDULER$_DBMSJOB_MAP" SHARING=METADATA 
   (	"DBMS_JOB_NUMBER" NUMBER, 
	"JOB_OWNER" VARCHAR2(128 BYTE), 
	"JOB_NAME" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
