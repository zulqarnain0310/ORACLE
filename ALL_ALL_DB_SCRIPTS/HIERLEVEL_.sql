--------------------------------------------------------
--  DDL for Table HIERLEVEL$
--------------------------------------------------------

  CREATE TABLE "SYS"."HIERLEVEL$" SHARING=METADATA 
   (	"DIMOBJ#" NUMBER, 
	"HIERID#" NUMBER, 
	"POS#" NUMBER, 
	"LEVELID#" NUMBER, 
	"JOINKEYID#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
