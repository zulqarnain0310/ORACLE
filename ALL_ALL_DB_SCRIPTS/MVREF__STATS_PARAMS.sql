--------------------------------------------------------
--  DDL for Table MVREF$_STATS_PARAMS
--------------------------------------------------------

  CREATE TABLE "SYS"."MVREF$_STATS_PARAMS" SHARING=METADATA 
   (	"MV_OWNER" VARCHAR2(128 BYTE), 
	"MV_NAME" VARCHAR2(128 BYTE), 
	"COLLECTION_LEVEL" NUMBER, 
	"RETENTION_PERIOD" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
