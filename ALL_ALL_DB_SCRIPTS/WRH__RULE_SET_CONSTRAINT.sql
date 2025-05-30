--------------------------------------------------------
--  Constraints for Table WRH$_RULE_SET
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_RULE_SET" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RULE_SET" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RULE_SET" MODIFY ("INSTANCE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RULE_SET" MODIFY ("OWNER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RULE_SET" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RULE_SET" MODIFY ("STARTUP_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RULE_SET" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_RULE_SET" ADD CONSTRAINT "WRH$_RULE_SET_PK" PRIMARY KEY ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "OWNER", "NAME", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
