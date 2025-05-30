--------------------------------------------------------
--  DDL for Table WRI$_ADV_ADDM_FDG
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_ADV_ADDM_FDG" SHARING=METADATA 
   (	"TASK_ID" NUMBER, 
	"FINDING_ID" NUMBER, 
	"RULE_ID" NUMBER, 
	"ADDM_FDG_ID" NUMBER, 
	"ADDM_SEQ" NUMBER, 
	"DATABASE_TIME" NUMBER, 
	"ACTIVE_SESSIONS" NUMBER, 
	"PERC_ACTIVE_SESS" NUMBER, 
	"IS_AGGREGATE" CHAR(1 BYTE), 
	"METER_LEVEL" VARCHAR2(6 BYTE), 
	"QUERY_TYPE" NUMBER, 
	"QUERY_IS_APPROX" CHAR(1 BYTE), 
	"QUERY_ARGS" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
