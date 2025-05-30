--------------------------------------------------------
--  DDL for Table OLAP_ATTRIBUTE_VISIBILITY$
--------------------------------------------------------

  CREATE TABLE "SYS"."OLAP_ATTRIBUTE_VISIBILITY$" SHARING=METADATA 
   (	"ATTRIBUTE_ID" NUMBER, 
	"OWNING_DIM_ID" NUMBER, 
	"OWNING_DIM_TYPE" NUMBER, 
	"ORDER_NUM" NUMBER, 
	"IS_UNIQUE_KEY" NUMBER(1,0), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" VARCHAR2(1000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
