--------------------------------------------------------
--  Ref Constraints for Table TSDP_SUBPOL$
--------------------------------------------------------

  ALTER TABLE "SYS"."TSDP_SUBPOL$" ADD CONSTRAINT "TSDP_SUBPOL$FK" FOREIGN KEY ("POLICY#")
	  REFERENCES "SYS"."TSDP_POLICY$" ("POLICY#") ON DELETE CASCADE ENABLE;
