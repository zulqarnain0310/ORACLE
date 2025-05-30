--------------------------------------------------------
--  DDL for Index WRW$_WAREHOUSE_CONFIG_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRW$_WAREHOUSE_CONFIG_U" ON "SYS"."WRW$_WAREHOUSE_CONFIG" ("NODE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
