--------------------------------------------------------
--  DDL for Table HCS_AV_KEY$
--------------------------------------------------------

  CREATE TABLE "SYS"."HCS_AV_KEY$" SHARING=METADATA 
   (	"AV#" NUMBER, 
	"AV_DIM#" NUMBER, 
	"KEY#" NUMBER, 
	"SRC_COL#" NUMBER, 
	"REF_ATTR_NAME" VARCHAR2(128 BYTE), 
	"ORDER_NUM" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
