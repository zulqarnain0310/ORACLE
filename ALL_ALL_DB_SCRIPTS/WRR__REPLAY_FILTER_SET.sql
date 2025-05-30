--------------------------------------------------------
--  DDL for Table WRR$_REPLAY_FILTER_SET
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_REPLAY_FILTER_SET" SHARING=METADATA 
   (	"CAPTURE_ID" NUMBER, 
	"SET_NAME" VARCHAR2(1000 BYTE), 
	"FILTER_NAME" VARCHAR2(100 BYTE), 
	"ATTRIBUTE" VARCHAR2(100 BYTE), 
	"VALUE" VARCHAR2(4000 BYTE), 
	"DEFAULT_ACTION" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
