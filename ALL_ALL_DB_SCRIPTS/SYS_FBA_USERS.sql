--------------------------------------------------------
--  DDL for Table SYS_FBA_USERS
--------------------------------------------------------

  CREATE TABLE "SYS"."SYS_FBA_USERS" SHARING=METADATA 
   (	"FA#" NUMBER, 
	"USER#" NUMBER, 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
