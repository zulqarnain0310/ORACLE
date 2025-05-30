--------------------------------------------------------
--  DDL for Table GG$_SUPPORTED_PACKAGES
--------------------------------------------------------

  CREATE TABLE "SYS"."GG$_SUPPORTED_PACKAGES" SHARING=METADATA 
   (	"OWNER" VARCHAR2(384 BYTE), 
	"NAME" VARCHAR2(384 BYTE), 
	"FEATURE" VARCHAR2(384 BYTE), 
	"MIN_DB_VERSION" VARCHAR2(100 BYTE) DEFAULT '12.2', 
	"MAX_DB_VERSION" VARCHAR2(100 BYTE) DEFAULT NULL, 
	"MIN_REDO_COMPAT_LEVEL" VARCHAR2(100 BYTE) DEFAULT '12.2', 
	"MAX_REDO_COMPAT_LEVEL" VARCHAR2(100 BYTE) DEFAULT NULL, 
	"SUPPORTED_LEVEL" VARCHAR2(100 BYTE) DEFAULT 'ALWAYS', 
	"SPARE1" NUMBER DEFAULT NULL, 
	"SPARE2" NUMBER DEFAULT NULL, 
	"SPARE3" VARCHAR2(4000 BYTE) DEFAULT NULL, 
	"SPARE4" VARCHAR2(4000 BYTE) DEFAULT NULL, 
	"SPARE5" TIMESTAMP (6) DEFAULT NULL
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
