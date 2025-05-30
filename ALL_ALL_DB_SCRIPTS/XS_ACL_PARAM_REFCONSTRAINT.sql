--------------------------------------------------------
--  Ref Constraints for Table XS$ACL_PARAM
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ACL_PARAM" ADD CONSTRAINT "XS$ACL_PARAM_FK1" FOREIGN KEY ("PNAME", "XDSID#")
	  REFERENCES "SYS"."XS$POLICY_PARAM" ("PNAME", "XDSID#") ENABLE;
  ALTER TABLE "SYS"."XS$ACL_PARAM" ADD CONSTRAINT "XS$ACL_PARAM_FK2" FOREIGN KEY ("ACL#")
	  REFERENCES "SYS"."XS$ACL" ("ACL#") ENABLE;
