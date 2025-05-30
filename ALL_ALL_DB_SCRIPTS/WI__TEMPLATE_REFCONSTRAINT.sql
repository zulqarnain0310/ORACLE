--------------------------------------------------------
--  Ref Constraints for Table WI$_TEMPLATE
--------------------------------------------------------

  ALTER TABLE "SYS"."WI$_TEMPLATE" ADD CONSTRAINT "WI$_TEMPLATE_FK1" FOREIGN KEY ("JOBID")
	  REFERENCES "SYS"."WI$_JOB" ("JOBID") ON DELETE CASCADE ENABLE;
