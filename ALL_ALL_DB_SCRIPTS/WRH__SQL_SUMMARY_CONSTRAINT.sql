--------------------------------------------------------
--  Constraints for Table WRH$_SQL_SUMMARY
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_SQL_SUMMARY" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQL_SUMMARY" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQL_SUMMARY" MODIFY ("INSTANCE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQL_SUMMARY" MODIFY ("TOTAL_SQL" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQL_SUMMARY" MODIFY ("TOTAL_SQL_MEM" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQL_SUMMARY" MODIFY ("SINGLE_USE_SQL" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQL_SUMMARY" MODIFY ("SINGLE_USE_SQL_MEM" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQL_SUMMARY" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQL_SUMMARY" ADD CONSTRAINT "WRH$_SQL_SUMMARY_PK" PRIMARY KEY ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
