--------------------------------------------------------
--  Constraints for Table XSTREAM$_SERVER_CONNECTION
--------------------------------------------------------

  ALTER TABLE "SYS"."XSTREAM$_SERVER_CONNECTION" MODIFY ("OUTBOUND_SERVER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."XSTREAM$_SERVER_CONNECTION" MODIFY ("INBOUND_SERVER" NOT NULL ENABLE);
