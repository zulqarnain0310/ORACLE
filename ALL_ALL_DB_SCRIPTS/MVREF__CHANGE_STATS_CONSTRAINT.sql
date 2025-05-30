--------------------------------------------------------
--  Constraints for Table MVREF$_CHANGE_STATS
--------------------------------------------------------

  ALTER TABLE "SYS"."MVREF$_CHANGE_STATS" MODIFY ("TBL_OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MVREF$_CHANGE_STATS" MODIFY ("MV_OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MVREF$_CHANGE_STATS" MODIFY ("REFRESH_ID" NOT NULL ENABLE);
