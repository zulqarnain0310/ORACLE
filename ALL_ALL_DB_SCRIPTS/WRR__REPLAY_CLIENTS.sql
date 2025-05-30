--------------------------------------------------------
--  DDL for Table WRR$_REPLAY_CLIENTS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_REPLAY_CLIENTS" SHARING=METADATA 
   (	"WRC_ID" NUMBER(*,0), 
	"SCHEDULE_CAP_ID" NUMBER(*,0), 
	"INST_ID" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
