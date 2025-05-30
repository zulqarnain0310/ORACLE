--------------------------------------------------------
--  DDL for Index WRH$_JAVA_POOL_ADVICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_JAVA_POOL_ADVICE_PK" ON "SYS"."WRH$_JAVA_POOL_ADVICE" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "JAVA_POOL_SIZE_FOR_ESTIMATE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
