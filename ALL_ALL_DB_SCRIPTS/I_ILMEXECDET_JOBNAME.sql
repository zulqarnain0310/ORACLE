--------------------------------------------------------
--  DDL for Index I_ILMEXECDET_JOBNAME
--------------------------------------------------------

  CREATE INDEX "SYS"."I_ILMEXECDET_JOBNAME" ON "SYS"."ILM_EXECUTIONDETAILS$" ("JOBNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
