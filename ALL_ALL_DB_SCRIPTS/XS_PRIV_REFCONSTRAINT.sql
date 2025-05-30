--------------------------------------------------------
--  Ref Constraints for Table XS$PRIV
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$PRIV" ADD CONSTRAINT "XS$PRIV_FK1" FOREIGN KEY ("PRIV#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
  ALTER TABLE "SYS"."XS$PRIV" ADD CONSTRAINT "XS$PRIV_FK2" FOREIGN KEY ("SC#")
	  REFERENCES "SYS"."XS$SECCLS" ("SC#") ENABLE;
