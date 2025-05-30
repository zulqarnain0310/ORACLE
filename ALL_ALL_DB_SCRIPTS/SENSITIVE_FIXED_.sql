--------------------------------------------------------
--  DDL for Table SENSITIVE_FIXED$
--------------------------------------------------------

  CREATE TABLE "SYS"."SENSITIVE_FIXED$" SHARING=METADATA 
   (	"NAME" VARCHAR2(128 BYTE), 
	"FLAG" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
