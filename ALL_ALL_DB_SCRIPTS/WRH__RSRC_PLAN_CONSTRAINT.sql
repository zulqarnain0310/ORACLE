--------------------------------------------------------
--  Constraints for Table WRH$_RSRC_PLAN
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_RSRC_PLAN" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RSRC_PLAN" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RSRC_PLAN" MODIFY ("INSTANCE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RSRC_PLAN" MODIFY ("SEQUENCE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RSRC_PLAN" MODIFY ("START_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RSRC_PLAN" MODIFY ("PLAN_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RSRC_PLAN" MODIFY ("PLAN_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RSRC_PLAN" MODIFY ("CPU_MANAGED" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RSRC_PLAN" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RSRC_PLAN" ADD CONSTRAINT "WRH$_RSRC_PLAN_PK" PRIMARY KEY ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "SEQUENCE#", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
