--------------------------------------------------------
--  Constraints for Table PDB_STAT$
--------------------------------------------------------

  ALTER TABLE "SYS"."PDB_STAT$" MODIFY ("CON_UID#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PDB_STAT$" MODIFY ("INST_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PDB_STAT$" MODIFY ("STAT_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PDB_STAT$" MODIFY ("STAT_VALUE" NOT NULL ENABLE);
