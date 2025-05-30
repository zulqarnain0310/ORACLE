--------------------------------------------------------
--  DDL for Table TRANSACTION_BACKOUT_STATE$
--------------------------------------------------------

  CREATE TABLE "SYS"."TRANSACTION_BACKOUT_STATE$" SHARING=METADATA 
   (	"COMPENSATING_XID" RAW(8), 
	"XID" RAW(8), 
	"BACKOUT_MODE" NUMBER, 
	"DEPENDENT_XID" RAW(8), 
	"USER#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
