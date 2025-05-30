--------------------------------------------------------
--  Ref Constraints for Table MD_PARTITIONS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_PARTITIONS" ADD CONSTRAINT "MD_PARTITIONS_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "SYS"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
