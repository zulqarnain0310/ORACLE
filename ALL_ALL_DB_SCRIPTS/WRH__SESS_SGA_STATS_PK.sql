--------------------------------------------------------
--  DDL for Index WRH$_SESS_SGA_STATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SESS_SGA_STATS_PK" ON "SYS"."WRH$_SESS_SGA_STATS" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "OBJECT_NAME", "SESSION_TYPE", "SESSION_MODULE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
