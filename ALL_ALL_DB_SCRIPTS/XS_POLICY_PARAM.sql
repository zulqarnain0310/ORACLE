--------------------------------------------------------
--  DDL for Table XS$POLICY_PARAM
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$POLICY_PARAM" SHARING=METADATA 
   (	"PNAME" VARCHAR2(128 BYTE), 
	"XDSID#" NUMBER, 
	"TYPE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
