--------------------------------------------------------
--  Constraints for Table EXTERNAL_SCN_ACTIVITY$
--------------------------------------------------------

  ALTER TABLE "SYS"."EXTERNAL_SCN_ACTIVITY$" MODIFY ("OPERATION_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EXTERNAL_SCN_ACTIVITY$" MODIFY ("SESSION_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EXTERNAL_SCN_ACTIVITY$" MODIFY ("SESSION_SERIAL#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EXTERNAL_SCN_ACTIVITY$" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EXTERNAL_SCN_ACTIVITY$" MODIFY ("RESULT" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EXTERNAL_SCN_ACTIVITY$" MODIFY ("EXTERNAL_SCN" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EXTERNAL_SCN_ACTIVITY$" MODIFY ("SCN_ADJUSTMENT" NOT NULL ENABLE);
