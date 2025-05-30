--------------------------------------------------------
--  DDL for Table CCOL$
--------------------------------------------------------

  CREATE TABLE "SYS"."CCOL$" SHARING=METADATA 
   (	"CON#" NUMBER, 
	"OBJ#" NUMBER, 
	"COL#" NUMBER, 
	"POS#" NUMBER, 
	"INTCOL#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(1000 BYTE), 
	"SPARE5" VARCHAR2(1000 BYTE), 
	"SPARE6" DATE
   ) CLUSTER "SYS"."C_COBJ#" ("OBJ#");
  GRANT SELECT ON "SYS"."CCOL$" TO "CTXSYS";
