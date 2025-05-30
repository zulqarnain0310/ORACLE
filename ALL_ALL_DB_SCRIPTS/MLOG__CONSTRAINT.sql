--------------------------------------------------------
--  Constraints for Table MLOG$
--------------------------------------------------------

  ALTER TABLE "SYS"."MLOG$" MODIFY ("MOWNER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MLOG$" MODIFY ("MASTER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MLOG$" MODIFY ("LOG" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MLOG$" MODIFY ("MTIME" NOT NULL ENABLE);
