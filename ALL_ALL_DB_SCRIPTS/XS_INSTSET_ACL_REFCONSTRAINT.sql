--------------------------------------------------------
--  Ref Constraints for Table XS$INSTSET_ACL
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$INSTSET_ACL" ADD CONSTRAINT "XS$INSTSET_ACL_FK1" FOREIGN KEY ("XDSID#", "ORDER#")
	  REFERENCES "SYS"."XS$INSTSET_RULE" ("XDSID#", "ORDER#") ENABLE;
  ALTER TABLE "SYS"."XS$INSTSET_ACL" ADD CONSTRAINT "XS$INSTSET_ACL_FK2" FOREIGN KEY ("ACL#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
