--------------------------------------------------------
--  Constraints for Table WRR$_REPLAY_FILES
--------------------------------------------------------

  ALTER TABLE "SYS"."WRR$_REPLAY_FILES" MODIFY ("CAP_FILE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRR$_REPLAY_FILES" ADD CONSTRAINT "WRR$_REPLAY_FILES_PK" PRIMARY KEY ("CAP_FILE_ID", "SCHEDULE_CAP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
