--------------------------------------------------------
--  Ref Constraints for Table TSDP_CONDITION$
--------------------------------------------------------

  ALTER TABLE "SYS"."TSDP_CONDITION$" ADD CONSTRAINT "TSDP_CONDITION$FK" FOREIGN KEY ("SUBPOL#")
	  REFERENCES "SYS"."TSDP_SUBPOL$" ("SUBPOL#") ON DELETE CASCADE ENABLE;
