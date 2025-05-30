--------------------------------------------------------
--  DDL for Table WRR$_WORKLOAD_GROUPS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_WORKLOAD_GROUPS" SHARING=METADATA 
   (	"GID" NUMBER(*,0), 
	"CONCURRENCY" NUMBER(*,0), 
	"NUM_FILES" NUMBER(*,0), 
	"NUM_CALLS" NUMBER(*,0), 
	"DB_TIME" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
