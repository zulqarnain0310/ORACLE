--------------------------------------------------------
--  DDL for Table OLAP_HIER_LEVELS$
--------------------------------------------------------

  CREATE TABLE "SYS"."OLAP_HIER_LEVELS$" SHARING=METADATA 
   (	"HIERARCHY_ID" NUMBER, 
	"ORDER_NUM" NUMBER, 
	"HIERARCHY_LEVEL_ID" NUMBER, 
	"DIM_LEVEL_ID" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" VARCHAR2(1000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
