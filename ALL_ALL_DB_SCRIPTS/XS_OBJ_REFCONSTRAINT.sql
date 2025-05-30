--------------------------------------------------------
--  Ref Constraints for Table XS$OBJ
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$OBJ" ADD CONSTRAINT "XS$OBJ_FK" FOREIGN KEY ("TENANT")
	  REFERENCES "SYS"."XS$TENANT" ("NAME") ENABLE;
