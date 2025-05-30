--------------------------------------------------------
--  DDL for Table REFCON$
--------------------------------------------------------

  CREATE TABLE "SYS"."REFCON$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"REFTYP" NUMBER, 
	"STABID" RAW(16), 
	"EXPCTOID" RAW(16)
   ) CLUSTER "SYS"."C_OBJ#" ("OBJ#");
