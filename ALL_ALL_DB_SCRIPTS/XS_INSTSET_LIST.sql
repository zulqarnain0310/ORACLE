--------------------------------------------------------
--  DDL for Table XS$INSTSET_LIST
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$INSTSET_LIST" SHARING=METADATA 
   (	"XDSID#" NUMBER, 
	"ORDER#" NUMBER, 
	"TYPE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
