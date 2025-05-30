--------------------------------------------------------
--  DDL for Table STAGE_TERADATA_OFFLINE_FKEYS
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "ACL_RBL_MISDB_PROD"."STAGE_TERADATA_OFFLINE_FKEYS" 
   (	"INDEX" NUMBER, 
	"DBNAME" VARCHAR2(256 BYTE), 
	"TABNAME" VARCHAR2(256 BYTE), 
	"REFTABSCHEMA" VARCHAR2(256 BYTE), 
	"REFTABNAME" VARCHAR2(256 BYTE), 
	"CONSTNAME" VARCHAR2(256 BYTE), 
	"COLNAME" VARCHAR2(256 BYTE), 
	"REFCOLNAME" VARCHAR2(256 BYTE), 
	"TYPE" CHAR(1 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
