--------------------------------------------------------
--  DDL for Table UET$
--------------------------------------------------------

  CREATE TABLE "SYS"."UET$" SHARING=METADATA 
   (	"SEGFILE#" NUMBER, 
	"SEGBLOCK#" NUMBER, 
	"EXT#" NUMBER, 
	"TS#" NUMBER, 
	"FILE#" NUMBER, 
	"BLOCK#" NUMBER, 
	"LENGTH" NUMBER
   ) CLUSTER "SYS"."C_FILE#_BLOCK#" ("TS#", "SEGFILE#", "SEGBLOCK#");
