--------------------------------------------------------
--  DDL for Index I_ILM_RESULTS_EXECUTION_ID
--------------------------------------------------------

  CREATE INDEX "SYS"."I_ILM_RESULTS_EXECUTION_ID" ON "SYS"."ILM_RESULTS$" ("EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
