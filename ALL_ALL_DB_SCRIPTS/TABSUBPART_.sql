--------------------------------------------------------
--  DDL for Table TABSUBPART$
--------------------------------------------------------

  CREATE TABLE "SYS"."TABSUBPART$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"DATAOBJ#" NUMBER, 
	"POBJ#" NUMBER, 
	"SUBPART#" NUMBER, 
	"FLAGS" NUMBER, 
	"TS#" NUMBER, 
	"FILE#" NUMBER, 
	"BLOCK#" NUMBER, 
	"PCTFREE$" NUMBER, 
	"PCTUSED$" NUMBER, 
	"INITRANS" NUMBER, 
	"MAXTRANS" NUMBER, 
	"ANALYZETIME" DATE, 
	"SAMPLESIZE" NUMBER, 
	"ROWCNT" NUMBER, 
	"BLKCNT" NUMBER, 
	"EMPCNT" NUMBER, 
	"AVGSPC" NUMBER, 
	"CHNCNT" NUMBER, 
	"AVGRLN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"HIBOUNDLEN" NUMBER, 
	"HIBOUNDVAL" LONG, 
	"BHIBOUNDVAL" BLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("BHIBOUNDVAL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
