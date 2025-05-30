--------------------------------------------------------
--  Ref Constraints for Table HS$_CLASS_DD
--------------------------------------------------------

  ALTER TABLE "SYS"."HS$_CLASS_DD" ADD CONSTRAINT "HS$_CLASS_DD_FK1" FOREIGN KEY ("FDS_CLASS_ID")
	  REFERENCES "SYS"."HS$_FDS_CLASS" ("FDS_CLASS_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYS"."HS$_CLASS_DD" ADD CONSTRAINT "HS$_CLASS_DD_FK2" FOREIGN KEY ("DD_TABLE_ID")
	  REFERENCES "SYS"."HS$_BASE_DD" ("DD_TABLE_ID") ON DELETE CASCADE ENABLE;
