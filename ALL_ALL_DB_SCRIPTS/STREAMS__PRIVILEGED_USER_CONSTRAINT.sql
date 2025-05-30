--------------------------------------------------------
--  Constraints for Table STREAMS$_PRIVILEGED_USER
--------------------------------------------------------

  ALTER TABLE "SYS"."STREAMS$_PRIVILEGED_USER" MODIFY ("USER#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_PRIVILEGED_USER" MODIFY ("PRIVS" NOT NULL ENABLE);
