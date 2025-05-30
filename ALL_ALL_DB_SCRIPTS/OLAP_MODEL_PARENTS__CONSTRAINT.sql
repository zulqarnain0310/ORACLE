--------------------------------------------------------
--  Constraints for Table OLAP_MODEL_PARENTS$
--------------------------------------------------------

  ALTER TABLE "SYS"."OLAP_MODEL_PARENTS$" MODIFY ("MODEL_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."OLAP_MODEL_PARENTS$" MODIFY ("PARENT_MODEL_ID" NOT NULL ENABLE);
