--------------------------------------------------------
--  DDL for Table TT_ACCOUNT_MOVEMENT_HISTORY_2
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "MAIN_PRO"."TT_ACCOUNT_MOVEMENT_HISTORY_2" 
   (	"UCIF_ID" VARCHAR2(50 BYTE), 
	"REFCUSTOMERID" VARCHAR2(50 BYTE), 
	"SOURCESYSTEMCUSTOMERID" VARCHAR2(50 BYTE), 
	"CUSTOMERACID" VARCHAR2(225 BYTE), 
	"FINALASSETCLASSALT_KEY" NUMBER(10,0), 
	"FINALNPADT" VARCHAR2(200 BYTE), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"MOVEMENTFROMSTATUS" VARCHAR2(10 BYTE), 
	"MOVEMENTTOSTATUS" VARCHAR2(10 BYTE), 
	"TOTOSACC" NUMBER(18,2), 
	"MOVEMENTFROMDATE" VARCHAR2(200 BYTE), 
	"MOVEMENTTODATE" VARCHAR2(200 BYTE)
   ) ON COMMIT DELETE ROWS ;
