--------------------------------------------------------
--  Ref Constraints for Table HS$_INST_CAPS
--------------------------------------------------------

  ALTER TABLE "SYS"."HS$_INST_CAPS" ADD CONSTRAINT "HS$_INST_CAPS_FK1" FOREIGN KEY ("FDS_INST_ID")
	  REFERENCES "SYS"."HS$_FDS_INST" ("FDS_INST_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYS"."HS$_INST_CAPS" ADD CONSTRAINT "HS$_INST_CAPS_FK2" FOREIGN KEY ("CAP_NUMBER")
	  REFERENCES "SYS"."HS$_BASE_CAPS" ("CAP_NUMBER") ON DELETE CASCADE ENABLE;
