--------------------------------------------------------
--  DDL for Table MODELSET$
--------------------------------------------------------

  CREATE TABLE "SYS"."MODELSET$" SHARING=METADATA 
   (	"MOD#" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"VALUE" VARCHAR2(4000 BYTE), 
	"PROPERTIES" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE( MAXEXTENTS 2147483645)
  TABLESPACE "SYSTEM" ;
