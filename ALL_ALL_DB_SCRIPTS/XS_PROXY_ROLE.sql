--------------------------------------------------------
--  DDL for Table XS$PROXY_ROLE
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$PROXY_ROLE" SHARING=METADATA 
   (	"PROXY#" NUMBER, 
	"CLIENT#" NUMBER, 
	"ROLE#" NUMBER, 
	"GRANTER#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
