--------------------------------------------------------
--  DDL for Table SYSDBIMFSDBA$
--------------------------------------------------------

  CREATE TABLE "SYS"."SYSDBIMFSDBA$" SHARING=METADATA 
   (	"CUID" NUMBER, 
	"SEGID" NUMBER, 
	"BASEDBA" NUMBER, 
	"BLOCKS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
