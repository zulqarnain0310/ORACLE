--------------------------------------------------------
--  Ref Constraints for Table XS$ACE_PRIV
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ACE_PRIV" ADD CONSTRAINT "XS$ACE_PRIV_FK1" FOREIGN KEY ("ACL#", "ACE_ORDER#")
	  REFERENCES "SYS"."XS$ACE" ("ACL#", "ORDER#") ENABLE;
  ALTER TABLE "SYS"."XS$ACE_PRIV" ADD CONSTRAINT "XS$ACE_PRIV_FK2" FOREIGN KEY ("PRIV#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
