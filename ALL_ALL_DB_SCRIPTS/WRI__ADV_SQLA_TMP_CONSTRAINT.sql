--------------------------------------------------------
--  Constraints for Table WRI$_ADV_SQLA_TMP
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_ADV_SQLA_TMP" ADD CONSTRAINT "WRI$_ADV_SQLA_TMP_PK" PRIMARY KEY ("OWNER#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
