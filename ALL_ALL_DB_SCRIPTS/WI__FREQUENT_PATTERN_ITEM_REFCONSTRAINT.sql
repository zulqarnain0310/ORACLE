--------------------------------------------------------
--  Ref Constraints for Table WI$_FREQUENT_PATTERN_ITEM
--------------------------------------------------------

  ALTER TABLE "SYS"."WI$_FREQUENT_PATTERN_ITEM" ADD CONSTRAINT "WI$_FREQUENT_PATTERN_ITEM_FK1" FOREIGN KEY ("JOBID", "PATTERNID")
	  REFERENCES "SYS"."WI$_FREQUENT_PATTERN" ("JOBID", "PATTERNID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYS"."WI$_FREQUENT_PATTERN_ITEM" ADD CONSTRAINT "WI$_FREQUENT_PATTERN_ITEM_FK2" FOREIGN KEY ("JOBID", "TEMPLATEID")
	  REFERENCES "SYS"."WI$_TEMPLATE" ("JOBID", "TEMPLATEID") ON DELETE CASCADE ENABLE;
