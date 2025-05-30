--------------------------------------------------------
--  Constraints for Table WRR$_WORKLOAD_SESSIONS
--------------------------------------------------------

  ALTER TABLE "SYS"."WRR$_WORKLOAD_SESSIONS" MODIFY ("GID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRR$_WORKLOAD_SESSIONS" MODIFY ("TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRR$_WORKLOAD_SESSIONS" MODIFY ("VAL" NOT NULL ENABLE);
