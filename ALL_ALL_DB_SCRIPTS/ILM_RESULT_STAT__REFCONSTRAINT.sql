--------------------------------------------------------
--  Ref Constraints for Table ILM_RESULT_STAT$
--------------------------------------------------------

  ALTER TABLE "SYS"."ILM_RESULT_STAT$" ADD CONSTRAINT "FK_RESST" FOREIGN KEY ("JOBNAME")
	  REFERENCES "SYS"."ILM_RESULTS$" ("JOBNAME") ON DELETE CASCADE ENABLE;
