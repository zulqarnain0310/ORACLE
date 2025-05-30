--------------------------------------------------------
--  DDL for Table HCS_LVL_ORD$
--------------------------------------------------------

  CREATE TABLE "SYS"."HCS_LVL_ORD$" SHARING=METADATA 
   (	"DIM#" NUMBER, 
	"ORD#" NUMBER, 
	"DIM_LVL#" NUMBER, 
	"ATTR#" NUMBER, 
	"IS_ASC" NUMBER(1,0), 
	"NULL_FIRST" NUMBER(1,0), 
	"AGGR_FUNC" NUMBER(1,0), 
	"ORDER_NUM" NUMBER, 
	"IS_PC" NUMBER(1,0), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
