--------------------------------------------------------
--  DDL for Table APPLY$_CDR_INFO
--------------------------------------------------------

  CREATE TABLE "SYS"."APPLY$_CDR_INFO" SHARING=METADATA 
   (	"LOCAL_TRANSACTION_ID" VARCHAR2(22 BYTE), 
	"SOURCE_TRANSACTION_ID" VARCHAR2(128 BYTE), 
	"SOURCE_DATABASE" VARCHAR2(128 BYTE), 
	"ERROR_NUMBER" NUMBER, 
	"ERROR_MESSAGE" VARCHAR2(4000 BYTE), 
	"SOURCE_OBJECT_OWNER" VARCHAR2(128 BYTE), 
	"SOURCE_OBJECT_NAME" VARCHAR2(128 BYTE), 
	"DEST_OBJECT_OWNER" VARCHAR2(128 BYTE), 
	"DEST_OBJECT_NAME" VARCHAR2(128 BYTE), 
	"OPERATION" NUMBER, 
	"POSITION" RAW(64), 
	"SEQ#" NUMBER, 
	"RBA" NUMBER, 
	"INDEX#" NUMBER, 
	"RESOLUTION_STATUS" NUMBER, 
	"RESOLUTION_COLUMN" VARCHAR2(4000 BYTE), 
	"RESOLUTION_METHOD" NUMBER, 
	"RESOLUTION_TIME" TIMESTAMP (6), 
	"TABLE_SUCCESSFUL_CDR" NUMBER, 
	"TABLE_FAILED_CDR" NUMBER, 
	"ALL_SUCCESSFUL_CDR" NUMBER, 
	"ALL_FAILED_CDR" NUMBER, 
	"FLAGS" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" VARCHAR2(4000 BYTE), 
	"SPARE3" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
