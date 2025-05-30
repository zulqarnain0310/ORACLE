--------------------------------------------------------
--  DDL for Table RLS_CTX$
--------------------------------------------------------

  CREATE TABLE "SYS"."RLS_CTX$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"NS" VARCHAR2(128 BYTE), 
	"ATTR" VARCHAR2(128 BYTE), 
	"SYNID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
