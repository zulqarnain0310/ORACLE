--------------------------------------------------------
--  Constraints for Table ERROR$
--------------------------------------------------------

  ALTER TABLE "SYS"."ERROR$" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."ERROR$" MODIFY ("SEQUENCE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."ERROR$" MODIFY ("LINE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."ERROR$" MODIFY ("POSITION#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."ERROR$" MODIFY ("TEXTLENGTH" NOT NULL ENABLE);
  ALTER TABLE "SYS"."ERROR$" MODIFY ("TEXT" NOT NULL ENABLE);
