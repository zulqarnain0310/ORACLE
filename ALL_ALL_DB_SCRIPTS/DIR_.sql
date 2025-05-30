--------------------------------------------------------
--  DDL for Table DIR$
--------------------------------------------------------

  CREATE TABLE "SYS"."DIR$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"AUDIT$" VARCHAR2(38 BYTE), 
	"OS_PATH" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
