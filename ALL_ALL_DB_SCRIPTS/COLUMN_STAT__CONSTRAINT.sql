--------------------------------------------------------
--  Constraints for Table COLUMN_STAT$
--------------------------------------------------------

  ALTER TABLE "SYS"."COLUMN_STAT$" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."COLUMN_STAT$" MODIFY ("TS#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."COLUMN_STAT$" MODIFY ("COLID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."COLUMN_STAT$" MODIFY ("STAT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."COLUMN_STAT$" MODIFY ("TRACK_TIME" NOT NULL ENABLE);
