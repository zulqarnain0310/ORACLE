--------------------------------------------------------
--  Constraints for Table EPG$_AUTH
--------------------------------------------------------

  ALTER TABLE "SYS"."EPG$_AUTH" MODIFY ("DADNAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EPG$_AUTH" MODIFY ("USER#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EPG$_AUTH" ADD CONSTRAINT "EPG$_AUTH_PK" PRIMARY KEY ("DADNAME", "USER#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
