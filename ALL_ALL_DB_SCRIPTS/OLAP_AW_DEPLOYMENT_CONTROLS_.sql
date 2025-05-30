--------------------------------------------------------
--  DDL for Table OLAP_AW_DEPLOYMENT_CONTROLS$
--------------------------------------------------------

  CREATE TABLE "SYS"."OLAP_AW_DEPLOYMENT_CONTROLS$" SHARING=METADATA 
   (	"OBJECT_ROLE" NUMBER, 
	"PHYSICAL_NAME" VARCHAR2(512 BYTE), 
	"PARENT_ID" NUMBER, 
	"PARENT_TYPE" NUMBER, 
	"AWOWNER#" NUMBER, 
	"AWSEQ#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE), 
	"SPARE4" VARCHAR2(1000 BYTE), 
	"SPARE5" VARCHAR2(1000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
