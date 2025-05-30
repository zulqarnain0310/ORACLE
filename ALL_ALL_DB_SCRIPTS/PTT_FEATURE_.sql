--------------------------------------------------------
--  DDL for Table PTT_FEATURE$
--------------------------------------------------------

  CREATE TABLE "SYS"."PTT_FEATURE$" SHARING=METADATA 
   (	"TRACK_TIME" TIMESTAMP (6), 
	"STATUS" NUMBER, 
	"PREFIX_VALUE" VARCHAR2(128 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
