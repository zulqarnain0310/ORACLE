--------------------------------------------------------
--  DDL for Table RLS_CSA$
--------------------------------------------------------

  CREATE TABLE "SYS"."RLS_CSA$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"GNAME" VARCHAR2(128 BYTE), 
	"PNAME" VARCHAR2(128 BYTE), 
	"NS" VARCHAR2(128 BYTE), 
	"ATTR" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
