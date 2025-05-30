--------------------------------------------------------
--  DDL for Table OPQTYPE$
--------------------------------------------------------

  CREATE TABLE "SYS"."OPQTYPE$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"INTCOL#" NUMBER, 
	"TYPE" NUMBER, 
	"FLAGS" NUMBER, 
	"LOBCOL" NUMBER, 
	"OBJCOL" NUMBER, 
	"EXTRACOL" NUMBER, 
	"SCHEMAOID" RAW(16), 
	"ELEMNUM" NUMBER, 
	"SCHEMAURL" VARCHAR2(4000 BYTE)
   ) CLUSTER "SYS"."C_OBJ#" ("OBJ#");
  GRANT SELECT ON "SYS"."OPQTYPE$" TO "CTXSYS";
