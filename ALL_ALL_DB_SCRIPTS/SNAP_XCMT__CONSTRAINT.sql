--------------------------------------------------------
--  Constraints for Table SNAP_XCMT$
--------------------------------------------------------

  ALTER TABLE "SYS"."SNAP_XCMT$" MODIFY ("XID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SNAP_XCMT$" MODIFY ("COMMIT_SCN" NOT NULL ENABLE);
