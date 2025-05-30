--------------------------------------------------------
--  Constraints for Table PDBSTATE$
--------------------------------------------------------

  ALTER TABLE "SYS"."PDBSTATE$" MODIFY ("INST_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PDBSTATE$" MODIFY ("PDB_UID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PDBSTATE$" MODIFY ("STATE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PDBSTATE$" MODIFY ("RESTRICTED" NOT NULL ENABLE);
