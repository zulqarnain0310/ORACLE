--------------------------------------------------------
--  Ref Constraints for Table WI$_STATEMENT
--------------------------------------------------------

  ALTER TABLE "SYS"."WI$_STATEMENT" ADD CONSTRAINT "WI$_STATEMENT_FK1" FOREIGN KEY ("JOBID", "TEMPLATEID")
	  REFERENCES "SYS"."WI$_TEMPLATE" ("JOBID", "TEMPLATEID") ON DELETE CASCADE ENABLE;
