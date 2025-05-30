--------------------------------------------------------
--  DDL for Index WRI$_STS_SENSITIVE_SQL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_STS_SENSITIVE_SQL_PK" ON "SYS"."WRI$_STS_SENSITIVE_SQL" ("SCRIPT_ID", "STMT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
