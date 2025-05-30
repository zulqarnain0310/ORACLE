--------------------------------------------------------
--  DDL for Table WRH$_SQL_WORKAREA_HISTOGRAM
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_SQL_WORKAREA_HISTOGRAM" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"LOW_OPTIMAL_SIZE" NUMBER, 
	"HIGH_OPTIMAL_SIZE" NUMBER, 
	"OPTIMAL_EXECUTIONS" NUMBER, 
	"ONEPASS_EXECUTIONS" NUMBER, 
	"MULTIPASSES_EXECUTIONS" NUMBER, 
	"TOTAL_EXECUTIONS" NUMBER, 
	"CON_DBID" NUMBER DEFAULT 0, 
	"PER_PDB" NUMBER DEFAULT null
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT DELETE ON "SYS"."WRH$_SQL_WORKAREA_HISTOGRAM" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRH$_SQL_WORKAREA_HISTOGRAM" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRH$_SQL_WORKAREA_HISTOGRAM" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRH$_SQL_WORKAREA_HISTOGRAM" TO "SYSUMF_ROLE";
