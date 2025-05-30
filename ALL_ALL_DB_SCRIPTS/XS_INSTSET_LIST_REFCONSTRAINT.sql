--------------------------------------------------------
--  Ref Constraints for Table XS$INSTSET_LIST
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$INSTSET_LIST" ADD CONSTRAINT "XS$DSEC_INSTSET_FK" FOREIGN KEY ("XDSID#")
	  REFERENCES "SYS"."XS$DSEC" ("XDSID#") ENABLE;
