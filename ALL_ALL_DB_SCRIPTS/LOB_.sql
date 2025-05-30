--------------------------------------------------------
--  DDL for Table LOB$
--------------------------------------------------------

  CREATE TABLE "SYS"."LOB$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"LOBJ#" NUMBER, 
	"PART#" NUMBER, 
	"IND#" NUMBER, 
	"TS#" NUMBER, 
	"FILE#" NUMBER, 
	"BLOCK#" NUMBER, 
	"CHUNK" NUMBER, 
	"PCTVERSION$" NUMBER, 
	"FLAGS" NUMBER, 
	"PROPERTY" NUMBER, 
	"RETENTION" NUMBER, 
	"FREEPOOLS" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(255 BYTE)
   ) CLUSTER "SYS"."C_OBJ#" ("OBJ#");
  GRANT SELECT ON "SYS"."LOB$" TO "CTXSYS";
