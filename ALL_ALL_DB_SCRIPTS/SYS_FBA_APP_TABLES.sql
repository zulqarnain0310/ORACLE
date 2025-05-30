--------------------------------------------------------
--  DDL for Table SYS_FBA_APP_TABLES
--------------------------------------------------------

  CREATE TABLE "SYS"."SYS_FBA_APP_TABLES" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"APP#" NUMBER, 
	"FLAGS" NUMBER, 
	"SPARE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
