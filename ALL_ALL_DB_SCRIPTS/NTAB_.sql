--------------------------------------------------------
--  DDL for Table NTAB$
--------------------------------------------------------

  CREATE TABLE "SYS"."NTAB$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"NTAB#" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE) DEFAULT 'NT$'
   ) CLUSTER "SYS"."C_OBJ#" ("OBJ#");
  GRANT SELECT ON "SYS"."NTAB$" TO "XDB";
