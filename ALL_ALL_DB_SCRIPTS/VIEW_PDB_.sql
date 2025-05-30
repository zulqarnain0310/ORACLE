--------------------------------------------------------
--  DDL for Table VIEW_PDB$
--------------------------------------------------------

  CREATE TABLE "SYS"."VIEW_PDB$" SHARING=METADATA 
   (	"CON_UID" NUMBER, 
	"PORT" NUMBER, 
	"HOST" VARCHAR2(128 BYTE), 
	"SERVICE" VARCHAR2(64 BYTE), 
	"TGT_CON_UID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
