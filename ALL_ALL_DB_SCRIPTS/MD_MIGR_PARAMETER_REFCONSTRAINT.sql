--------------------------------------------------------
--  Ref Constraints for Table MD_MIGR_PARAMETER
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_MIGR_PARAMETER" ADD CONSTRAINT "MIGR_PARAMETER_FK" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "SYS"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
