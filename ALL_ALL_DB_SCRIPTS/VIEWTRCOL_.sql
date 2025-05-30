--------------------------------------------------------
--  DDL for Table VIEWTRCOL$
--------------------------------------------------------

  CREATE TABLE "SYS"."VIEWTRCOL$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"INTCOL#" NUMBER, 
	"ATTRIBUTE#" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE)
   ) CLUSTER "SYS"."C_OBJ#" ("OBJ#");
