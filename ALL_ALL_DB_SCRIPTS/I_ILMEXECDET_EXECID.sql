--------------------------------------------------------
--  DDL for Index I_ILMEXECDET_EXECID
--------------------------------------------------------

  CREATE INDEX "SYS"."I_ILMEXECDET_EXECID" ON "SYS"."ILM_EXECUTIONDETAILS$" ("EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
