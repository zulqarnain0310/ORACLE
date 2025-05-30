--------------------------------------------------------
--  DDL for Table WRH$_AWR_TEST_1_BL
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_AWR_TEST_1_BL" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"STEP_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
