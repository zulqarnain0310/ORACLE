--------------------------------------------------------
--  DDL for Table CDEF$
--------------------------------------------------------

  CREATE TABLE "SYS"."CDEF$" SHARING=METADATA 
   (	"CON#" NUMBER, 
	"OBJ#" NUMBER, 
	"COLS" NUMBER, 
	"TYPE#" NUMBER, 
	"ROBJ#" NUMBER, 
	"RCON#" NUMBER, 
	"RRULES" VARCHAR2(3 BYTE), 
	"MATCH#" NUMBER, 
	"REFACT" NUMBER, 
	"ENABLED" NUMBER, 
	"CONDLENGTH" NUMBER, 
	"CONDITION" LONG, 
	"INTCOLS" NUMBER, 
	"MTIME" DATE, 
	"DEFER" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(1000 BYTE), 
	"SPARE5" VARCHAR2(1000 BYTE), 
	"SPARE6" DATE
   ) CLUSTER "SYS"."C_COBJ#" ("OBJ#");
  GRANT SELECT ON "SYS"."CDEF$" TO "CTXSYS";
