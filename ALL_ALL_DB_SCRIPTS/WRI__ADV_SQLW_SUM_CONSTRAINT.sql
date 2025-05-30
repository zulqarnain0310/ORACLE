--------------------------------------------------------
--  Constraints for Table WRI$_ADV_SQLW_SUM
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_ADV_SQLW_SUM" ADD CONSTRAINT "WRI$_ADV_SQLW_SUM_PK" PRIMARY KEY ("WORKLOAD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
