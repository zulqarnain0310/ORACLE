--------------------------------------------------------
--  DDL for Table SYNCREF$_TABLE_INFO
--------------------------------------------------------

  CREATE TABLE "SYS"."SYNCREF$_TABLE_INFO" SHARING=METADATA 
   (	"TABLE_OBJ#" NUMBER, 
	"STAGING_LOG_OBJ#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
