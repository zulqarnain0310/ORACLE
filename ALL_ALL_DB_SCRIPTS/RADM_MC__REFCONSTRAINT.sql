--------------------------------------------------------
--  Ref Constraints for Table RADM_MC$
--------------------------------------------------------

  ALTER TABLE "SYS"."RADM_MC$" ADD CONSTRAINT "RADM_MC_PE_NUMBER" FOREIGN KEY ("PE#")
	  REFERENCES "SYS"."RADM_PE$" ("PE#") ENABLE;
