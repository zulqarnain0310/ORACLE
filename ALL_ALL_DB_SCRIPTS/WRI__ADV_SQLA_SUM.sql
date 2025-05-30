--------------------------------------------------------
--  DDL for Table WRI$_ADV_SQLA_SUM
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_ADV_SQLA_SUM" SHARING=METADATA 
   (	"TASK_ID" NUMBER, 
	"NUM_SELECT" NUMBER, 
	"NUM_INSERT" NUMBER, 
	"NUM_DELETE" NUMBER, 
	"NUM_UPDATE" NUMBER, 
	"NUM_MERGE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
