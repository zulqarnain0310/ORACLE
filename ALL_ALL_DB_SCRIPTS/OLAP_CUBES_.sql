--------------------------------------------------------
--  DDL for Table OLAP_CUBES$
--------------------------------------------------------

  CREATE TABLE "SYS"."OLAP_CUBES$" SHARING=METADATA 
   (	"AWSEQ#" NUMBER, 
	"OBJ#" NUMBER, 
	"AUDIT$" VARCHAR2(38 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" VARCHAR2(1000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
