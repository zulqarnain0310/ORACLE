--------------------------------------------------------
--  Ref Constraints for Table XS$ROLESET_ROLES
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ROLESET_ROLES" ADD CONSTRAINT "XS$ROLESET_ROLES_FK1" FOREIGN KEY ("RSID#")
	  REFERENCES "SYS"."XS$ROLESET" ("RSID#") ENABLE;
  ALTER TABLE "SYS"."XS$ROLESET_ROLES" ADD CONSTRAINT "XS$ROLESET_ROLES_FK2" FOREIGN KEY ("ROLE#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
