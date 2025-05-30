--------------------------------------------------------
--  Constraints for Table CLI_INST$
--------------------------------------------------------

  ALTER TABLE "SYS"."CLI_INST$" MODIFY ("GUID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."CLI_INST$" ADD CONSTRAINT "CLI_INST$PK" PRIMARY KEY ("GUID", "USER#", "LOG#", "INST#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
