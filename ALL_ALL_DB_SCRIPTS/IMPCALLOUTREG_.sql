--------------------------------------------------------
--  DDL for Table IMPCALLOUTREG$
--------------------------------------------------------

  CREATE TABLE "SYS"."IMPCALLOUTREG$" SHARING=METADATA 
   (	"PACKAGE" VARCHAR2(128 BYTE), 
	"SCHEMA" VARCHAR2(128 BYTE), 
	"TAG" VARCHAR2(128 BYTE), 
	"CLASS" NUMBER, 
	"LEVEL#" NUMBER DEFAULT 1000, 
	"FLAGS" NUMBER, 
	"TGT_SCHEMA" VARCHAR2(128 BYTE), 
	"TGT_OBJECT" VARCHAR2(128 BYTE), 
	"TGT_TYPE" NUMBER, 
	"CMNT" VARCHAR2(2000 BYTE), 
	"BEGINNING_TGT_VERSION" VARCHAR2(14 BYTE) DEFAULT null, 
	"ENDING_TGT_VERSION" VARCHAR2(14 BYTE) DEFAULT null, 
	"ALT_NAME" VARCHAR2(128 BYTE) DEFAULT null, 
	"ALT_SCHEMA" VARCHAR2(128 BYTE) DEFAULT null
                           /* alternate schema for tgt_object at import time */
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  GRANT SELECT ON "SYS"."IMPCALLOUTREG$" TO "SELECT_CATALOG_ROLE";
