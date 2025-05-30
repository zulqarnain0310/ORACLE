--------------------------------------------------------
--  DDL for Table WRR$_REPLAY_COMMITS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_REPLAY_COMMITS" SHARING=METADATA 
   (	"SCHEDULE_CAP_ID" NUMBER DEFAULT 0, 
	"FILE_ID" NUMBER, 
	"CALL_CTR" NUMBER, 
	"DB_SEQ" NUMBER, 
	"VALID" VARCHAR2(1 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING
  TABLESPACE "SYSAUX" ;
