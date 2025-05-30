--------------------------------------------------------
--  DDL for Table SCHEDULER$_EVTQ_SUB
--------------------------------------------------------

  CREATE TABLE "SYS"."SCHEDULER$_EVTQ_SUB" SHARING=METADATA 
   (	"AGT_NAME" VARCHAR2(128 BYTE), 
	"UNAME" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
