--------------------------------------------------------
--  DDL for Index WRH$_PLAN_OPERATION_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_PLAN_OPERATION_NAME_PK" ON "SYS"."WRH$_PLAN_OPERATION_NAME" ("DBID", "OPERATION_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
