--------------------------------------------------------
--  DDL for Table DBFS_HS$_STOREID2POLICYCTX
--------------------------------------------------------

  CREATE TABLE "SYS"."DBFS_HS$_STOREID2POLICYCTX" SHARING=METADATA 
   (	"POLICYTYPE" NUMBER, 
	"STOREID" NUMBER, 
	"POLICYCTX" RAW(1024)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
