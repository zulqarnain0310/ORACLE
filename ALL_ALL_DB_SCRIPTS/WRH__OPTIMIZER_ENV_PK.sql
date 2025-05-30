--------------------------------------------------------
--  DDL for Index WRH$_OPTIMIZER_ENV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_OPTIMIZER_ENV_PK" ON "SYS"."WRH$_OPTIMIZER_ENV" ("DBID", "OPTIMIZER_ENV_HASH_VALUE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
