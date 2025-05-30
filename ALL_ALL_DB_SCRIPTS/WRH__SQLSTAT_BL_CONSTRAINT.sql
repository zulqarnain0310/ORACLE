--------------------------------------------------------
--  Constraints for Table WRH$_SQLSTAT_BL
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_SQLSTAT_BL" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQLSTAT_BL" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQLSTAT_BL" MODIFY ("INSTANCE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQLSTAT_BL" MODIFY ("SQL_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQLSTAT_BL" MODIFY ("PLAN_HASH_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQLSTAT_BL" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SQLSTAT_BL" ADD CONSTRAINT "WRH$_SQLSTAT_BL_PK" PRIMARY KEY ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "SQL_ID", "PLAN_HASH_VALUE", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
