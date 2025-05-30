--------------------------------------------------------
--  DDL for Table WRR$_REPLAY_REFERENCES
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_REPLAY_REFERENCES" SHARING=METADATA 
   (	"SCHEDULE_CAP_ID" NUMBER DEFAULT 0, 
	"FILE_ID" NUMBER, 
	"REFS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING
  TABLESPACE "SYSAUX" ;
