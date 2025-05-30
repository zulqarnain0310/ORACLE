--------------------------------------------------------
--  Ref Constraints for Table HS$_FDS_INST
--------------------------------------------------------

  ALTER TABLE "SYS"."HS$_FDS_INST" ADD CONSTRAINT "HS$_FDS_INST_FK1" FOREIGN KEY ("FDS_CLASS_ID")
	  REFERENCES "SYS"."HS$_FDS_CLASS" ("FDS_CLASS_ID") ON DELETE CASCADE ENABLE;
