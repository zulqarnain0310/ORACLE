--------------------------------------------------------
--  Constraints for Table REDEF_STATUS$
--------------------------------------------------------

  ALTER TABLE "SYS"."REDEF_STATUS$" MODIFY ("REDEF_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."REDEF_STATUS$" MODIFY ("PREV_OPERATION" NOT NULL ENABLE);
  ALTER TABLE "SYS"."REDEF_STATUS$" MODIFY ("OBJ_OWNER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."REDEF_STATUS$" MODIFY ("OBJ_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."REDEF_STATUS$" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "SYS"."REDEF_STATUS$" MODIFY ("RESTARTABLE" NOT NULL ENABLE);
