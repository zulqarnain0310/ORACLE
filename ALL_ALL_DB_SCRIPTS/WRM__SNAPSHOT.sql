--------------------------------------------------------
--  DDL for Table WRM$_SNAPSHOT
--------------------------------------------------------

  CREATE TABLE "SYS"."WRM$_SNAPSHOT" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"STARTUP_TIME" TIMESTAMP (3), 
	"BEGIN_INTERVAL_TIME" TIMESTAMP (3), 
	"END_INTERVAL_TIME" TIMESTAMP (3), 
	"FLUSH_ELAPSED" INTERVAL DAY (5) TO SECOND (1), 
	"SNAP_LEVEL" NUMBER, 
	"STATUS" NUMBER, 
	"ERROR_COUNT" NUMBER, 
	"BL_MOVED" NUMBER, 
	"SNAP_FLAG" NUMBER, 
	"SNAP_TIMEZONE" INTERVAL DAY (0) TO SECOND (0), 
	"BEGIN_INTERVAL_TIME_TZ" TIMESTAMP (3) WITH TIME ZONE, 
	"END_INTERVAL_TIME_TZ" TIMESTAMP (3) WITH TIME ZONE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT DELETE ON "SYS"."WRM$_SNAPSHOT" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRM$_SNAPSHOT" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRM$_SNAPSHOT" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRM$_SNAPSHOT" TO "SYSUMF_ROLE";
