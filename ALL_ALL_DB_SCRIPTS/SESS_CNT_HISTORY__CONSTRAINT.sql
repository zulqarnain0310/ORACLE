--------------------------------------------------------
--  Constraints for Table SESS_CNT_HISTORY$
--------------------------------------------------------

  ALTER TABLE "SYS"."SESS_CNT_HISTORY$" MODIFY ("INSTANCE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SESS_CNT_HISTORY$" MODIFY ("EPOCH_USEC" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SESS_CNT_HISTORY$" MODIFY ("SESSION_CNT" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SESS_CNT_HISTORY$" MODIFY ("CON_ID" NOT NULL ENABLE);
