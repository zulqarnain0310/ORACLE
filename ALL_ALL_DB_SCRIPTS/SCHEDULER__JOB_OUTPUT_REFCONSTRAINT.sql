--------------------------------------------------------
--  Ref Constraints for Table SCHEDULER$_JOB_OUTPUT
--------------------------------------------------------

  ALTER TABLE "SYS"."SCHEDULER$_JOB_OUTPUT" ADD CONSTRAINT "SCHEDULER$_JOB_OUTPUT_FK" FOREIGN KEY ("LOG_ID")
	  REFERENCES "SYS"."SCHEDULER$_JOB_RUN_DETAILS" ("LOG_ID") ON DELETE CASCADE ENABLE;
