--------------------------------------------------------
--  DDL for Table TT_FACILITYDETAILSELECTAUX_2
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "RBL_MISDB_PROD"."TT_FACILITYDETAILSELECTAUX_2" 
   (	"CUSTOMERENTITYID" NUMBER(10,0), 
	"CUSTOMERID" VARCHAR2(20 BYTE), 
	"ACCOUNTENTITYID" NUMBER(10,0), 
	"CUSTOMERACID" VARCHAR2(30 BYTE), 
	"FACILITYTYPE" VARCHAR2(10 BYTE), 
	"BRANCHCODE" VARCHAR2(50 BYTE), 
	"BRANCHNAME" VARCHAR2(50 BYTE)
   ) ON COMMIT DELETE ROWS ;
