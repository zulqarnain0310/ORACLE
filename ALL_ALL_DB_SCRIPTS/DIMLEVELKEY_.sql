--------------------------------------------------------
--  DDL for Table DIMLEVELKEY$
--------------------------------------------------------

  CREATE TABLE "SYS"."DIMLEVELKEY$" SHARING=METADATA 
   (	"DIMOBJ#" NUMBER, 
	"LEVELID#" NUMBER, 
	"KEYPOS#" NUMBER, 
	"DETAILOBJ#" NUMBER, 
	"COL#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
