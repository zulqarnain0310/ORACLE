--------------------------------------------------------
--  DDL for Table SMON_SCN_TIME
--------------------------------------------------------

  CREATE TABLE "SYS"."SMON_SCN_TIME" SHARING=METADATA 
   (	"THREAD" NUMBER, 
	"TIME_MP" NUMBER, 
	"TIME_DP" DATE, 
	"SCN_WRP" NUMBER, 
	"SCN_BAS" NUMBER, 
	"NUM_MAPPINGS" NUMBER, 
	"TIM_SCN_MAP" RAW(1200), 
	"SCN" NUMBER DEFAULT 0, 
	"ORIG_THREAD" NUMBER DEFAULT 0           /* for downgrade */
   ) CLUSTER "SYS"."SMON_SCN_TO_TIME_AUX" ("THREAD");
  GRANT SELECT ON "SYS"."SMON_SCN_TIME" TO "ORACLE_OCM";
