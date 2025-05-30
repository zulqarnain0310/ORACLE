--------------------------------------------------------
--  DDL for Table COL_GROUP_USAGE$
--------------------------------------------------------

  CREATE TABLE "SYS"."COL_GROUP_USAGE$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"COLS" VARCHAR2(192 CHAR), 
	"TIMESTAMP" DATE, 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 204800 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
