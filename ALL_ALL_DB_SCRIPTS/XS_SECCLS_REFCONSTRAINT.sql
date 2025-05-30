--------------------------------------------------------
--  Ref Constraints for Table XS$SECCLS
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$SECCLS" ADD CONSTRAINT "XS$SECCLS_FK1" FOREIGN KEY ("SC#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
