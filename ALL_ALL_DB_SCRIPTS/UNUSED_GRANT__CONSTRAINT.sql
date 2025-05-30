--------------------------------------------------------
--  Constraints for Table UNUSED_GRANT$
--------------------------------------------------------

  ALTER TABLE "SYS"."UNUSED_GRANT$" MODIFY ("CAPTURE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UNUSED_GRANT$" MODIFY ("RUN_SEQ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UNUSED_GRANT$" MODIFY ("GRANTEE#" NOT NULL ENABLE);
