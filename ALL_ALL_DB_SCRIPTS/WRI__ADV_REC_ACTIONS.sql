--------------------------------------------------------
--  DDL for Table WRI$_ADV_REC_ACTIONS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_ADV_REC_ACTIONS" SHARING=METADATA 
   (	"TASK_ID" NUMBER, 
	"REC_ID" NUMBER, 
	"ACT_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT DELETE ON "SYS"."WRI$_ADV_REC_ACTIONS" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRI$_ADV_REC_ACTIONS" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRI$_ADV_REC_ACTIONS" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRI$_ADV_REC_ACTIONS" TO "SYSUMF_ROLE";
