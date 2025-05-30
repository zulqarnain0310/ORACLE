--------------------------------------------------------
--  Ref Constraints for Table XS$DSEC
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$DSEC" ADD CONSTRAINT "XS$DSEC_FK" FOREIGN KEY ("XDSID#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
