--------------------------------------------------------
--  Ref Constraints for Table LINK_LOGONS$
--------------------------------------------------------

  ALTER TABLE "SYS"."LINK_LOGONS$" ADD CONSTRAINT "FK_SRCID" FOREIGN KEY ("SOURCE_ID")
	  REFERENCES "SYS"."LINK_SOURCES$" ("SOURCE_ID") ON DELETE CASCADE ENABLE;
