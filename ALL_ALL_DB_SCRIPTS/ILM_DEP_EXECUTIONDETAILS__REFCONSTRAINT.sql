--------------------------------------------------------
--  Ref Constraints for Table ILM_DEP_EXECUTIONDETAILS$
--------------------------------------------------------

  ALTER TABLE "SYS"."ILM_DEP_EXECUTIONDETAILS$" ADD CONSTRAINT "FK_DEPDET" FOREIGN KEY ("EXECUTION_ID")
	  REFERENCES "SYS"."ILM_EXECUTION$" ("EXECUTION_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYS"."ILM_DEP_EXECUTIONDETAILS$" ADD CONSTRAINT "FK_DEPDETJOBN" FOREIGN KEY ("PAR_JOBNAME")
	  REFERENCES "SYS"."ILM_RESULTS$" ("JOBNAME") ON DELETE CASCADE ENABLE;
