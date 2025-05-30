--------------------------------------------------------
--  Ref Constraints for Table MD_APPLICATIONFILES
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_APPLICATIONFILES" ADD CONSTRAINT "MD_FILE_APP_FK" FOREIGN KEY ("APPLICATIONS_ID_FK")
	  REFERENCES "SYS"."MD_APPLICATIONS" ("ID") ON DELETE CASCADE ENABLE;
