--------------------------------------------------------
--  DDL for Table XS$ACL_PARAM
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$ACL_PARAM" SHARING=METADATA 
   (	"XDSID#" NUMBER, 
	"ACL#" NUMBER, 
	"PNAME" VARCHAR2(128 BYTE), 
	"PVALUE1" NUMBER, 
	"PVALUE2" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
