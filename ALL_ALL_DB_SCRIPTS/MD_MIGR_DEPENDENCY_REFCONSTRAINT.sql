--------------------------------------------------------
--  Ref Constraints for Table MD_MIGR_DEPENDENCY
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_MIGR_DEPENDENCY" ADD CONSTRAINT "MIGR_DEPENDENCY_FK" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "SYS"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
