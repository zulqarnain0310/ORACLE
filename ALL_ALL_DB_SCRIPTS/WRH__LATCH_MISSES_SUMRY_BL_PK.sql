--------------------------------------------------------
--  DDL for Index WRH$_LATCH_MISSES_SUMRY_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_LATCH_MISSES_SUMRY_BL_PK" ON "SYS"."WRH$_LATCH_MISSES_SUMMARY_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "PARENT_NAME", "WHERE_IN_CODE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
