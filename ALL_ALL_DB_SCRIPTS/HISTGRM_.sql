--------------------------------------------------------
--  DDL for Table HISTGRM$
--------------------------------------------------------

  CREATE TABLE "SYS"."HISTGRM$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"COL#" NUMBER, 
	"ROW#" NUMBER, 
	"BUCKET" NUMBER, 
	"ENDPOINT" NUMBER, 
	"INTCOL#" NUMBER, 
	"EPVALUE" VARCHAR2(1000 BYTE), 
	"EP_REPEAT_COUNT" NUMBER DEFAULT 0, 
	"EPVALUE_RAW" RAW(1000), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"ENDPOINT_ENC" RAW(1000)
   ) CLUSTER "SYS"."C_OBJ#_INTCOL#" ("OBJ#", "INTCOL#");
