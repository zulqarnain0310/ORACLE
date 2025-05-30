--------------------------------------------------------
--  DDL for Table HCS_DIM_DTM_ATTR$
--------------------------------------------------------

  CREATE TABLE "SYS"."HCS_DIM_DTM_ATTR$" SHARING=METADATA 
   (	"DIM#" NUMBER, 
	"ATTR#" NUMBER, 
	"LVL#" NUMBER, 
	"IN_MINIMAL" NUMBER(1,0), 
	"ORDER_NUM" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
