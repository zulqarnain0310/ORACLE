--------------------------------------------------------
--  Ref Constraints for Table TSDP_PARAMETER$
--------------------------------------------------------

  ALTER TABLE "SYS"."TSDP_PARAMETER$" ADD CONSTRAINT "TSDP_PARAMETER$FK" FOREIGN KEY ("SUBPOL#")
	  REFERENCES "SYS"."TSDP_SUBPOL$" ("SUBPOL#") ON DELETE CASCADE ENABLE;
