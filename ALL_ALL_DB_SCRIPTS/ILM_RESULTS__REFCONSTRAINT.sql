--------------------------------------------------------
--  Ref Constraints for Table ILM_RESULTS$
--------------------------------------------------------

  ALTER TABLE "SYS"."ILM_RESULTS$" ADD CONSTRAINT "FK_RES" FOREIGN KEY ("EXECUTION_ID")
	  REFERENCES "SYS"."ILM_EXECUTION$" ("EXECUTION_ID") ON DELETE CASCADE ENABLE;
