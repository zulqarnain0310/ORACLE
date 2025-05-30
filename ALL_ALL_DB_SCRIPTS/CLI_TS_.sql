--------------------------------------------------------
--  DDL for Table CLI_TS$
--------------------------------------------------------

  CREATE TABLE "SYS"."CLI_TS$" SHARING=METADATA 
   (	"GUID" VARCHAR2(32 BYTE), 
	"USER#" NUMBER, 
	"LOG#" NUMBER, 
	"TS#" NUMBER, 
	"FLAGS" NUMBER, 
	"NUM_PARTS" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
