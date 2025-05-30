--------------------------------------------------------
--  DDL for Table ICOL$
--------------------------------------------------------

  CREATE TABLE "SYS"."ICOL$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"BO#" NUMBER, 
	"COL#" NUMBER, 
	"POS#" NUMBER, 
	"SEGCOL#" NUMBER, 
	"SEGCOLLENGTH" NUMBER, 
	"OFFSET" NUMBER, 
	"INTCOL#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(1000 BYTE), 
	"SPARE5" VARCHAR2(1000 BYTE), 
	"SPARE6" DATE
   ) CLUSTER "SYS"."C_OBJ#" ("BO#");
  GRANT SELECT ON "SYS"."ICOL$" TO "CTXSYS";
