--------------------------------------------------------
--  Ref Constraints for Table REGISTRY$SCHEMAS
--------------------------------------------------------

  ALTER TABLE "SYS"."REGISTRY$SCHEMAS" ADD CONSTRAINT "REGISTRY_SCHEMA_FK" FOREIGN KEY ("NAMESPACE", "CID")
	  REFERENCES "SYS"."REGISTRY$" ("NAMESPACE", "CID") ON DELETE CASCADE DISABLE;
