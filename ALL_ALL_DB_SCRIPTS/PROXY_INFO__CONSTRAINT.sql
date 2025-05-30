--------------------------------------------------------
--  Constraints for Table PROXY_INFO$
--------------------------------------------------------

  ALTER TABLE "SYS"."PROXY_INFO$" MODIFY ("CLIENT#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PROXY_INFO$" MODIFY ("PROXY#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PROXY_INFO$" MODIFY ("CREDENTIAL_TYPE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PROXY_INFO$" MODIFY ("FLAGS" NOT NULL ENABLE);
