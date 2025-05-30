--------------------------------------------------------
--  DDL for Index WRH$_SQLSTAT_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SQLSTAT_BL_PK" ON "SYS"."WRH$_SQLSTAT_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "SQL_ID", "PLAN_HASH_VALUE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
