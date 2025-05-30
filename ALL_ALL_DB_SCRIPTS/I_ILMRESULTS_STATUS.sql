--------------------------------------------------------
--  DDL for Index I_ILMRESULTS_STATUS
--------------------------------------------------------

  CREATE INDEX "SYS"."I_ILMRESULTS_STATUS" ON "SYS"."ILM_RESULTS$" ("JOB_STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
