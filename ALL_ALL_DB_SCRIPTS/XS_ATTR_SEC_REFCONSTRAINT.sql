--------------------------------------------------------
--  Ref Constraints for Table XS$ATTR_SEC
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ATTR_SEC" ADD CONSTRAINT "XS$ATTR_SEC_FK1" FOREIGN KEY ("XDSID#")
	  REFERENCES "SYS"."XS$DSEC" ("XDSID#") ENABLE;
  ALTER TABLE "SYS"."XS$ATTR_SEC" ADD CONSTRAINT "XS$ATTR_SEC_FK2" FOREIGN KEY ("PRIV#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
