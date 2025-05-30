--------------------------------------------------------
--  DDL for Table UGROUP$
--------------------------------------------------------

  CREATE TABLE "SYS"."UGROUP$" SHARING=METADATA 
   (	"UGRP#" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"SEQ#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" VARCHAR2(128 BYTE), 
	"SPARE3" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
