--------------------------------------------------------
--  DDL for Table STAGE_TERADATA_COLUMNS
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "RBL_TEMPDB"."STAGE_TERADATA_COLUMNS" 
   (	"MDID" NUMBER, 
	"DATABASENAME" VARCHAR2(128 CHAR), 
	"TABLENAME" VARCHAR2(128 CHAR), 
	"COLUMNNAME" VARCHAR2(128 CHAR), 
	"COLUMNFORMAT" VARCHAR2(128 CHAR), 
	"COLUMNTITLE" VARCHAR2(256 CHAR), 
	"COLUMNTYPE" CHAR(2 CHAR), 
	"COLUMNUDTNAME" VARCHAR2(128 CHAR), 
	"COLUMNLENGTH" NUMBER(10,0), 
	"DEFAULTVALUE" CLOB, 
	"NULLABLE" CHAR(1 CHAR), 
	"COMMENTSTRING" VARCHAR2(255 CHAR), 
	"DECIMALTOTALDIGITS" NUMBER(10,0), 
	"DECIMALFRACTIONALDIGITS" NUMBER(10,0), 
	"COLUMNID" NUMBER, 
	"UPPERCASEFLAG" CHAR(1 CHAR), 
	"COLUMNCONSTRAINT" CLOB, 
	"CONSTRAINTCOUNT" NUMBER(10,0), 
	"CREATORNAME" VARCHAR2(128 CHAR), 
	"CHARTYPE" NUMBER(10,0), 
	"IDCOLTYPE" CHAR(2 CHAR)
   ) ON COMMIT PRESERVE ROWS 
 LOB ("DEFAULTVALUE") STORE AS BASICFILE (
  ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE ) 
 LOB ("COLUMNCONSTRAINT") STORE AS BASICFILE (
  ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE ) ;
