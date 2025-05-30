--------------------------------------------------------
--  Ref Constraints for Table WRM$_SNAPSHOT
--------------------------------------------------------

  ALTER TABLE "SYS"."WRM$_SNAPSHOT" ADD CONSTRAINT "WRM$_SNAPSHOT_FK" FOREIGN KEY ("DBID", "INSTANCE_NUMBER", "STARTUP_TIME")
	  REFERENCES "SYS"."WRM$_DATABASE_INSTANCE" ("DBID", "INSTANCE_NUMBER", "STARTUP_TIME") ON DELETE CASCADE ENABLE;
