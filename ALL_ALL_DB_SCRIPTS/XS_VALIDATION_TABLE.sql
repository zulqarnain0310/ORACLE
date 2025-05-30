--------------------------------------------------------
--  DDL for Table XS$VALIDATION_TABLE
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."XS$VALIDATION_TABLE" SHARING=METADATA 
   (	"CODE" NUMBER, 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"OBJECT" VARCHAR2(4000 BYTE), 
	"NOTE" VARCHAR2(4000 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
  GRANT SELECT ON "SYS"."XS$VALIDATION_TABLE" TO PUBLIC;
