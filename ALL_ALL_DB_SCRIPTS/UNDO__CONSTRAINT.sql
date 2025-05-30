--------------------------------------------------------
--  Constraints for Table UNDO$
--------------------------------------------------------

  ALTER TABLE "SYS"."UNDO$" MODIFY ("US#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UNDO$" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UNDO$" MODIFY ("USER#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UNDO$" MODIFY ("FILE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UNDO$" MODIFY ("BLOCK#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UNDO$" MODIFY ("STATUS$" NOT NULL ENABLE);
