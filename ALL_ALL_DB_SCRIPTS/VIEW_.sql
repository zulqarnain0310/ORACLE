--------------------------------------------------------
--  DDL for Table VIEW$
--------------------------------------------------------

  CREATE TABLE "SYS"."VIEW$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"AUDIT$" VARCHAR2(38 BYTE), 
	"COLS" NUMBER, 
	"INTCOLS" NUMBER, 
	"PROPERTY" NUMBER, 
	"FLAGS" NUMBER, 
	"TEXTLENGTH" NUMBER, 
	"TEXT" LONG
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 16384 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  GRANT SELECT ON "SYS"."VIEW$" TO "CTXSYS";
