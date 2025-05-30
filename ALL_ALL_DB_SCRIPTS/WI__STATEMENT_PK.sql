--------------------------------------------------------
--  DDL for Index WI$_STATEMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WI$_STATEMENT_PK" ON "SYS"."WI$_STATEMENT" ("JOBID", "TEMPLATEID", "RANK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
