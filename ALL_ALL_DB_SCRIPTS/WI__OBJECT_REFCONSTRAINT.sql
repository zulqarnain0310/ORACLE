--------------------------------------------------------
--  Ref Constraints for Table WI$_OBJECT
--------------------------------------------------------

  ALTER TABLE "SYS"."WI$_OBJECT" ADD CONSTRAINT "WI$_OBJECT_FK1" FOREIGN KEY ("JOBID", "TEMPLATEID")
	  REFERENCES "SYS"."WI$_TEMPLATE" ("JOBID", "TEMPLATEID") ON DELETE CASCADE ENABLE;
