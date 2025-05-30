--------------------------------------------------------
--  DDL for Table IND_STATS$
--------------------------------------------------------

  CREATE TABLE "SYS"."IND_STATS$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"CACHEDBLK" NUMBER, 
	"CACHEHIT" NUMBER, 
	"LOGICALREAD" NUMBER, 
	"ROWCNT" NUMBER, 
	"BLEVEL" NUMBER, 
	"LEAFCNT" NUMBER, 
	"DISTKEY" NUMBER, 
	"LBLKKEY" NUMBER, 
	"DBLKKEY" NUMBER, 
	"CLUFAC" NUMBER, 
	"ANALYZETIME" DATE, 
	"SAMPLESIZE" NUMBER, 
	"FLAGS" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(1000 BYTE), 
	"SPARE5" VARCHAR2(1000 BYTE), 
	"SPARE6" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 32768 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
