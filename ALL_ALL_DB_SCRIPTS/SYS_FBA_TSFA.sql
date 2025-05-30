--------------------------------------------------------
--  DDL for Table SYS_FBA_TSFA
--------------------------------------------------------

  CREATE TABLE "SYS"."SYS_FBA_TSFA" SHARING=METADATA 
   (	"FA#" NUMBER, 
	"TS#" NUMBER, 
	"QUOTA" NUMBER, 
	"FLAGS" NUMBER, 
	"SPARE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
