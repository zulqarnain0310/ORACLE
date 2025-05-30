--------------------------------------------------------
--  DDL for Table SQLTXL$
--------------------------------------------------------

  CREATE TABLE "SYS"."SQLTXL$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"TXLROWNER" VARCHAR2(128 BYTE), 
	"TXLRNAME" VARCHAR2(128 BYTE), 
	"FLAGS" NUMBER, 
	"AUDIT$" VARCHAR2(38 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
