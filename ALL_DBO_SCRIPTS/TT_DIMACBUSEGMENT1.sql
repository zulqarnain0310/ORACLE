--------------------------------------------------------
--  DDL for Table TT_DIMACBUSEGMENT1
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "RBL_MISDB_PROD"."TT_DIMACBUSEGMENT1" 
   (	"RN" NUMBER, 
	"ACBUSEGMENTCODE" VARCHAR2(20 CHAR), 
	"ACBUREVISEDSEGMENTCODE" VARCHAR2(20 CHAR), 
	"ACBUSEGMENTDESCRIPTION" VARCHAR2(100 CHAR)
   ) ON COMMIT DELETE ROWS ;
