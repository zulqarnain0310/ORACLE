--------------------------------------------------------
--  DDL for Index WRH$_SQL_PLAN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SQL_PLAN_PK" ON "SYS"."WRH$_SQL_PLAN" ("DBID", "SQL_ID", "PLAN_HASH_VALUE", "ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
