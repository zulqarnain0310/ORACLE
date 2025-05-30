--------------------------------------------------------
--  DDL for Table COLUMN_STAT$
--------------------------------------------------------

  CREATE TABLE "SYS"."COLUMN_STAT$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"TS#" NUMBER, 
	"COLID" NUMBER, 
	"STAT_TYPE" NUMBER, 
	"STAT_VAL_INT" NUMBER DEFAULT 0, 
	"STAT_VAL_STR" VARCHAR2(1000 BYTE) DEFAULT null, 
	"TRACK_TIME" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
