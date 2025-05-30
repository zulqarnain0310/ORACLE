--------------------------------------------------------
--  Constraints for Table NACL$_WALLET
--------------------------------------------------------

  ALTER TABLE "SYS"."NACL$_WALLET" MODIFY ("WALLET_PATH" NOT NULL ENABLE);
  ALTER TABLE "SYS"."NACL$_WALLET" MODIFY ("ACL#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."NACL$_WALLET" ADD CONSTRAINT "NACL$_WALLET_PK" PRIMARY KEY ("WALLET_PATH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
