--------------------------------------------------------
--  Constraints for Table WRI$_ADV_SQLA_SUM
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_ADV_SQLA_SUM" ADD CONSTRAINT "WRI$_ADV_SQLA_SUM_PK" PRIMARY KEY ("TASK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
