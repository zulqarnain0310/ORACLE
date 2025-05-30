--------------------------------------------------------
--  DDL for Table ICOLDEP$
--------------------------------------------------------

  CREATE TABLE "SYS"."ICOLDEP$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"BO#" NUMBER, 
	"INTCOL#" NUMBER
   ) CLUSTER "SYS"."C_OBJ#" ("BO#");
