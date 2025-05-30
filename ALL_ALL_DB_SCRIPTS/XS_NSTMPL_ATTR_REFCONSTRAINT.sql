--------------------------------------------------------
--  Ref Constraints for Table XS$NSTMPL_ATTR
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$NSTMPL_ATTR" ADD CONSTRAINT "XS$NSTMPL_ATTR_FK" FOREIGN KEY ("NS#")
	  REFERENCES "SYS"."XS$NSTMPL" ("NS#") ENABLE;
