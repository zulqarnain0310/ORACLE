--------------------------------------------------------
--  DDL for Table DIR$ALERT_HISTORY
--------------------------------------------------------

  CREATE TABLE "SYS"."DIR$ALERT_HISTORY" SHARING=METADATA 
   (	"ALERT_NAME" VARCHAR2(200 BYTE), 
	"MESSAGE_LEVEL" NUMBER, 
	"ACTION_ID" NUMBER, 
	"REASON_ID" NUMBER, 
	"LAST_TIME" DATE, 
	"NEXT_TIME" DATE, 
	"ACTION_TIME" DATE, 
	"INCARNATION_INFO" VARCHAR2(4000 BYTE), 
	"JOB_NAME" VARCHAR2(100 BYTE), 
	"SPAREN1" NUMBER, 
	"SPAREN2" NUMBER, 
	"SPAREN3" NUMBER, 
	"SPAREN4" NUMBER, 
	"SPAREN5" NUMBER, 
	"SPAREVC1" VARCHAR2(4000 BYTE), 
	"SPAREVC2" VARCHAR2(4000 BYTE), 
	"SPAREVC3" VARCHAR2(4000 BYTE), 
	"SPAREVC4" VARCHAR2(4000 BYTE), 
	"SPAREVC5" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
