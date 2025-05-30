--------------------------------------------------------
--  Constraints for Table SCHEDULER$_FILEWATCHER_RESEND
--------------------------------------------------------

  ALTER TABLE "SYS"."SCHEDULER$_FILEWATCHER_RESEND" ADD CONSTRAINT "SCHEDULER$_FW_RS_PK" PRIMARY KEY ("DESTINATION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
