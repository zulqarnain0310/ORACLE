--------------------------------------------------------
--  DDL for Table SQLTXL_ERR$
--------------------------------------------------------

  CREATE TABLE "SYS"."SQLTXL_ERR$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"ERRCODE#" NUMBER, 
	"TXLCODE#" NUMBER, 
	"TXLSQLSTATE" VARCHAR2(5 BYTE), 
	"FLAGS" NUMBER, 
	"RTIME" TIMESTAMP (6), 
	"COMMENT$" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
