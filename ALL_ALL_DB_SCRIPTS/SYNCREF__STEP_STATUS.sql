--------------------------------------------------------
--  DDL for Table SYNCREF$_STEP_STATUS
--------------------------------------------------------

  CREATE TABLE "SYS"."SYNCREF$_STEP_STATUS" SHARING=METADATA 
   (	"GROUP_ID" NUMBER, 
	"OPERATION" NUMBER, 
	"STEP_SEQ_NUM" NUMBER, 
	"STMT_GRP_TYPE" NUMBER, 
	"STMT_TYPE" NUMBER, 
	"STMT_STEP" NUMBER, 
	"OBJ#" NUMBER, 
	"AUX_OBJ#" NUMBER, 
	"STATEMENT" CLOB, 
	"UNDO_STATEMENT" CLOB, 
	"STATUS" NUMBER, 
	"OWNER" VARCHAR2(128 BYTE), 
	"OBJ_NAME" VARCHAR2(128 BYTE), 
	"AUX_OBJ_NAME" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("STATEMENT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("UNDO_STATEMENT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
