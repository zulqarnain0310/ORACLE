--------------------------------------------------------
--  DDL for Table RLS_SC$
--------------------------------------------------------

  CREATE TABLE "SYS"."RLS_SC$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"GNAME" VARCHAR2(128 BYTE), 
	"PNAME" VARCHAR2(128 BYTE), 
	"INTCOL#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
