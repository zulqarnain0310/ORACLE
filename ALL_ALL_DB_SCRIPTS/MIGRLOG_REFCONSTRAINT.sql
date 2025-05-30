--------------------------------------------------------
--  Ref Constraints for Table MIGRLOG
--------------------------------------------------------

  ALTER TABLE "SYS"."MIGRLOG" ADD CONSTRAINT "MIGR_MIGRLOG_FK" FOREIGN KEY ("PARENT_LOG_ID")
	  REFERENCES "SYS"."MIGRLOG" ("ID") ENABLE;
