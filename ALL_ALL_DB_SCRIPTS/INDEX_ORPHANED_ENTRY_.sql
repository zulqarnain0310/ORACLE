--------------------------------------------------------
--  DDL for Table INDEX_ORPHANED_ENTRY$
--------------------------------------------------------

  CREATE TABLE "SYS"."INDEX_ORPHANED_ENTRY$" SHARING=METADATA 
   (	"INDEXOBJ#" NUMBER, 
	"TABPARTDOBJ#" NUMBER, 
	"HIDDEN" VARCHAR2(1 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
