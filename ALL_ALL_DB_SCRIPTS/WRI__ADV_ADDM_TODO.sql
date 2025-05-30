--------------------------------------------------------
--  DDL for Table WRI$_ADV_ADDM_TODO
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_ADV_ADDM_TODO" SHARING=METADATA 
   (	"INSTANCE_NUMBER" NUMBER, 
	"DBID" NUMBER, 
	"IS_RAC_COORD" NUMBER, 
	"END_SNAP_ID" NUMBER, 
	"SCHEDULE_TIME" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
