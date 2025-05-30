--------------------------------------------------------
--  Ref Constraints for Table ILM_EXECUTIONDETAILS$
--------------------------------------------------------

  ALTER TABLE "SYS"."ILM_EXECUTIONDETAILS$" ADD CONSTRAINT "FK_EXECDET" FOREIGN KEY ("EXECUTION_ID")
	  REFERENCES "SYS"."ILM_EXECUTION$" ("EXECUTION_ID") ON DELETE CASCADE ENABLE;
