--------------------------------------------------------
--  DDL for Table STAGE_TERADATA_TABLES
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "RBL_MISDB_PROD"."STAGE_TERADATA_TABLES" 
   (	"MDID" NUMBER, 
	"DATABASENAME" VARCHAR2(128 CHAR), 
	"TABLENAME" VARCHAR2(128 CHAR), 
	"TABLEKIND" CHAR(1 CHAR), 
	"CREATORNAME" VARCHAR2(128 CHAR), 
	"REQUESTTEXT" CLOB, 
	"COMMENTSTRING" VARCHAR2(255 CHAR), 
	"COMMITOPT" CHAR(1 CHAR)
   ) ON COMMIT PRESERVE ROWS 
 LOB ("REQUESTTEXT") STORE AS BASICFILE (
  ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE ) ;
