--------------------------------------------------------
--  Ref Constraints for Table MD_GROUPS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_GROUPS" ADD CONSTRAINT "MD_GROUPS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "SYS"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
