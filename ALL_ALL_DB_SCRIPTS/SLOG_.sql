--------------------------------------------------------
--  DDL for Table SLOG$
--------------------------------------------------------

  CREATE TABLE "SYS"."SLOG$" SHARING=METADATA 
   (	"MOWNER" VARCHAR2(128 BYTE), 
	"MASTER" VARCHAR2(128 BYTE), 
	"SNAPSHOT" DATE, 
	"SNAPID" NUMBER(*,0), 
	"SSCN" NUMBER, 
	"SNAPTIME" DATE, 
	"TSCN" NUMBER, 
	"USER#" NUMBER
   ) CLUSTER "SYS"."C_MLOG#" ("MASTER", "MOWNER");
