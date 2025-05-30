--------------------------------------------------------
--  DDL for Table TSQ$
--------------------------------------------------------

  CREATE TABLE "SYS"."TSQ$" SHARING=METADATA 
   (	"TS#" NUMBER, 
	"USER#" NUMBER, 
	"GRANTOR#" NUMBER, 
	"BLOCKS" NUMBER, 
	"MAXBLOCKS" NUMBER, 
	"PRIV1" NUMBER, 
	"PRIV2" NUMBER, 
	"PRIV3" NUMBER
   ) CLUSTER "SYS"."C_USER#" ("USER#");
