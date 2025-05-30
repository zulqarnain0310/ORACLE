--------------------------------------------------------
--  Ref Constraints for Table XS$INSTSET_RULE
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$INSTSET_RULE" ADD CONSTRAINT "XS$INSTSET_RULE_FK" FOREIGN KEY ("XDSID#", "ORDER#")
	  REFERENCES "SYS"."XS$INSTSET_LIST" ("XDSID#", "ORDER#") ENABLE;
