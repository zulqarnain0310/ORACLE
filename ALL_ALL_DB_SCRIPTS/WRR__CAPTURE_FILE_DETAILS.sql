--------------------------------------------------------
--  DDL for Table WRR$_CAPTURE_FILE_DETAILS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_CAPTURE_FILE_DETAILS" SHARING=METADATA 
   (	"CAP_FILE_ID" NUMBER(*,0), 
	"OBJECT_ID" NUMBER(*,0), 
	"ACTION_CODE" VARCHAR2(1 BYTE), 
	"NUM_CALLS" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
