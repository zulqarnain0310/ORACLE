--------------------------------------------------------
--  DDL for Table TYPE_MISC$
--------------------------------------------------------

  CREATE TABLE "SYS"."TYPE_MISC$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"AUDIT$" VARCHAR2(38 BYTE), 
	"PROPERTIES" NUMBER
   ) CLUSTER "SYS"."C_OBJ#" ("OBJ#");
