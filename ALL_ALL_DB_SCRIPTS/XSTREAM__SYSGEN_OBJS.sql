--------------------------------------------------------
--  DDL for Table XSTREAM$_SYSGEN_OBJS
--------------------------------------------------------

  CREATE TABLE "SYS"."XSTREAM$_SYSGEN_OBJS" SHARING=METADATA 
   (	"SERVER_NAME" VARCHAR2(128 BYTE), 
	"OBJECT_OWNER" VARCHAR2(128 BYTE), 
	"OBJECT_NAME" VARCHAR2(128 BYTE), 
	"OBJECT_TYPE" VARCHAR2(128 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" TIMESTAMP (6), 
	"SPARE5" VARCHAR2(4000 BYTE), 
	"SPARE6" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
