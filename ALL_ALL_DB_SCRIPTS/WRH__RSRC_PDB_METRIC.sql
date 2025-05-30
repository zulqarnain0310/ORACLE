--------------------------------------------------------
--  DDL for Table WRH$_RSRC_PDB_METRIC
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_RSRC_PDB_METRIC" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"BEGIN_TIME" TIMESTAMP (3), 
	"END_TIME" TIMESTAMP (3), 
	"INTSIZE_CSEC" NUMBER, 
	"SEQUENCE#" NUMBER, 
	"CPU_CONSUMED_TIME" NUMBER, 
	"CPU_WAIT_TIME" NUMBER, 
	"IO_REQUESTS" NUMBER, 
	"IO_MEGABYTES" NUMBER, 
	"IO_REQUESTS_THROTTLE_EXEMPT" NUMBER, 
	"IO_MEGABYTES_THROTTLE_EXEMPT" NUMBER, 
	"IO_THROTTLE_TIME" NUMBER, 
	"PQ_ACTIVE_TIME" NUMBER, 
	"PQ_QUEUED_TIME" NUMBER, 
	"PS_ACTIVE_TIME" NUMBER, 
	"PS_QUEUED_TIME" NUMBER, 
	"SGA_BYTES" NUMBER, 
	"BUFFER_CACHE_BYTES" NUMBER, 
	"SHARED_POOL_BYTES" NUMBER, 
	"PGA_BYTES" NUMBER, 
	"CON_DBID" NUMBER DEFAULT 0, 
	"PER_PDB" NUMBER DEFAULT null, 
	"PLAN_ID" NUMBER DEFAULT null, 
	"OS_NUM_CPUS" NUMBER DEFAULT 0, 
	"MAX_AVG_RNG_SESS" NUMBER DEFAULT 0
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT DELETE ON "SYS"."WRH$_RSRC_PDB_METRIC" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRH$_RSRC_PDB_METRIC" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRH$_RSRC_PDB_METRIC" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRH$_RSRC_PDB_METRIC" TO "SYSUMF_ROLE";
