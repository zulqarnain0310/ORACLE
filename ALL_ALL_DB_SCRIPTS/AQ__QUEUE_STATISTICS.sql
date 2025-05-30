--------------------------------------------------------
--  DDL for Table AQ$_QUEUE_STATISTICS
--------------------------------------------------------

  CREATE TABLE "SYS"."AQ$_QUEUE_STATISTICS" SHARING=METADATA 
   (	"EVENTID" NUMBER, 
	"OWNER_INST" NUMBER, 
	"INCARN_NUM" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
