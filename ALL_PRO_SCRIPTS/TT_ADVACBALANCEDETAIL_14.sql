--------------------------------------------------------
--  DDL for Table TT_ADVACBALANCEDETAIL_14
--------------------------------------------------------

  CREATE TABLE "MAIN_PRO"."TT_ADVACBALANCEDETAIL_14" 
   (	"ENTITYKEY" NUMBER(19,0), 
	"ACCOUNTENTITYID" NUMBER(10,0), 
	"ASSETCLASSALT_KEY" NUMBER(5,0), 
	"BALANCEINCURRENCY" NUMBER(16,2), 
	"BALANCE" NUMBER(16,2), 
	"SIGNBALANCE" NUMBER(16,2), 
	"LASTCRDT" VARCHAR2(200 BYTE), 
	"OVERDUE" NUMBER(16,2), 
	"TOTALPROV" NUMBER(16,2), 
	"REFCUSTOMERID" VARCHAR2(20 BYTE), 
	"REFSYSTEMACID" VARCHAR2(30 BYTE), 
	"AUTHORISATIONSTATUS" CHAR(2 BYTE), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"OVERDUESINCEDT" VARCHAR2(200 BYTE), 
	"MOCSTATUS" CHAR(1 BYTE), 
	"MOCDATE" DATE, 
	"MOCTYPEALT_KEY" NUMBER(10,0), 
	"OLD_OVERDUESINCEDT" VARCHAR2(200 BYTE), 
	"OLD_OVERDUE" NUMBER(16,2), 
	"ORG_TOTALPROV" NUMBER(16,2), 
	"INTREVERSEAMT" NUMBER(16,2), 
	"UNAPPLIEDINTAMOUNT" NUMBER(18,2), 
	"PS_BALANCE" NUMBER(16,2), 
	"NPS_BALANCE" NUMBER(16,2), 
	"DATECREATED" VARCHAR2(200 BYTE), 
	"MODIFIEDBY" VARCHAR2(50 BYTE), 
	"DATEMODIFIED" VARCHAR2(200 BYTE), 
	"APPROVEDBY" VARCHAR2(50 BYTE), 
	"DATEAPPROVED" VARCHAR2(200 BYTE), 
	"CREATEDBY" VARCHAR2(50 BYTE), 
	"UPGRADEDATE" VARCHAR2(200 BYTE), 
	"OVERDUEPRINCIPAL" NUMBER(18,2), 
	"NOTIONALINTTAMT" NUMBER(16,2), 
	"PRINCIPALBALANCE" NUMBER(18,2), 
	"OVERDUEINTEREST" NUMBER(16,2), 
	"ADVANCERECOVERY" NUMBER(16,2), 
	"PS_NPS_FLAG" VARCHAR2(3 BYTE), 
	"DFVAMT" NUMBER(18,2), 
	"INTERESTRECEIVABLE" NUMBER(18,2), 
	"OVERDUEPRINCIPALDT" VARCHAR2(200 BYTE), 
	"OVERDUEINTDT" VARCHAR2(200 BYTE), 
	"OVEROTHERDUE" NUMBER(18,2), 
	"OVERDUEOTHERDT" VARCHAR2(200 BYTE), 
	"ISCHANGED" CHAR(1 BYTE), 
	"SOURCEASSETCLASS" VARCHAR2(100 BYTE), 
	"SOURCENPADATE" DATE, 
	"ASSETCLASSALT_KEY_ORG" NUMBER(3,0), 
	"BALANCE_ORG" NUMBER(16,2), 
	"TOTALPROV_ORG" NUMBER(16,2), 
	"PRINCIPALBALANCE_ORG" NUMBER(16,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
