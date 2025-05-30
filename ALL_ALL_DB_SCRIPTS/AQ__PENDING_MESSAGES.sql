--------------------------------------------------------
--  DDL for Table AQ$_PENDING_MESSAGES
--------------------------------------------------------

  CREATE TABLE "SYS"."AQ$_PENDING_MESSAGES" SHARING=METADATA 
   (	"SEQUENCE" NUMBER, 
	"MSGID" RAW(16), 
	"COPY" NUMBER, 
	"PMSGID" RAW(16), 
	"TXNID" VARCHAR2(22 BYTE), 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
