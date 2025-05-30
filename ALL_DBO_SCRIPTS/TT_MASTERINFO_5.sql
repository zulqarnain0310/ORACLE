--------------------------------------------------------
--  DDL for Table TT_MASTERINFO_5
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "RBL_MISDB_PROD"."TT_MASTERINFO_5" 
   (	"CREATEDBY" VARCHAR2(20 BYTE), 
	"DATECREATED" DATE, 
	"MODIFIEDBY" VARCHAR2(20 BYTE), 
	"DATEMODIFIED" DATE, 
	"DELSTATUS" CHAR(2 BYTE), 
	"ENTITYKEY" NUMBER(10,0), 
	"AUTHORISATIONSTATUS" CHAR(2 BYTE), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0)
   ) ON COMMIT DELETE ROWS ;
