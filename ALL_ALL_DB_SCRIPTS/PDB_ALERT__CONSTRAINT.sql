--------------------------------------------------------
--  Constraints for Table PDB_ALERT$
--------------------------------------------------------

  ALTER TABLE "SYS"."PDB_ALERT$" MODIFY ("CAUSE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PDB_ALERT$" MODIFY ("TYPE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PDB_ALERT$" MODIFY ("TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PDB_ALERT$" MODIFY ("LINE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PDB_ALERT$" MODIFY ("MSG$" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PDB_ALERT$" MODIFY ("NAME" NOT NULL ENABLE);
