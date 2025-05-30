--------------------------------------------------------
--  DDL for Table SYS_FBA_APP
--------------------------------------------------------

  CREATE TABLE "SYS"."SYS_FBA_APP" SHARING=METADATA 
   (	"APPNAME" VARCHAR2(255 BYTE), 
	"APP#" NUMBER, 
	"FA#" NUMBER, 
	"FLAGS" NUMBER, 
	"SPARE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
