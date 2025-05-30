--------------------------------------------------------
--  DDL for Index WRH$_WAITSTAT_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_WAITSTAT_BL_PK" ON "SYS"."WRH$_WAITSTAT_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "CLASS", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
