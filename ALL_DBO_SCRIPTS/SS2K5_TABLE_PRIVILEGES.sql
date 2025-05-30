--------------------------------------------------------
--  DDL for Table SS2K5_TABLE_PRIVILEGES
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "RBL_MISDB_PROD"."SS2K5_TABLE_PRIVILEGES" 
   (	"DB_ID" NUMBER(10,0), 
	"GRANTOR" VARCHAR2(256 BYTE), 
	"TABLE_SCHEMA" VARCHAR2(256 BYTE), 
	"TABLE_NAME" VARCHAR2(256 BYTE), 
	"PRIVILEGE_TYPE" VARCHAR2(256 BYTE), 
	"IS_GRANTABLE" VARCHAR2(256 BYTE), 
	"GRANTEE" VARCHAR2(256 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
