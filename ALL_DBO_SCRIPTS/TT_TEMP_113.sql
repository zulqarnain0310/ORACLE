--------------------------------------------------------
--  DDL for Table TT_TEMP_113
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "RBL_MISDB_PROD"."TT_TEMP_113" 
   (	"SERVERNAME" VARCHAR2(150 CHAR), 
	"REFERENCEDDBNAME" VARCHAR2(100 CHAR), 
	"REFERENCEDSCHEMANAME" VARCHAR2(600 BYTE), 
	"REFERENCEDTABLENAME" VARCHAR2(500 CHAR)
   ) ON COMMIT DELETE ROWS ;
