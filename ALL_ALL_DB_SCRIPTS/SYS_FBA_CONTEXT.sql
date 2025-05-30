--------------------------------------------------------
--  DDL for Table SYS_FBA_CONTEXT
--------------------------------------------------------

  CREATE TABLE "SYS"."SYS_FBA_CONTEXT" SHARING=METADATA 
   (	"XID" RAW(8), 
	"NAMESPACE" VARCHAR2(255 BYTE), 
	"PARAMETER" VARCHAR2(255 BYTE), 
	"VALUE" VARCHAR2(256 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
