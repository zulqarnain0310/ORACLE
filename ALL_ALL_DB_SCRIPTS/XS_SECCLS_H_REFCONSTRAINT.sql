--------------------------------------------------------
--  Ref Constraints for Table XS$SECCLS_H
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$SECCLS_H" ADD CONSTRAINT "XS$SECCLS_H_FK1" FOREIGN KEY ("SC#")
	  REFERENCES "SYS"."XS$SECCLS" ("SC#") ENABLE;
  ALTER TABLE "SYS"."XS$SECCLS_H" ADD CONSTRAINT "XS$SECCLS_H_FK2" FOREIGN KEY ("PARENT_SC#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
