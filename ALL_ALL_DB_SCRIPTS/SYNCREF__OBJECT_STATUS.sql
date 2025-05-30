--------------------------------------------------------
--  DDL for Table SYNCREF$_OBJECT_STATUS
--------------------------------------------------------

  CREATE TABLE "SYS"."SYNCREF$_OBJECT_STATUS" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"CUR_RUN_FLAG" NUMBER, 
	"GROUP_ID" NUMBER, 
	"CANONICAL_ORDER" NUMBER, 
	"STATUS" NUMBER, 
	"NUM_EXCH_PARTNS" NUMBER, 
	"NUM_INPLACE_PARTNS" NUMBER, 
	"NUM_INPLACE_ROWS" NUMBER, 
	"ERROR_NUMBER" NUMBER, 
	"ERROR_MESSAGE" VARCHAR2(4000 BYTE), 
	"LAST_MODIFIED_TIME" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
