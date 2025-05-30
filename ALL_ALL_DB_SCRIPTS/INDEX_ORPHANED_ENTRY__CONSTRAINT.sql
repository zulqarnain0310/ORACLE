--------------------------------------------------------
--  Constraints for Table INDEX_ORPHANED_ENTRY$
--------------------------------------------------------

  ALTER TABLE "SYS"."INDEX_ORPHANED_ENTRY$" MODIFY ("INDEXOBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."INDEX_ORPHANED_ENTRY$" MODIFY ("TABPARTDOBJ#" NOT NULL ENABLE);
