--------------------------------------------------------
--  Ref Constraints for Table MD_SYNONYMS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_SYNONYMS" ADD CONSTRAINT "MD_SYNONYMS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "SYS"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
