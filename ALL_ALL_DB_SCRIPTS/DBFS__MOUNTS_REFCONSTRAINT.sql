--------------------------------------------------------
--  Ref Constraints for Table DBFS$_MOUNTS
--------------------------------------------------------

  ALTER TABLE "SYS"."DBFS$_MOUNTS" ADD FOREIGN KEY ("S_OWNER", "S_NAME")
	  REFERENCES "SYS"."DBFS$_STORES" ("S_OWNER", "S_NAME") ENABLE;
