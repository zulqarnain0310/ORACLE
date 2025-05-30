--------------------------------------------------------
--  Constraints for Table SCHEDULER$_CHAIN
--------------------------------------------------------

  ALTER TABLE "SYS"."SCHEDULER$_CHAIN" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SCHEDULER$_CHAIN" ADD CONSTRAINT "SCHEDULER$_CHAIN_PK" PRIMARY KEY ("OBJ#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
