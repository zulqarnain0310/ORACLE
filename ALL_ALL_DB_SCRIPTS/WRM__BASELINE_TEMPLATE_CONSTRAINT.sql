--------------------------------------------------------
--  Constraints for Table WRM$_BASELINE_TEMPLATE
--------------------------------------------------------

  ALTER TABLE "SYS"."WRM$_BASELINE_TEMPLATE" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_BASELINE_TEMPLATE" MODIFY ("TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_BASELINE_TEMPLATE" MODIFY ("TEMPLATE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_BASELINE_TEMPLATE" MODIFY ("TEMPLATE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_BASELINE_TEMPLATE" MODIFY ("BASELINE_NAME_PREFIX" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_BASELINE_TEMPLATE" MODIFY ("START_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_BASELINE_TEMPLATE" MODIFY ("END_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_BASELINE_TEMPLATE" ADD CONSTRAINT "WRM$_BASELINE_TEMPLATE_PK" PRIMARY KEY ("DBID", "TEMPLATE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
