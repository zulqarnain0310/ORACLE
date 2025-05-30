--------------------------------------------------------
--  DDL for Table PDB_SNAPSHOT$
--------------------------------------------------------

  CREATE TABLE "SYS"."PDB_SNAPSHOT$" SHARING=METADATA 
   (	"CON_ID#" NUMBER, 
	"CON_UID" NUMBER, 
	"SNAPNAME" VARCHAR2(128 BYTE), 
	"SNAPSCN" NUMBER, 
	"PREVSNAPSCN" NUMBER, 
	"SNAPTIME" NUMBER, 
	"PREVSNAPTIME" NUMBER, 
	"ARCHIVEPATH" VARCHAR2(4000 BYTE), 
	"FLAGS" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(1000 BYTE), 
	"SPARE5" VARCHAR2(1000 BYTE), 
	"SPARE6" VARCHAR2(4000 BYTE), 
	"SPARE7" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
