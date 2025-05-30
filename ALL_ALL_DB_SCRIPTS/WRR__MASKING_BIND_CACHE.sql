--------------------------------------------------------
--  DDL for Table WRR$_MASKING_BIND_CACHE
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_MASKING_BIND_CACHE" SHARING=METADATA 
   (	"SCRIPT_ID" NUMBER, 
	"SQL_ID" NUMBER, 
	"SENSITIVE_COUNT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
