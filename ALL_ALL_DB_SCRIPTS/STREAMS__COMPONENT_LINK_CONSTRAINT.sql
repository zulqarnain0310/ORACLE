--------------------------------------------------------
--  Constraints for Table STREAMS$_COMPONENT_LINK
--------------------------------------------------------

  ALTER TABLE "SYS"."STREAMS$_COMPONENT_LINK" MODIFY ("SOURCE_COMPONENT_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_COMPONENT_LINK" MODIFY ("DEST_COMPONENT_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_COMPONENT_LINK" MODIFY ("PATH_ID" NOT NULL ENABLE);
