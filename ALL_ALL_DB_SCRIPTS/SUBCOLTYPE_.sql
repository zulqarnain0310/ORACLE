--------------------------------------------------------
--  DDL for Table SUBCOLTYPE$
--------------------------------------------------------

  CREATE TABLE "SYS"."SUBCOLTYPE$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"INTCOL#" NUMBER, 
	"TOID" RAW(16), 
	"VERSION#" NUMBER, 
	"INTCOLS" NUMBER, 
	"INTCOL#S" RAW(2000), 
	"FLAGS" NUMBER, 
	"SYNOBJ#" NUMBER
   ) CLUSTER "SYS"."C_OBJ#" ("OBJ#");
