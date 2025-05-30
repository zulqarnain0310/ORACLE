--------------------------------------------------------
--  DDL for Table LINK_LOGONS$
--------------------------------------------------------

  CREATE TABLE "SYS"."LINK_LOGONS$" SHARING=METADATA 
   (	"LOGON_TIME" TIMESTAMP (6), 
	"SOURCE_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
