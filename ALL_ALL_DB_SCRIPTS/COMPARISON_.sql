--------------------------------------------------------
--  DDL for Table COMPARISON$
--------------------------------------------------------

  CREATE TABLE "SYS"."COMPARISON$" SHARING=METADATA 
   (	"COMPARISON_ID" NUMBER, 
	"COMPARISON_NAME" VARCHAR2(128 BYTE), 
	"USER#" NUMBER, 
	"COMPARISON_MODE" NUMBER, 
	"SCHEMA_NAME" VARCHAR2(128 BYTE), 
	"OBJECT_NAME" VARCHAR2(128 BYTE), 
	"OBJECT_TYPE" NUMBER, 
	"RMT_SCHEMA_NAME" VARCHAR2(128 BYTE), 
	"RMT_OBJECT_NAME" VARCHAR2(128 BYTE), 
	"RMT_OBJECT_TYPE" NUMBER, 
	"DBLINK_NAME" VARCHAR2(128 BYTE), 
	"SCAN_MODE" NUMBER, 
	"SCAN_PERCENT" NUMBER, 
	"CYL_IDX_VAL" VARCHAR2(4000 BYTE), 
	"NULL_VALUE" VARCHAR2(4000 BYTE), 
	"LOC_CONVERGE_TAG" RAW(2000), 
	"RMT_CONVERGE_TAG" RAW(2000), 
	"MAX_NUM_BUCKETS" NUMBER, 
	"MIN_ROWS_IN_BUCKET" NUMBER, 
	"FLAGS" NUMBER, 
	"LAST_UPDATE_TIME" TIMESTAMP (6), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(1000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
