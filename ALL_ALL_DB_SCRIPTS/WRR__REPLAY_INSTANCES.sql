--------------------------------------------------------
--  DDL for Table WRR$_REPLAY_INSTANCES
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_REPLAY_INSTANCES" SHARING=METADATA 
   (	"REPLAY_DIR_NUMBER" NUMBER(*,0), 
	"INST_ID" NUMBER(*,0), 
	"CONCURRENCY" NUMBER(*,0), 
	"DB_TIME" NUMBER(*,0), 
	"NUM_CALLS" NUMBER(*,0), 
	"NUM_FILES" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
