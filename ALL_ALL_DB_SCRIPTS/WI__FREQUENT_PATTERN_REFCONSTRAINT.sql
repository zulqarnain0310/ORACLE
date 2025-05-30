--------------------------------------------------------
--  Ref Constraints for Table WI$_FREQUENT_PATTERN
--------------------------------------------------------

  ALTER TABLE "SYS"."WI$_FREQUENT_PATTERN" ADD CONSTRAINT "WI$_FREQUENT_PATTERN_FK1" FOREIGN KEY ("JOBID")
	  REFERENCES "SYS"."WI$_JOB" ("JOBID") ON DELETE CASCADE ENABLE;
