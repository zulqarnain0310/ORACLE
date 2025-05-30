--------------------------------------------------------
--  DDL for Index WRWS$_WAREHOUSE_REG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRWS$_WAREHOUSE_REG_PK" ON "SYS"."WRWS$_WAREHOUSE_REGISTRATION" ("CLIENT_NAME", "SRC_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
