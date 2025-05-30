--------------------------------------------------------
--  DDL for Table WRI$_OPTSTAT_TAB_HISTORY
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_OPTSTAT_TAB_HISTORY" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"SAVTIME" TIMESTAMP (6) WITH TIME ZONE, 
	"FLAGS" NUMBER, 
	"ROWCNT" NUMBER, 
	"BLKCNT" NUMBER, 
	"AVGRLN" NUMBER, 
	"SAMPLESIZE" NUMBER, 
	"ANALYZETIME" DATE, 
	"CACHEDBLK" NUMBER, 
	"CACHEHIT" NUMBER, 
	"LOGICALREAD" NUMBER, 
	"SPARE1" NUMBER, 
	"IM_IMCU_COUNT" NUMBER, 
	"IM_BLOCK_COUNT" NUMBER, 
	"SCANRATE" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(1000 BYTE), 
	"SPARE5" VARCHAR2(1000 BYTE), 
	"SPARE6" TIMESTAMP (6) WITH TIME ZONE
   ) PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE ROW MOVEMENT ;
