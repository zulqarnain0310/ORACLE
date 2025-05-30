--------------------------------------------------------
--  DDL for Table CLST$
--------------------------------------------------------

  CREATE TABLE "SYS"."CLST$" SHARING=METADATA 
   (	"CLSTOBJ#" NUMBER, 
	"CLSTFUNC" NUMBER, 
	"CLSTLASTDM" TIMESTAMP (6), 
	"CLSTLASTLOAD" TIMESTAMP (6), 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
