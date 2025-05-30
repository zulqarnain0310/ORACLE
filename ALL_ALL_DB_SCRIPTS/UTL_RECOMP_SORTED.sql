--------------------------------------------------------
--  DDL for Table UTL_RECOMP_SORTED
--------------------------------------------------------

  CREATE TABLE "SYS"."UTL_RECOMP_SORTED" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"OWNER" VARCHAR2(128 BYTE), 
	"OBJNAME" VARCHAR2(128 BYTE), 
	"EDITION_NAME" VARCHAR2(128 BYTE), 
	"NAMESPACE" NUMBER, 
	"DEPTH" NUMBER, 
	"BATCH#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
