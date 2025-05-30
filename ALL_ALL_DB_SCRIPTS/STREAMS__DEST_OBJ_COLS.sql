--------------------------------------------------------
--  DDL for Table STREAMS$_DEST_OBJ_COLS
--------------------------------------------------------

  CREATE TABLE "SYS"."STREAMS$_DEST_OBJ_COLS" SHARING=METADATA 
   (	"OBJECT_NUMBER" NUMBER, 
	"COLUMN_NAME" VARCHAR2(128 BYTE), 
	"FLAG" NUMBER, 
	"DBLINK" VARCHAR2(128 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" VARCHAR2(1000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
