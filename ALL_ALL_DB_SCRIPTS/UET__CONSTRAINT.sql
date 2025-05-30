--------------------------------------------------------
--  Constraints for Table UET$
--------------------------------------------------------

  ALTER TABLE "SYS"."UET$" MODIFY ("SEGFILE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UET$" MODIFY ("SEGBLOCK#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UET$" MODIFY ("EXT#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UET$" MODIFY ("TS#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UET$" MODIFY ("FILE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UET$" MODIFY ("BLOCK#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UET$" MODIFY ("LENGTH" NOT NULL ENABLE);
