--------------------------------------------------------
--  Ref Constraints for Table XS$ROLE_GRANT
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ROLE_GRANT" ADD CONSTRAINT "XS$ROLE_GRANT_FK1" FOREIGN KEY ("GRANTEE#")
	  REFERENCES "SYS"."XS$PRIN" ("PRIN#") ENABLE;
  ALTER TABLE "SYS"."XS$ROLE_GRANT" ADD CONSTRAINT "XS$ROLE_GRANT_FK2" FOREIGN KEY ("ROLE#")
	  REFERENCES "SYS"."XS$PRIN" ("PRIN#") ENABLE;
