--------------------------------------------------------
--  DDL for Table PROXY_INFO$
--------------------------------------------------------

  CREATE TABLE "SYS"."PROXY_INFO$" SHARING=METADATA 
   (	"CLIENT#" NUMBER, 
	"PROXY#" NUMBER, 
	"CREDENTIAL_TYPE#" NUMBER, 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
