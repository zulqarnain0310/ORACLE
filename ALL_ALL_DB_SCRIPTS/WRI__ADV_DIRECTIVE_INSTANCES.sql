--------------------------------------------------------
--  DDL for Table WRI$_ADV_DIRECTIVE_INSTANCES
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_ADV_DIRECTIVE_INSTANCES" SHARING=METADATA 
   (	"DIR_ID" NUMBER, 
	"INST_ID" NUMBER, 
	"NAME" VARCHAR2(128 BYTE), 
	"TASK_ID" NUMBER, 
	"DATA" CLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" 
 LOB ("DATA") STORE AS SECUREFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
  GRANT DELETE ON "SYS"."WRI$_ADV_DIRECTIVE_INSTANCES" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRI$_ADV_DIRECTIVE_INSTANCES" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRI$_ADV_DIRECTIVE_INSTANCES" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRI$_ADV_DIRECTIVE_INSTANCES" TO "SYSUMF_ROLE";
