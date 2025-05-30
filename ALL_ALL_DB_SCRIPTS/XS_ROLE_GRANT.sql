--------------------------------------------------------
--  DDL for Table XS$ROLE_GRANT
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$ROLE_GRANT" SHARING=METADATA 
   (	"GRANTEE#" NUMBER, 
	"ROLE#" NUMBER, 
	"GRANTER#" NUMBER, 
	"START_DATE" TIMESTAMP (6) WITH TIME ZONE, 
	"END_DATE" TIMESTAMP (6) WITH TIME ZONE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
