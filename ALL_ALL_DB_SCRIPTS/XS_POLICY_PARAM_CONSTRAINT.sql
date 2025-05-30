--------------------------------------------------------
--  Constraints for Table XS$POLICY_PARAM
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$POLICY_PARAM" ADD CONSTRAINT "XS$POLICY_PARAM" PRIMARY KEY ("PNAME", "XDSID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
