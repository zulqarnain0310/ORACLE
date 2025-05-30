--------------------------------------------------------
--  DDL for Index WI$_EXECUTION_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WI$_EXECUTION_ORDER_PK" ON "SYS"."WI$_EXECUTION_ORDER" ("JOBID", "FILEID", "RANK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
