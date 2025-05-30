--------------------------------------------------------
--  Constraints for Table MVREF$_STATS
--------------------------------------------------------

  ALTER TABLE "SYS"."MVREF$_STATS" MODIFY ("MV_OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MVREF$_STATS" MODIFY ("REFRESH_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MVREF$_STATS" MODIFY ("ATOMIC_REFRESH" NOT NULL ENABLE);
