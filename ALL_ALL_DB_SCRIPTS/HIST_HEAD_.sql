--------------------------------------------------------
--  DDL for Table HIST_HEAD$
--------------------------------------------------------

  CREATE TABLE "SYS"."HIST_HEAD$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"COL#" NUMBER, 
	"BUCKET_CNT" NUMBER, 
	"ROW_CNT" NUMBER, 
	"CACHE_CNT" NUMBER, 
	"NULL_CNT" NUMBER, 
	"TIMESTAMP#" DATE, 
	"SAMPLE_SIZE" NUMBER, 
	"MINIMUM" NUMBER, 
	"MAXIMUM" NUMBER, 
	"DISTCNT" NUMBER, 
	"LOWVAL" RAW(1000), 
	"HIVAL" RAW(1000), 
	"DENSITY" NUMBER, 
	"INTCOL#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"AVGCLN" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" NUMBER, 
	"MINIMUM_ENC" RAW(1000), 
	"MAXIMUM_ENC" RAW(1000)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 360448 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
