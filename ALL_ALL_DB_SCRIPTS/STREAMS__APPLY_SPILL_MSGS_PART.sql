--------------------------------------------------------
--  DDL for Table STREAMS$_APPLY_SPILL_MSGS_PART
--------------------------------------------------------

  CREATE TABLE "SYS"."STREAMS$_APPLY_SPILL_MSGS_PART" SHARING=METADATA 
   (	"TXNKEY" NUMBER, 
	"SEQUENCE" NUMBER, 
	"SCN" NUMBER, 
	"SCNSEQ" NUMBER, 
	"CAPINST" NUMBER, 
	"FLAGS" NUMBER, 
	"FLAGS2" NUMBER, 
	"MESSAGE" "SYS"."ANYDATA" , 
	"DESTQUEUE" VARCHAR2(66 BYTE), 
	"UBAAFN" NUMBER, 
	"UBAOBJ" NUMBER, 
	"UBADBA" NUMBER, 
	"UBASLT" NUMBER, 
	"UBARCI" NUMBER, 
	"UBAFSC" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(4000 BYTE), 
	"SPARE5" VARCHAR2(4000 BYTE), 
	"SPARE6" VARCHAR2(4000 BYTE), 
	"POSITION" RAW(64), 
	"SPARE7" DATE, 
	"SPARE8" TIMESTAMP (6), 
	"SPARE9" RAW(100)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 OPAQUE TYPE ("MESSAGE") STORE AS SECUREFILE LOB (
  ENABLE STORAGE IN ROW CHUNK 8192
  CACHE  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
  PARTITION BY LIST ("TXNKEY") 
 (PARTITION "P0"  VALUES (0) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 LOB ("MESSAGE") STORE AS SECUREFILE (
  ENABLE STORAGE IN ROW CHUNK 8192
  CACHE  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ) ;
