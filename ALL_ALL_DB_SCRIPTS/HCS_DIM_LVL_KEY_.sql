--------------------------------------------------------
--  DDL for Table HCS_DIM_LVL_KEY$
--------------------------------------------------------

  CREATE TABLE "SYS"."HCS_DIM_LVL_KEY$" SHARING=METADATA 
   (	"DIM#" NUMBER, 
	"LVL#" NUMBER, 
	"LVL_KEY#" NUMBER, 
	"ORDER_NUM" NUMBER, 
	"IS_PC" NUMBER(1,0), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
