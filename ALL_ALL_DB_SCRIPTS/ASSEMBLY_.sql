--------------------------------------------------------
--  DDL for Table ASSEMBLY$
--------------------------------------------------------

  CREATE TABLE "SYS"."ASSEMBLY$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"FILESPEC" VARCHAR2(4000 BYTE), 
	"SECURITY_LEVEL" NUMBER, 
	"IDENTITY" VARCHAR2(4000 BYTE), 
	"PROPERTY" NUMBER, 
	"AUDIT$" VARCHAR2(38 BYTE)
   ) CLUSTER "SYS"."C_OBJ#" ("OBJ#");
