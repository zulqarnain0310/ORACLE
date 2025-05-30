--------------------------------------------------------
--  DDL for Table RESULT$
--------------------------------------------------------

  CREATE TABLE "SYS"."RESULT$" SHARING=METADATA 
   (	"TOID" RAW(16), 
	"VERSION#" NUMBER, 
	"METHOD#" NUMBER, 
	"RESULT#" NUMBER, 
	"RESULT_TOID" RAW(16), 
	"RESULT_VERSION#" NUMBER, 
	"SYNOBJ#" NUMBER, 
	"PROPERTIES" NUMBER, 
	"CHARSETID" NUMBER, 
	"CHARSETFORM" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER
   ) CLUSTER "SYS"."C_TOID_VERSION#" ("TOID", "VERSION#");
