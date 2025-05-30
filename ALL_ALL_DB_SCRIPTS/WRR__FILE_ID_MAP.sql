--------------------------------------------------------
--  DDL for Table WRR$_FILE_ID_MAP
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_FILE_ID_MAP" SHARING=METADATA 
   (	"CAP_FILE_ID" NUMBER, 
	"SCHEDULE_CAP_ID" NUMBER, 
	"FILE_COUNT" NUMBER, 
	"REP_FILE_ID" NUMBER DEFAULT 0
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
