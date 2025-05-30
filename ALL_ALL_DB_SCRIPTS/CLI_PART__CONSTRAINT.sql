--------------------------------------------------------
--  Constraints for Table CLI_PART$
--------------------------------------------------------

  ALTER TABLE "SYS"."CLI_PART$" MODIFY ("GUID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."CLI_PART$" ADD CONSTRAINT "CLI_PART$PK" PRIMARY KEY ("GUID", "USER#", "LOG#", "TAB#", "PART#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
