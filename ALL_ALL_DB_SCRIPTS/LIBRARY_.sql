--------------------------------------------------------
--  DDL for Table LIBRARY$
--------------------------------------------------------

  CREATE TABLE "SYS"."LIBRARY$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"FILESPEC" VARCHAR2(2000 BYTE), 
	"PROPERTY" NUMBER, 
	"AUDIT$" VARCHAR2(38 BYTE), 
	"AGENT" VARCHAR2(128 BYTE), 
	"LEAF_FILENAME" VARCHAR2(2000 BYTE)
   ) CLUSTER "SYS"."C_OBJ#" ("OBJ#");
