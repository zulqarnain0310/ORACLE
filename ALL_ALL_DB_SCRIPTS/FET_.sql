--------------------------------------------------------
--  DDL for Table FET$
--------------------------------------------------------

  CREATE TABLE "SYS"."FET$" SHARING=METADATA 
   (	"TS#" NUMBER, 
	"FILE#" NUMBER, 
	"BLOCK#" NUMBER, 
	"LENGTH" NUMBER
   ) CLUSTER "SYS"."C_TS#" ("TS#");
