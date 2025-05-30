--------------------------------------------------------
--  DDL for Table METHOD$
--------------------------------------------------------

  CREATE TABLE "SYS"."METHOD$" SHARING=METADATA 
   (	"TOID" RAW(16), 
	"VERSION#" NUMBER, 
	"METHOD#" NUMBER, 
	"NAME" VARCHAR2(128 BYTE), 
	"PROPERTIES" NUMBER, 
	"PARAMETERS#" NUMBER, 
	"RESULTS" NUMBER, 
	"XFLAGS" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"EXTERNVARNAME" VARCHAR2(4000 BYTE)
   ) CLUSTER "SYS"."C_TOID_VERSION#" ("TOID", "VERSION#");
