--------------------------------------------------------
--  DDL for Table WRR$_REPLAY_FILES
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_REPLAY_FILES" SHARING=METADATA 
   (	"CAP_FILE_ID" NUMBER(*,0), 
	"SCHEDULE_CAP_ID" NUMBER(*,0) DEFAULT 0, 
	"REP_FILE_ID" NUMBER(*,0) DEFAULT 0, 
	"GID" NUMBER(*,0), 
	"NUM_CALLS" NUMBER(*,0), 
	"DB_TIME" NUMBER(*,0), 
	"INST_ID" NUMBER(*,0) DEFAULT 0, 
	"STATUS" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
