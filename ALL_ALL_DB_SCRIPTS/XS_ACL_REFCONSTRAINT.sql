--------------------------------------------------------
--  Ref Constraints for Table XS$ACL
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ACL" ADD CONSTRAINT "XS$ACL_FK1" FOREIGN KEY ("ACL#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
  ALTER TABLE "SYS"."XS$ACL" ADD CONSTRAINT "XS$ACL_FK2" FOREIGN KEY ("PARENT_ACL#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
  ALTER TABLE "SYS"."XS$ACL" ADD CONSTRAINT "XS$ACL_FK3" FOREIGN KEY ("SC#")
	  REFERENCES "SYS"."XS$OBJ" ("ID") ENABLE;
