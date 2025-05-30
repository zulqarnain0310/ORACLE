--------------------------------------------------------
--  DDL for Index PK_RES
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."PK_RES" ON "SYS"."ILM_RESULTS$" ("JOBNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
