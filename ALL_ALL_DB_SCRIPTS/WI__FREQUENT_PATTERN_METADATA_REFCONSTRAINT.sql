--------------------------------------------------------
--  Ref Constraints for Table WI$_FREQUENT_PATTERN_METADATA
--------------------------------------------------------

  ALTER TABLE "SYS"."WI$_FREQUENT_PATTERN_METADATA" ADD CONSTRAINT "WI$_FREQ_PATTERN_METADATA_FK1" FOREIGN KEY ("JOBID")
	  REFERENCES "SYS"."WI$_JOB" ("JOBID") ON DELETE CASCADE ENABLE;
