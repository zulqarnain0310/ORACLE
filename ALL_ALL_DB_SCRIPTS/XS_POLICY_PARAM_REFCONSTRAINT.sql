--------------------------------------------------------
--  Ref Constraints for Table XS$POLICY_PARAM
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$POLICY_PARAM" ADD CONSTRAINT "XS$POLICY_PARAM_FK1" FOREIGN KEY ("XDSID#")
	  REFERENCES "SYS"."XS$DSEC" ("XDSID#") ENABLE;
