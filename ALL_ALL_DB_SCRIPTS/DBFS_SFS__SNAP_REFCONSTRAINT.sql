--------------------------------------------------------
--  Ref Constraints for Table DBFS_SFS$_SNAP
--------------------------------------------------------

  ALTER TABLE "SYS"."DBFS_SFS$_SNAP" ADD FOREIGN KEY ("TABID", "VOLID")
	  REFERENCES "SYS"."DBFS_SFS$_VOL" ("TABID", "VOLID") ENABLE;
