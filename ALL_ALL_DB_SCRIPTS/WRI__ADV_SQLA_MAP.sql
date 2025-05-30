--------------------------------------------------------
--  DDL for Table WRI$_ADV_SQLA_MAP
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_ADV_SQLA_MAP" SHARING=METADATA 
   (	"TASK_ID" NUMBER, 
	"WORKLOAD_ID" NUMBER, 
	"NAME" VARCHAR2(128 BYTE), 
	"IS_STS" NUMBER, 
	"REF_ID" NUMBER, 
	"CHILD_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
