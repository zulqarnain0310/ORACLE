--------------------------------------------------------
--  DDL for Table DEFSUBPARTLOB$
--------------------------------------------------------

  CREATE TABLE "SYS"."DEFSUBPARTLOB$" SHARING=METADATA 
   (	"BO#" NUMBER, 
	"INTCOL#" NUMBER, 
	"SPART_POSITION" NUMBER, 
	"FLAGS" NUMBER, 
	"LOB_SPART_NAME" VARCHAR2(132 BYTE), 
	"LOB_SPART_TS#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
