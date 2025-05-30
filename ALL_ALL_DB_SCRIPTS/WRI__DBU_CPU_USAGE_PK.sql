--------------------------------------------------------
--  DDL for Index WRI$_DBU_CPU_USAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_DBU_CPU_USAGE_PK" ON "SYS"."WRI$_DBU_CPU_USAGE" ("DBID", "VERSION", "TIMESTAMP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
