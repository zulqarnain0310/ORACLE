--------------------------------------------------------
--  Ref Constraints for Table MD_TABLESPACES
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_TABLESPACES" ADD CONSTRAINT "MD_TABLESPACES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "SYS"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
