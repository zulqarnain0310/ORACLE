--------------------------------------------------------
--  DDL for Table HCS_AV_LVL$
--------------------------------------------------------

  CREATE TABLE "SYS"."HCS_AV_LVL$" SHARING=METADATA 
   (	"AV#" NUMBER, 
	"AV_DIM#" NUMBER, 
	"AV_HIER#" NUMBER, 
	"LVL#" NUMBER, 
	"LVL_NAME" VARCHAR2(128 BYTE), 
	"ORDER_NUM" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
