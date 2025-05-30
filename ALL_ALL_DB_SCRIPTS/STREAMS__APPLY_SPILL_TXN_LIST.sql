--------------------------------------------------------
--  DDL for Table STREAMS$_APPLY_SPILL_TXN_LIST
--------------------------------------------------------

  CREATE TABLE "SYS"."STREAMS$_APPLY_SPILL_TXN_LIST" SHARING=METADATA 
   (	"TXNKEY" NUMBER, 
	"STATUS" VARCHAR2(1 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(4000 BYTE), 
	"SPARE4" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
