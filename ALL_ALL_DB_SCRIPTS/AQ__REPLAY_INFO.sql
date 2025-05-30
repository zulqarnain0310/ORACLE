--------------------------------------------------------
--  DDL for Table AQ$_REPLAY_INFO
--------------------------------------------------------

  CREATE TABLE "SYS"."AQ$_REPLAY_INFO" SHARING=METADATA 
   (	"EVENTID" NUMBER, 
	"AGENT" "SYS"."AQ$_AGENT" , 
	"CORRELATIONID" VARCHAR2(128 BYTE), 
	"ACK" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
