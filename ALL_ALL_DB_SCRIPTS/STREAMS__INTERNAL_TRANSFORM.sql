--------------------------------------------------------
--  DDL for Table STREAMS$_INTERNAL_TRANSFORM
--------------------------------------------------------

  CREATE TABLE "SYS"."STREAMS$_INTERNAL_TRANSFORM" SHARING=METADATA 
   (	"RULE_OWNER" VARCHAR2(128 BYTE), 
	"RULE_NAME" VARCHAR2(128 BYTE), 
	"DECLARATIVE_TYPE" NUMBER, 
	"FROM_SCHEMA_NAME" VARCHAR2(128 BYTE), 
	"TO_SCHEMA_NAME" VARCHAR2(128 BYTE), 
	"FROM_TABLE_NAME" VARCHAR2(128 BYTE), 
	"TO_TABLE_NAME" VARCHAR2(128 BYTE), 
	"SCHEMA_NAME" VARCHAR2(128 BYTE), 
	"TABLE_NAME" VARCHAR2(128 BYTE), 
	"FROM_COLUMN_NAME" VARCHAR2(4000 BYTE), 
	"TO_COLUMN_NAME" VARCHAR2(4000 BYTE), 
	"COLUMN_NAME" VARCHAR2(4000 BYTE), 
	"COLUMN_VALUE" "SYS"."ANYDATA" , 
	"COLUMN_TYPE" NUMBER, 
	"COLUMN_FUNCTION" VARCHAR2(128 BYTE), 
	"VALUE_TYPE" NUMBER, 
	"STEP_NUMBER" NUMBER, 
	"PRECEDENCE" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 OPAQUE TYPE ("COLUMN_VALUE") STORE AS BASICFILE LOB (
  ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE ) ;
