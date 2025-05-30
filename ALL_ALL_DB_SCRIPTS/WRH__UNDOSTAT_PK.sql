--------------------------------------------------------
--  DDL for Index WRH$_UNDOSTAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_UNDOSTAT_PK" ON "SYS"."WRH$_UNDOSTAT" ("BEGIN_TIME", "END_TIME", "DBID", "INSTANCE_NUMBER", "CON_DBID", "SNAP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
