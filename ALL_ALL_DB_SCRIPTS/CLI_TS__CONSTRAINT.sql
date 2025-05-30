--------------------------------------------------------
--  Constraints for Table CLI_TS$
--------------------------------------------------------

  ALTER TABLE "SYS"."CLI_TS$" MODIFY ("GUID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."CLI_TS$" ADD CONSTRAINT "CLI_TS$PK" PRIMARY KEY ("GUID", "USER#", "LOG#", "TS#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
