--------------------------------------------------------
--  DDL for Table ATTRCOL$
--------------------------------------------------------

  CREATE TABLE "SYS"."ATTRCOL$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"INTCOL#" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE)
   ) CLUSTER "SYS"."C_OBJ#" ("OBJ#");
  GRANT SELECT ON "SYS"."ATTRCOL$" TO "XDB";
