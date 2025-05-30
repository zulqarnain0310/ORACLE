--------------------------------------------------------
--  DDL for Table DIMATTR$
--------------------------------------------------------

  CREATE TABLE "SYS"."DIMATTR$" SHARING=METADATA 
   (	"DIMOBJ#" NUMBER, 
	"LEVELID#" NUMBER, 
	"DETAILOBJ#" NUMBER, 
	"COL#" NUMBER, 
	"ATTNAME" VARCHAR2(128 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
