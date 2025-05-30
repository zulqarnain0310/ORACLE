--------------------------------------------------------
--  Constraints for Table MODELALG$
--------------------------------------------------------

  ALTER TABLE "SYS"."MODELALG$" MODIFY ("NUM" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MODELALG$" ADD CONSTRAINT "ENSURE_JSON" CHECK (mdata IS JSON) ENABLE;
