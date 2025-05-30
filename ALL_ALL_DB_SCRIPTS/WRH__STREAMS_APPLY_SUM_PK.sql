--------------------------------------------------------
--  DDL for Index WRH$_STREAMS_APPLY_SUM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_STREAMS_APPLY_SUM_PK" ON "SYS"."WRH$_STREAMS_APPLY_SUM" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "APPLY_NAME", "SESSION_MODULE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
