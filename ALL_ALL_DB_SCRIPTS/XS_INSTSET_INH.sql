--------------------------------------------------------
--  DDL for Table XS$INSTSET_INH
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$INSTSET_INH" SHARING=METADATA 
   (	"XDSID#" NUMBER, 
	"ORDER#" NUMBER, 
	"PARENT_SCHEMA" VARCHAR2(128 BYTE), 
	"PARENT_OBJECT" VARCHAR2(128 BYTE), 
	"WHEN" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
