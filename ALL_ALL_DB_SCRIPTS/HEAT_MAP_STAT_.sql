--------------------------------------------------------
--  DDL for Table HEAT_MAP_STAT$
--------------------------------------------------------

  CREATE TABLE "SYS"."HEAT_MAP_STAT$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"DATAOBJ#" NUMBER, 
	"TS#" NUMBER, 
	"TRACK_TIME" DATE, 
	"SEGMENT_ACCESS" NUMBER, 
	"FLAG" NUMBER DEFAULT 0, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"N_WRITE" NUMBER DEFAULT 0, 
	"N_FTS" NUMBER DEFAULT 0, 
	"N_LOOKUP" NUMBER DEFAULT 0, 
	"N_INSERT" NUMBER, 
	"N_UPDATE" NUMBER, 
	"N_DELETE" NUMBER, 
	"N_ROWSINS" NUMBER, 
	"N_ROWSUPD" NUMBER, 
	"N_ROWSDEL" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
