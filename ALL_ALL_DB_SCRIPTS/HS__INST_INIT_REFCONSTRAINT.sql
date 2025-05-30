--------------------------------------------------------
--  Ref Constraints for Table HS$_INST_INIT
--------------------------------------------------------

  ALTER TABLE "SYS"."HS$_INST_INIT" ADD CONSTRAINT "HS$_INST_INIT_FK1" FOREIGN KEY ("FDS_INST_ID")
	  REFERENCES "SYS"."HS$_FDS_INST" ("FDS_INST_ID") ON DELETE CASCADE ENABLE;
