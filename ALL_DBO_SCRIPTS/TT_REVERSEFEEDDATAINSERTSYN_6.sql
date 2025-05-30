--------------------------------------------------------
--  DDL for Table TT_REVERSEFEEDDATAINSERTSYN_6
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "RBL_MISDB_PROD"."TT_REVERSEFEEDDATAINSERTSYN_6" 
   (	"ENTITYKEY" NUMBER(10,0), 
	"PROCESSDATE" VARCHAR2(200 CHAR), 
	"RUNDATE" VARCHAR2(200 CHAR), 
	"SOURCENAME" VARCHAR2(50 CHAR), 
	"CUSTOMERID" VARCHAR2(30 CHAR), 
	"FINALASSETCLASSALT_KEY" NUMBER(10,0), 
	"FINALNPADT" VARCHAR2(200 CHAR), 
	"UPGRADEDATE" VARCHAR2(200 CHAR)
   ) ON COMMIT DELETE ROWS ;
