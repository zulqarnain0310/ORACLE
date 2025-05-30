--------------------------------------------------------
--  DDL for Table AUDIT$
--------------------------------------------------------

  CREATE TABLE "SYS"."AUDIT$" SHARING=METADATA 
   (	"USER#" NUMBER, 
	"PROXY#" NUMBER, 
	"OPTION#" NUMBER, 
	"SUCCESS" NUMBER, 
	"FAILURE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
