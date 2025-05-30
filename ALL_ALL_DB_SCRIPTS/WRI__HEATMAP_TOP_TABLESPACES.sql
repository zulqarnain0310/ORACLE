--------------------------------------------------------
--  DDL for Table WRI$_HEATMAP_TOP_TABLESPACES
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_HEATMAP_TOP_TABLESPACES" SHARING=METADATA 
   (	"TASK_TIME" DATE, 
	"TABLESPACE_NAME" VARCHAR2(128 BYTE), 
	"SEGMENT_COUNT" NUMBER, 
	"ALLOCATED_BYTES" NUMBER, 
	"MIN_WRITETIME" DATE, 
	"MAX_WRITETIME" DATE, 
	"AVG_WRITETIME" DATE, 
	"MIN_READTIME" DATE, 
	"MAX_READTIME" DATE, 
	"AVG_READTIME" DATE, 
	"MIN_FTSTIME" DATE, 
	"MAX_FTSTIME" DATE, 
	"AVG_FTSTIME" DATE, 
	"MIN_LOOKUPTIME" DATE, 
	"MAX_LOOKUPTIME" DATE, 
	"AVG_LOOKUPTIME" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
