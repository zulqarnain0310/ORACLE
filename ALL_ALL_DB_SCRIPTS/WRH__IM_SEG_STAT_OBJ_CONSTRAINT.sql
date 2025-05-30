--------------------------------------------------------
--  Constraints for Table WRH$_IM_SEG_STAT_OBJ
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_IM_SEG_STAT_OBJ" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_IM_SEG_STAT_OBJ" MODIFY ("DATAOBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_IM_SEG_STAT_OBJ" MODIFY ("OWNER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_IM_SEG_STAT_OBJ" ADD CONSTRAINT "WRH$_IM_SEG_STAT_OBJ_PK" PRIMARY KEY ("DBID", "TS#", "OBJ#", "DATAOBJ#", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
