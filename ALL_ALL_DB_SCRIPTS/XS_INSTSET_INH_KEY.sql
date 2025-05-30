--------------------------------------------------------
--  DDL for Table XS$INSTSET_INH_KEY
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$INSTSET_INH_KEY" SHARING=METADATA 
   (	"XDSID#" NUMBER, 
	"ORDER#" NUMBER, 
	"PKEY" VARCHAR2(128 BYTE), 
	"FKEY" VARCHAR2(4000 BYTE), 
	"FKEY_TYPE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
