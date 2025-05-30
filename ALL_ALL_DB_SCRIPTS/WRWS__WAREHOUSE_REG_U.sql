--------------------------------------------------------
--  DDL for Index WRWS$_WAREHOUSE_REG_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRWS$_WAREHOUSE_REG_U" ON "SYS"."WRWS$_WAREHOUSE_REGISTRATION" ("WH_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
