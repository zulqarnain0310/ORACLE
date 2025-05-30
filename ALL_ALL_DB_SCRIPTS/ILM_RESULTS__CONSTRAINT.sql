--------------------------------------------------------
--  Constraints for Table ILM_RESULTS$
--------------------------------------------------------

  ALTER TABLE "SYS"."ILM_RESULTS$" ADD CONSTRAINT "PK_RES" PRIMARY KEY ("JOBNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
