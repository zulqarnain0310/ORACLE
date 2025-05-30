--------------------------------------------------------
--  DDL for Table PDBSTATE$
--------------------------------------------------------

  CREATE TABLE "SYS"."PDBSTATE$" SHARING=METADATA 
   (	"INST_NAME" VARCHAR2(128 BYTE), 
	"PDB_GUID" RAW(16), 
	"PDB_UID" NUMBER, 
	"STATE" NUMBER, 
	"RESTRICTED" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
