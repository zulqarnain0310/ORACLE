--------------------------------------------------------
--  DDL for Table LOC$
--------------------------------------------------------

  CREATE TABLE "SYS"."LOC$" SHARING=METADATA 
   (	"LOCATION_NAME" VARCHAR2(256 BYTE), 
	"EMON#" NUMBER, 
	"CONNECTION#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
