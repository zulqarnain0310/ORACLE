--------------------------------------------------------
--  Constraints for Table PROXY_DATA$
--------------------------------------------------------

  ALTER TABLE "SYS"."PROXY_DATA$" MODIFY ("CLIENT#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PROXY_DATA$" MODIFY ("PROXY#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PROXY_DATA$" MODIFY ("CREDENTIAL_TYPE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PROXY_DATA$" MODIFY ("CREDENTIAL_VERSION#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PROXY_DATA$" MODIFY ("CREDENTIAL_MINOR#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."PROXY_DATA$" MODIFY ("FLAGS" NOT NULL ENABLE);
