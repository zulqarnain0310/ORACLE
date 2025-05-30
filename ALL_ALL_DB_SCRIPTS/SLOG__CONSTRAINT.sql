--------------------------------------------------------
--  Constraints for Table SLOG$
--------------------------------------------------------

  ALTER TABLE "SYS"."SLOG$" MODIFY ("MOWNER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SLOG$" MODIFY ("MASTER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SLOG$" MODIFY ("SNAPTIME" NOT NULL ENABLE);
