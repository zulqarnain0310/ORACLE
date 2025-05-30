--------------------------------------------------------
--  Ref Constraints for Table MD_INDEXES
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_INDEXES" ADD CONSTRAINT "MD_INDEXES_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "SYS"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
