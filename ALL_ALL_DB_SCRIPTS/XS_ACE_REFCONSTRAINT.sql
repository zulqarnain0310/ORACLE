--------------------------------------------------------
--  Ref Constraints for Table XS$ACE
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ACE" ADD CONSTRAINT "XS$ACE_FK1" FOREIGN KEY ("ACL#")
	  REFERENCES "SYS"."XS$ACL" ("ACL#") ENABLE;
