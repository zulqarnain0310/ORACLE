--------------------------------------------------------
--  DDL for Table GTT_AC_NPA_QTR_NO
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "MAIN_PRO"."GTT_AC_NPA_QTR_NO" 
   (	"ACCOUNTENTITYID" NUMBER(5,0), 
	"NPA_QTR_NO" NUMBER(10,0), 
	"ACBUREVISEDSEGMENTCODE" VARCHAR2(20 CHAR)
   ) ON COMMIT DELETE ROWS ;
