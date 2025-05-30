--------------------------------------------------------
--  DDL for Table ENC$
--------------------------------------------------------

  CREATE TABLE "SYS"."ENC$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"OWNER#" NUMBER, 
	"MKEYID" VARCHAR2(64 BYTE), 
	"ENCALG" NUMBER, 
	"INTALG" NUMBER, 
	"COLKLC" RAW(2000), 
	"KLCLEN" NUMBER, 
	"FLAG" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
