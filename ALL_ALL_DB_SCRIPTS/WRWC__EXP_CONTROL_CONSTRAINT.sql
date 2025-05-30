--------------------------------------------------------
--  Constraints for Table WRWC$_EXP_CONTROL
--------------------------------------------------------

  ALTER TABLE "SYS"."WRWC$_EXP_CONTROL" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRWC$_EXP_CONTROL" ADD CONSTRAINT "WRWC$_EXP_CONTROL_PK" PRIMARY KEY ("DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
