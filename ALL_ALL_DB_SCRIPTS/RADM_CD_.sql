--------------------------------------------------------
--  DDL for Table RADM_CD$
--------------------------------------------------------

  CREATE TABLE "SYS"."RADM_CD$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"INTCOL#" NUMBER, 
	"PNAME" VARCHAR2(128 BYTE), 
	"CDESC" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
