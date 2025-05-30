--------------------------------------------------------
--  DDL for Table SQLTXL_SQL$
--------------------------------------------------------

  CREATE TABLE "SYS"."SQLTXL_SQL$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"SQLTEXT" CLOB, 
	"TXLTEXT" CLOB, 
	"SQLID" VARCHAR2(13 BYTE), 
	"SQLHASH" NUMBER, 
	"FLAGS" NUMBER, 
	"RTIME" TIMESTAMP (6), 
	"CINFO" VARCHAR2(64 BYTE), 
	"MODULE" VARCHAR2(64 BYTE), 
	"ACTION" VARCHAR2(64 BYTE), 
	"PUSER#" NUMBER, 
	"PSCHEMA#" NUMBER, 
	"COMMENT$" VARCHAR2(4000 BYTE), 
	"ERRCODE#" NUMBER, 
	"ERRSRC" NUMBER, 
	"TXLMTHD" NUMBER, 
	"DICTID" VARCHAR2(13 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 LOB ("SQLTEXT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("TXLTEXT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
