--------------------------------------------------------
--  Ref Constraints for Table MD_FILE_ARTIFACTS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_FILE_ARTIFACTS" ADD CONSTRAINT "MD_ARTIFACT_FILE_FK" FOREIGN KEY ("APPLICATIONFILES_ID")
	  REFERENCES "SYS"."MD_APPLICATIONFILES" ("ID") ON DELETE CASCADE ENABLE;
