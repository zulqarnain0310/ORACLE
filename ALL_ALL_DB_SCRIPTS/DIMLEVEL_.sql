--------------------------------------------------------
--  DDL for Table DIMLEVEL$
--------------------------------------------------------

  CREATE TABLE "SYS"."DIMLEVEL$" SHARING=METADATA 
   (	"DIMOBJ#" NUMBER, 
	"LEVELID#" NUMBER, 
	"LEVELNAME" VARCHAR2(128 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" DATE, 
	"FLAGS" NUMBER DEFAULT 0    /* flags: 0x01 = SKIP WHEN NULL */
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
