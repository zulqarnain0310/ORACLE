--------------------------------------------------------
--  DDL for Table SESS_CNT_HISTORY$
--------------------------------------------------------

  CREATE TABLE "SYS"."SESS_CNT_HISTORY$" SHARING=METADATA 
   (	"INSTANCE_ID" VARCHAR2(128 BYTE), 
	"EPOCH_USEC" NUMBER, 
	"SESSION_CNT" NUMBER, 
	"CON_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
