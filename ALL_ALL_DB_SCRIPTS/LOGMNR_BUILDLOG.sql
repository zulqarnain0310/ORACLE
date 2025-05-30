--------------------------------------------------------
--  DDL for Table LOGMNR_BUILDLOG
--------------------------------------------------------

  CREATE TABLE "SYS"."LOGMNR_BUILDLOG" SHARING=METADATA 
   (	"INITIAL_XID" VARCHAR2(22 BYTE), 
	"BUILD_DATE" VARCHAR2(20 BYTE), 
	"DB_TXN_SCNBAS" NUMBER, 
	"DB_TXN_SCNWRP" NUMBER, 
	"CURRENT_BUILD_STATE" NUMBER, 
	"COMPLETION_STATUS" NUMBER, 
	"MARKED_LOG_FILE_LOW_SCN" NUMBER, 
	"CDB_XID" VARCHAR2(22 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
