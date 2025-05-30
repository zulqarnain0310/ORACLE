--------------------------------------------------------
--  DDL for Table STAGE_TERADATA_OFFLINE_PKEYS
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "RBL_TEMPDB"."STAGE_TERADATA_OFFLINE_PKEYS" 
   (	"INDEX" NUMBER, 
	"DBNAME" VARCHAR2(256 BYTE), 
	"TABNAME" VARCHAR2(256 BYTE), 
	"CONSTNAME" VARCHAR2(256 BYTE), 
	"TYPE" CHAR(1 BYTE), 
	"COLNAME" VARCHAR2(256 BYTE), 
	"COLSEQ" NUMBER, 
	"UNIQUEFLAG" CHAR(1 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
