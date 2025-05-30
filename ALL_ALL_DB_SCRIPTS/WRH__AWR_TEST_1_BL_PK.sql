--------------------------------------------------------
--  DDL for Index WRH$_AWR_TEST_1_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_AWR_TEST_1_BL_PK" ON "SYS"."WRH$_AWR_TEST_1_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "STEP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
