--------------------------------------------------------
--  DDL for Table FED$DEPENDENCY
--------------------------------------------------------

  CREATE TABLE "SYS"."FED$DEPENDENCY" SHARING=METADATA 
   (	"APPID#" NUMBER, 
	"PARENT_APPID#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" VARCHAR2(1000 BYTE), 
	"SPARE3" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
