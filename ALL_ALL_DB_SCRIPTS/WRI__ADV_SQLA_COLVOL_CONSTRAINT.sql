--------------------------------------------------------
--  Constraints for Table WRI$_ADV_SQLA_COLVOL
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_ADV_SQLA_COLVOL" ADD CONSTRAINT "WRI$_ADV_SQLA_CV_PK" PRIMARY KEY ("TASK_ID", "TABLE#", "COL#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
