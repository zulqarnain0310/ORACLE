--------------------------------------------------------
--  DDL for Table OPATCH_INST_JOB
--------------------------------------------------------

  CREATE TABLE "SYS"."OPATCH_INST_JOB" SHARING=METADATA 
   (	"INST_ID" NUMBER, 
	"NODE_NAME" VARCHAR2(128 BYTE), 
	"INST_NAME" VARCHAR2(128 BYTE), 
	"INST_JOB" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
