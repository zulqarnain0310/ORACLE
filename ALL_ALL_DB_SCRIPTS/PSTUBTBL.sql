--------------------------------------------------------
--  DDL for Table PSTUBTBL
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."PSTUBTBL" SHARING=METADATA 
   (	"USERNAME" VARCHAR2(128 BYTE), 
	"DBNAME" VARCHAR2(128 BYTE), 
	"LUN" VARCHAR2(128 BYTE), 
	"LUTYPE" VARCHAR2(3 BYTE), 
	"LINENO" NUMBER, 
	"LINE" VARCHAR2(1800 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
