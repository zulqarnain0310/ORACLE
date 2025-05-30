--------------------------------------------------------
--  Ref Constraints for Table XS$INSTSET_INH_KEY
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$INSTSET_INH_KEY" ADD CONSTRAINT "XS$INSTSET_INH_KEY_FK" FOREIGN KEY ("XDSID#", "ORDER#")
	  REFERENCES "SYS"."XS$INSTSET_INH" ("XDSID#", "ORDER#") ENABLE;
