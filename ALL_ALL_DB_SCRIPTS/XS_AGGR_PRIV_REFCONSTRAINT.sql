--------------------------------------------------------
--  Ref Constraints for Table XS$AGGR_PRIV
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$AGGR_PRIV" ADD CONSTRAINT "XS$AGGR_PRIV_FK1" FOREIGN KEY ("SC#", "AGGR_PRIV#")
	  REFERENCES "SYS"."XS$PRIV" ("SC#", "PRIV#") ENABLE;
  ALTER TABLE "SYS"."XS$AGGR_PRIV" ADD CONSTRAINT "XS$AGGR_PRIV_FK2" FOREIGN KEY ("IMPLIED_PRIV#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
