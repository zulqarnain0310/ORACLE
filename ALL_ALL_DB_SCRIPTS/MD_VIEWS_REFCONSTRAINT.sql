--------------------------------------------------------
--  Ref Constraints for Table MD_VIEWS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_VIEWS" ADD CONSTRAINT "MD_VIEWS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "SYS"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
