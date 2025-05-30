--------------------------------------------------------
--  DDL for Table METAVIEW$
--------------------------------------------------------

  CREATE TABLE "SYS"."METAVIEW$" SHARING=DATA 
   (	"TYPE" VARCHAR2(128 BYTE), 
	"FLAGS" NUMBER, 
	"PROPERTIES" NUMBER, 
	"MODEL" VARCHAR2(128 BYTE), 
	"VERSION" NUMBER, 
	"XMLTAG" VARCHAR2(128 BYTE), 
	"UDT" VARCHAR2(128 BYTE), 
	"SCHEMA" VARCHAR2(128 BYTE), 
	"VIEWNAME" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
