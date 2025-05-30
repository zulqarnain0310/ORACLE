--------------------------------------------------------
--  DDL for Table SYNCREF$_STLOG_STATS
--------------------------------------------------------

  CREATE TABLE "SYS"."SYNCREF$_STLOG_STATS" SHARING=METADATA 
   (	"TABLE_OBJ#" NUMBER, 
	"NUM_INSERTS" NUMBER, 
	"NUM_DELETES" NUMBER, 
	"NUM_UPDATES" NUMBER, 
	"PSL_MODE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
