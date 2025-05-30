--------------------------------------------------------
--  DDL for Table XS$INSTSET_ACL
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$INSTSET_ACL" SHARING=METADATA 
   (	"XDSID#" NUMBER, 
	"ORDER#" NUMBER, 
	"ACL#" NUMBER, 
	"ACL_ORDER#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
