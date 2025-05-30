--------------------------------------------------------
--  DDL for Table NACL$_WALLET
--------------------------------------------------------

  CREATE TABLE "SYS"."NACL$_WALLET" SHARING=METADATA 
   (	"WALLET_PATH" VARCHAR2(1000 BYTE), 
	"ACL#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
