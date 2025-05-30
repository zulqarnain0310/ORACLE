--------------------------------------------------------
--  Ref Constraints for Table HS$_INST_DD
--------------------------------------------------------

  ALTER TABLE "SYS"."HS$_INST_DD" ADD CONSTRAINT "HS$_INST_DD_FK1" FOREIGN KEY ("FDS_INST_ID")
	  REFERENCES "SYS"."HS$_FDS_INST" ("FDS_INST_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYS"."HS$_INST_DD" ADD CONSTRAINT "HS$_INST_DD_FK2" FOREIGN KEY ("DD_TABLE_ID")
	  REFERENCES "SYS"."HS$_BASE_DD" ("DD_TABLE_ID") ON DELETE CASCADE ENABLE;
