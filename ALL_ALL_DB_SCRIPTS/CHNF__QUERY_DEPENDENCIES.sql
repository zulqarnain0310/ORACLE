--------------------------------------------------------
--  DDL for Table CHNF$_QUERY_DEPENDENCIES
--------------------------------------------------------

  CREATE TABLE "SYS"."CHNF$_QUERY_DEPENDENCIES" SHARING=METADATA 
   (	"PRIMARYTYPE" NUMBER, 
	"PRIMARYID" NUMBER, 
	"DEPENDENCYTYPE" NUMBER, 
	"DEPENDENTNAME" VARCHAR2(256 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
