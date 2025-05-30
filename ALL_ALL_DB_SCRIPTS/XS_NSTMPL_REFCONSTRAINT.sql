--------------------------------------------------------
--  Ref Constraints for Table XS$NSTMPL
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$NSTMPL" ADD CONSTRAINT "XS$NSTMPL_FK1" FOREIGN KEY ("NS#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
  ALTER TABLE "SYS"."XS$NSTMPL" ADD CONSTRAINT "XS$NSTMP1_FK2" FOREIGN KEY ("ACL#")
	  REFERENCES "SYS"."XS$ACL" ("ACL#") ENABLE;
