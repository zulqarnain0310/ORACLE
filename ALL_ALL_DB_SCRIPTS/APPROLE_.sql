--------------------------------------------------------
--  DDL for Table APPROLE$
--------------------------------------------------------

  CREATE TABLE "SYS"."APPROLE$" SHARING=METADATA 
   (	"ROLE#" NUMBER, 
	"SCHEMA" VARCHAR2(128 BYTE), 
	"PACKAGE" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
