--------------------------------------------------------
--  DDL for Table WRR$_CAPTURE_FILES
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_CAPTURE_FILES" SHARING=METADATA 
   (	"CAPTURE_ID" NUMBER, 
	"CAP_FILE_ID" NUMBER(*,0), 
	"SEQ_NUMBER" NUMBER(*,0), 
	"SLAVE_ID" NUMBER(*,0), 
	"FILE_NAME" VARCHAR2(30 BYTE), 
	"FILE_PATH" VARCHAR2(4000 BYTE), 
	"LOGIN_TIME" NUMBER, 
	"LOGIN_WALLCLOCK" NUMBER, 
	"LOGOFF_TIME" NUMBER, 
	"LOGIN_SCN" NUMBER, 
	"LAST_COMPLETE_CALL" NUMBER, 
	"NUM_CALLS" NUMBER(*,0), 
	"GID" NUMBER(*,0), 
	"DB_TIME" NUMBER(*,0), 
	"CONN_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
