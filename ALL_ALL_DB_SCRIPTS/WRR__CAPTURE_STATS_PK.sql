--------------------------------------------------------
--  DDL for Index WRR$_CAPTURE_STATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_CAPTURE_STATS_PK" ON "SYS"."WRR$_CAPTURE_STATS" ("ID", "INSTANCE_NUMBER", "STARTUP_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
