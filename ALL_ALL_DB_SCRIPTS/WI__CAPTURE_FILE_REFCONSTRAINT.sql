--------------------------------------------------------
--  Ref Constraints for Table WI$_CAPTURE_FILE
--------------------------------------------------------

  ALTER TABLE "SYS"."WI$_CAPTURE_FILE" ADD CONSTRAINT "WI$_CAPTURE_FILE_FK1" FOREIGN KEY ("JOBID")
	  REFERENCES "SYS"."WI$_JOB" ("JOBID") ON DELETE CASCADE ENABLE;
