--------------------------------------------------------
--  DDL for Table WRR$_USER_MAP
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_USER_MAP" SHARING=METADATA 
   (	"REPLAY_ID" NUMBER, 
	"SCHEDULE_CAP_ID" NUMBER, 
	"CAPTURE_USER" VARCHAR2(4000 BYTE), 
	"REPLAY_USER" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
