--------------------------------------------------------
--  DDL for Table COLTYPE$
--------------------------------------------------------

  CREATE TABLE "SYS"."COLTYPE$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"TOID" RAW(16), 
	"VERSION#" NUMBER, 
	"PACKED" NUMBER, 
	"INTCOLS" NUMBER, 
	"INTCOL#S" RAW(2000), 
	"FLAGS" NUMBER, 
	"TYPIDCOL#" NUMBER, 
	"SYNOBJ#" NUMBER
   ) CLUSTER "SYS"."C_OBJ#" ("OBJ#");
  GRANT SELECT ON "SYS"."COLTYPE$" TO "XDB";
  GRANT SELECT ON "SYS"."COLTYPE$" TO "CTXSYS";
  GRANT SELECT ON "SYS"."COLTYPE$" TO "LBACSYS";
