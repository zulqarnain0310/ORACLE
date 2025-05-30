--------------------------------------------------------
--  DDL for Table WRR$_REPLAY_DATA
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_REPLAY_DATA" SHARING=METADATA 
   (	"SCHEDULE_CAP_ID" NUMBER DEFAULT 0, 
	"FILE_ID" NUMBER, 
	"CALL_CTR" NUMBER, 
	"RANK" NUMBER, 
	"DATA_TYPE" NUMBER, 
	"VALUE" RAW(255)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING
  TABLESPACE "SYSAUX" ;
