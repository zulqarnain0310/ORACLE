--------------------------------------------------------
--  DDL for Table WRHS$_OPTIMIZER_ENV
--------------------------------------------------------

  CREATE TABLE "SYS"."WRHS$_OPTIMIZER_ENV" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"OPTIMIZER_ENV_HASH_VALUE" NUMBER, 
	"OPTIMIZER_ENV" RAW(2000), 
	"CON_DBID" NUMBER, 
	"PER_PDB" NUMBER, 
	"STAGE_INST_ID" NUMBER, 
	"STAGE_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
  GRANT DELETE ON "SYS"."WRHS$_OPTIMIZER_ENV" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRHS$_OPTIMIZER_ENV" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRHS$_OPTIMIZER_ENV" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRHS$_OPTIMIZER_ENV" TO "SYSUMF_ROLE";
