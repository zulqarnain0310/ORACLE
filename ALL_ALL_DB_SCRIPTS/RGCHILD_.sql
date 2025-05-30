--------------------------------------------------------
--  DDL for Table RGCHILD$
--------------------------------------------------------

  CREATE TABLE "SYS"."RGCHILD$" SHARING=METADATA 
   (	"OWNER" VARCHAR2(128 BYTE), 
	"NAME" VARCHAR2(128 BYTE), 
	"TYPE#" VARCHAR2(128 BYTE) DEFAULT 'SNAPSHOT', 
	"FIELD1" NUMBER DEFAULT 0, 
	"REFGROUP" NUMBER, 
	"INSTSITE" NUMBER(*,0) DEFAULT 0                      /* snapshot site id */
   ) CLUSTER "SYS"."C_RG#" ("REFGROUP");
