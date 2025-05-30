--------------------------------------------------------
--  Constraints for Table WRH$_MEMORY_RESIZE_OPS
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_MEMORY_RESIZE_OPS" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_MEMORY_RESIZE_OPS" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_MEMORY_RESIZE_OPS" MODIFY ("INSTANCE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_MEMORY_RESIZE_OPS" MODIFY ("COMPONENT" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_MEMORY_RESIZE_OPS" MODIFY ("OPER_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_MEMORY_RESIZE_OPS" MODIFY ("START_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_MEMORY_RESIZE_OPS" MODIFY ("END_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_MEMORY_RESIZE_OPS" MODIFY ("TARGET_SIZE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_MEMORY_RESIZE_OPS" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_MEMORY_RESIZE_OPS" ADD CONSTRAINT "WRH$_MEMORY_RESIZE_OPS_PK" PRIMARY KEY ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "COMPONENT", "OPER_TYPE", "START_TIME", "TARGET_SIZE", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
