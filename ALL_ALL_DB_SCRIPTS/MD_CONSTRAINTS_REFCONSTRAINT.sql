--------------------------------------------------------
--  Ref Constraints for Table MD_CONSTRAINTS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_CONSTRAINTS" ADD CONSTRAINT "MD_CONSTRAINTS_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "SYS"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
