--------------------------------------------------------
--  DDL for Table RESOURCE_CATEGORY$
--------------------------------------------------------

  CREATE TABLE "SYS"."RESOURCE_CATEGORY$" SHARING=METADATA 
   (	"NAME" VARCHAR2(128 BYTE), 
	"MANDATORY" NUMBER, 
	"DESCRIPTION" VARCHAR2(2000 BYTE), 
	"STATUS" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
