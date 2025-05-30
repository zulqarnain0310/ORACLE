--------------------------------------------------------
--  DDL for Table CON$
--------------------------------------------------------

  CREATE TABLE "SYS"."CON$" SHARING=METADATA 
   (	"OWNER#" NUMBER, 
	"NAME" VARCHAR2(128 BYTE), 
	"CON#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(1000 BYTE), 
	"SPARE5" VARCHAR2(1000 BYTE), 
	"SPARE6" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  GRANT SELECT ON "SYS"."CON$" TO "CTXSYS";
