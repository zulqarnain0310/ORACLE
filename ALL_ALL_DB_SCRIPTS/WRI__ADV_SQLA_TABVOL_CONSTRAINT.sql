--------------------------------------------------------
--  Constraints for Table WRI$_ADV_SQLA_TABVOL
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_ADV_SQLA_TABVOL" ADD CONSTRAINT "WRI$_ADV_SQLA_TV_PK" PRIMARY KEY ("TASK_ID", "TABLE#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
