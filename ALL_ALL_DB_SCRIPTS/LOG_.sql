--------------------------------------------------------
--  DDL for Table LOG$
--------------------------------------------------------

  CREATE TABLE "SYS"."LOG$" SHARING=METADATA 
   (	"BTABLE#" NUMBER, 
	"COLNAME" VARCHAR2(128 BYTE), 
	"REFCOUNT" NUMBER, 
	"LTABLE#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
