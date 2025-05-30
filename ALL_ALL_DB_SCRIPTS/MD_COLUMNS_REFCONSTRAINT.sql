--------------------------------------------------------
--  Ref Constraints for Table MD_COLUMNS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_COLUMNS" ADD CONSTRAINT "MD_COLUMNS_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "SYS"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
