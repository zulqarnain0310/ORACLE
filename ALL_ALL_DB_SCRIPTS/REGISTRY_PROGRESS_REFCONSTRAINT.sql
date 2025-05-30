--------------------------------------------------------
--  Ref Constraints for Table REGISTRY$PROGRESS
--------------------------------------------------------

  ALTER TABLE "SYS"."REGISTRY$PROGRESS" ADD CONSTRAINT "REGISTRY_PROGRESS_FK" FOREIGN KEY ("NAMESPACE", "CID")
	  REFERENCES "SYS"."REGISTRY$" ("NAMESPACE", "CID") ON DELETE CASCADE DISABLE;
