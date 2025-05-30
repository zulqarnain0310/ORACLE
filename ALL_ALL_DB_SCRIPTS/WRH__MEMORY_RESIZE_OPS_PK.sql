--------------------------------------------------------
--  DDL for Index WRH$_MEMORY_RESIZE_OPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_MEMORY_RESIZE_OPS_PK" ON "SYS"."WRH$_MEMORY_RESIZE_OPS" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "COMPONENT", "OPER_TYPE", "START_TIME", "TARGET_SIZE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
