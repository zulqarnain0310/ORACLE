--------------------------------------------------------
--  DDL for Index WRH$_LATCH_PARENT_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_LATCH_PARENT_BL_PK" ON "SYS"."WRH$_LATCH_PARENT_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "LATCH_HASH", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
