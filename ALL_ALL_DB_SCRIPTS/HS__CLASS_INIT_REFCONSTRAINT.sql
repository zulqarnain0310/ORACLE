--------------------------------------------------------
--  Ref Constraints for Table HS$_CLASS_INIT
--------------------------------------------------------

  ALTER TABLE "SYS"."HS$_CLASS_INIT" ADD CONSTRAINT "HS$_CLASS_INIT_FK1" FOREIGN KEY ("FDS_CLASS_ID")
	  REFERENCES "SYS"."HS$_FDS_CLASS" ("FDS_CLASS_ID") ON DELETE CASCADE ENABLE;
