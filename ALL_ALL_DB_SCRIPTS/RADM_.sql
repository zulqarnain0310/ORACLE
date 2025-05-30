--------------------------------------------------------
--  DDL for Table RADM$
--------------------------------------------------------

  CREATE TABLE "SYS"."RADM$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"PNAME" VARCHAR2(128 BYTE), 
	"PEXPR" VARCHAR2(4000 BYTE), 
	"ENABLE_FLAG" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
