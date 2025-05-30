--------------------------------------------------------
--  Constraints for Table XS$INSTSET_RULE
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$INSTSET_RULE" ADD CONSTRAINT "XS$INSTSET_RULE_PK" PRIMARY KEY ("XDSID#", "ORDER#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
