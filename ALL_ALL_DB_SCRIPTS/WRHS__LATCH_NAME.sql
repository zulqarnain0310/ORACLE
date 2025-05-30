--------------------------------------------------------
--  DDL for Table WRHS$_LATCH_NAME
--------------------------------------------------------

  CREATE TABLE "SYS"."WRHS$_LATCH_NAME" SHARING=METADATA 
   (	"DBID" NUMBER, 
	"LATCH_HASH" NUMBER, 
	"LATCH_NAME" VARCHAR2(64 BYTE), 
	"LATCH#" NUMBER, 
	"CON_DBID" NUMBER, 
	"PER_PDB" NUMBER, 
	"STAGE_INST_ID" NUMBER, 
	"STAGE_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
  GRANT DELETE ON "SYS"."WRHS$_LATCH_NAME" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRHS$_LATCH_NAME" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRHS$_LATCH_NAME" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRHS$_LATCH_NAME" TO "SYSUMF_ROLE";
