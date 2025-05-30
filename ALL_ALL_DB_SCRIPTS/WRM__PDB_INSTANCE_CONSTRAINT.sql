--------------------------------------------------------
--  Constraints for Table WRM$_PDB_INSTANCE
--------------------------------------------------------

  ALTER TABLE "SYS"."WRM$_PDB_INSTANCE" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_PDB_INSTANCE" MODIFY ("INSTANCE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_PDB_INSTANCE" MODIFY ("STARTUP_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_PDB_INSTANCE" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_PDB_INSTANCE" MODIFY ("OPEN_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_PDB_INSTANCE" ADD CONSTRAINT "WRM$_PDB_INSTANCE_PK" PRIMARY KEY ("DBID", "INSTANCE_NUMBER", "STARTUP_TIME", "CON_DBID", "OPEN_TIME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
