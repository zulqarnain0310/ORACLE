--------------------------------------------------------
--  Constraints for Table WRH$_UNDOSTAT
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_UNDOSTAT" MODIFY ("BEGIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_UNDOSTAT" MODIFY ("END_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_UNDOSTAT" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_UNDOSTAT" MODIFY ("INSTANCE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_UNDOSTAT" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_UNDOSTAT" MODIFY ("UNDOTSN" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_UNDOSTAT" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_UNDOSTAT" ADD CONSTRAINT "WRH$_UNDOSTAT_PK" PRIMARY KEY ("BEGIN_TIME", "END_TIME", "DBID", "INSTANCE_NUMBER", "CON_DBID", "SNAP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
