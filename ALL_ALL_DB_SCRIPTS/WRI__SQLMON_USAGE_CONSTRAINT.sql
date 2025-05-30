--------------------------------------------------------
--  Constraints for Table WRI$_SQLMON_USAGE
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_SQLMON_USAGE" MODIFY ("NUM_DB_REPORTS" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRI$_SQLMON_USAGE" MODIFY ("NUM_EM_REPORTS" NOT NULL ENABLE);
