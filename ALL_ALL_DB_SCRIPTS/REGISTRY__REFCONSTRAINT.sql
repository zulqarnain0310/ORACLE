--------------------------------------------------------
--  Ref Constraints for Table REGISTRY$
--------------------------------------------------------

  ALTER TABLE "SYS"."REGISTRY$" ADD CONSTRAINT "REGISTRY_PARENT_FK" FOREIGN KEY ("NAMESPACE", "PID")
	  REFERENCES "SYS"."REGISTRY$" ("NAMESPACE", "CID") ON DELETE CASCADE DISABLE;
