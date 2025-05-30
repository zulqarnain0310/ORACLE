--------------------------------------------------------
--  Ref Constraints for Table XS$ROLESET
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ROLESET" ADD CONSTRAINT "XS$ROLESET_FK" FOREIGN KEY ("RSID#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
