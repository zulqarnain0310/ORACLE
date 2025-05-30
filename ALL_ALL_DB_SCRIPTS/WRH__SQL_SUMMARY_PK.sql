--------------------------------------------------------
--  DDL for Index WRH$_SQL_SUMMARY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SQL_SUMMARY_PK" ON "SYS"."WRH$_SQL_SUMMARY" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
