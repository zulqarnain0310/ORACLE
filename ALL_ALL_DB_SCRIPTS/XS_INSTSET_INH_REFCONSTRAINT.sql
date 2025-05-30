--------------------------------------------------------
--  Ref Constraints for Table XS$INSTSET_INH
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$INSTSET_INH" ADD CONSTRAINT "XS$INSTSET_INH_FK" FOREIGN KEY ("XDSID#", "ORDER#")
	  REFERENCES "SYS"."XS$INSTSET_LIST" ("XDSID#", "ORDER#") ENABLE;
