--------------------------------------------------------
--  Ref Constraints for Table IM_DOMAIN$
--------------------------------------------------------

  ALTER TABLE "SYS"."IM_DOMAIN$" ADD CONSTRAINT "IM_DOMAIN_FK" FOREIGN KEY ("DOMAIN#")
	  REFERENCES "SYS"."IM_JOINGROUP$" ("DOMAIN#") ON DELETE CASCADE ENABLE;
