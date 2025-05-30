--------------------------------------------------------
--  Ref Constraints for Table XS$PROXY_ROLE
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$PROXY_ROLE" ADD CONSTRAINT "XS$PROXY_ROLE_FK1" FOREIGN KEY ("PROXY#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
  ALTER TABLE "SYS"."XS$PROXY_ROLE" ADD CONSTRAINT "XS$PROXY_ROLE_FK2" FOREIGN KEY ("ROLE#")
	  REFERENCES "SYS"."XS$PRIN" ("PRIN#") ENABLE;
