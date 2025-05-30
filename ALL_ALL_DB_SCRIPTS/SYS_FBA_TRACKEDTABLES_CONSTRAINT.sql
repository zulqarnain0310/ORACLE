--------------------------------------------------------
--  Constraints for Table SYS_FBA_TRACKEDTABLES
--------------------------------------------------------

  ALTER TABLE "SYS"."SYS_FBA_TRACKEDTABLES" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SYS_FBA_TRACKEDTABLES" MODIFY ("FA#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SYS_FBA_TRACKEDTABLES" ADD UNIQUE ("OBJ#") DISABLE;
