--------------------------------------------------------
--  Constraints for Table WRI$_ADV_SQLT_PLANS
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_ADV_SQLT_PLANS" MODIFY ("PLAN_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRI$_ADV_SQLT_PLANS" ADD CONSTRAINT "WRI$_ADV_SQLT_PLANS_PK" PRIMARY KEY ("PLAN_ID", "ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
