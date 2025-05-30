--------------------------------------------------------
--  Ref Constraints for Table XS$PRIN
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$PRIN" ADD CONSTRAINT "XS$PRIN_FK1" FOREIGN KEY ("PRIN#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
