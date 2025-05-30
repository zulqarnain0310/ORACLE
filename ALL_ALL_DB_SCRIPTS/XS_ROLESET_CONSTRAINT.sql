--------------------------------------------------------
--  Constraints for Table XS$ROLESET
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ROLESET" ADD CONSTRAINT "XS$ROLESET_PK" PRIMARY KEY ("RSID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
