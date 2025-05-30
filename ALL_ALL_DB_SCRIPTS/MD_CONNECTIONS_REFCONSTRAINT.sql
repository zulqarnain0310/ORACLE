--------------------------------------------------------
--  Ref Constraints for Table MD_CONNECTIONS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_CONNECTIONS" ADD CONSTRAINT "MD_CONNECTIONS_MD_PROJECT_FK1" FOREIGN KEY ("PROJECT_ID_FK")
	  REFERENCES "SYS"."MD_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;
