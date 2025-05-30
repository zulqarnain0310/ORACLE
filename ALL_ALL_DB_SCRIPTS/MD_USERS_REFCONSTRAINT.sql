--------------------------------------------------------
--  Ref Constraints for Table MD_USERS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_USERS" ADD CONSTRAINT "MD_USERS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "SYS"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
