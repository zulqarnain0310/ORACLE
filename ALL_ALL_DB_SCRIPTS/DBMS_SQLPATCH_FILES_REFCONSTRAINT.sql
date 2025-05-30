--------------------------------------------------------
--  Ref Constraints for Table DBMS_SQLPATCH_FILES
--------------------------------------------------------

  ALTER TABLE "SYS"."DBMS_SQLPATCH_FILES" ADD CONSTRAINT "DBMS_SQLPATCH_FILES_FK" FOREIGN KEY ("PATCH_ID", "PATCH_UID")
	  REFERENCES "SYS"."DBMS_SQLPATCH_STATE" ("S_CURRENT_PATCH_ID", "S_CURRENT_PATCH_UID") ENABLE;
