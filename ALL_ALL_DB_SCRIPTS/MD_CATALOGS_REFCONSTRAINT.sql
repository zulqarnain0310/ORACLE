--------------------------------------------------------
--  Ref Constraints for Table MD_CATALOGS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_CATALOGS" ADD CONSTRAINT "MD_CATALOGS_MD_CONNECTION_FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "SYS"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
