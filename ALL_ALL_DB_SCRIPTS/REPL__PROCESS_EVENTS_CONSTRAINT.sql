--------------------------------------------------------
--  Constraints for Table REPL$_PROCESS_EVENTS
--------------------------------------------------------

  ALTER TABLE "SYS"."REPL$_PROCESS_EVENTS" MODIFY ("STREAMS_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."REPL$_PROCESS_EVENTS" MODIFY ("PROCESS_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."REPL$_PROCESS_EVENTS" MODIFY ("STREAMS_NAME" NOT NULL ENABLE);
