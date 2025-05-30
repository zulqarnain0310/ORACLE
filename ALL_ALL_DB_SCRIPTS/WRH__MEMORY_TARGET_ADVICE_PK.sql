--------------------------------------------------------
--  DDL for Index WRH$_MEMORY_TARGET_ADVICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_MEMORY_TARGET_ADVICE_PK" ON "SYS"."WRH$_MEMORY_TARGET_ADVICE" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "MEMORY_SIZE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
