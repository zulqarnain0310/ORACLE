--------------------------------------------------------
--  Ref Constraints for Table TSDP_SENSITIVE_TYPE$
--------------------------------------------------------

  ALTER TABLE "SYS"."TSDP_SENSITIVE_TYPE$" ADD CONSTRAINT "TSDP_SENSITIVE_TYPE$FK" FOREIGN KEY ("SOURCE#")
	  REFERENCES "SYS"."TSDP_SOURCE$" ("SOURCE#") ON DELETE CASCADE ENABLE;
