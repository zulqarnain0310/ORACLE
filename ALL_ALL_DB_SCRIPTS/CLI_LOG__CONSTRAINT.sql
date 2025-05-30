--------------------------------------------------------
--  Constraints for Table CLI_LOG$
--------------------------------------------------------

  ALTER TABLE "SYS"."CLI_LOG$" MODIFY ("GUID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."CLI_LOG$" ADD CONSTRAINT "CLI_LOG$PK" PRIMARY KEY ("GUID", "USER#", "NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYS"."CLI_LOG$" ADD UNIQUE ("LOG#") DISABLE;
