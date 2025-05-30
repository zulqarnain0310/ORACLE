--------------------------------------------------------
--  Constraints for Table CLI_TAB$
--------------------------------------------------------

  ALTER TABLE "SYS"."CLI_TAB$" MODIFY ("GUID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."CLI_TAB$" ADD CONSTRAINT "CLI_TAB$PK" PRIMARY KEY ("GUID", "USER#", "LOG#", "TAB#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
