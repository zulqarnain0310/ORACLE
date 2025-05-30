--------------------------------------------------------
--  Ref Constraints for Table DBFS_SFS$_FS
--------------------------------------------------------

  ALTER TABLE "SYS"."DBFS_SFS$_FS" ADD FOREIGN KEY ("TABID", "VOLID")
	  REFERENCES "SYS"."DBFS_SFS$_VOL" ("TABID", "VOLID") ENABLE;
