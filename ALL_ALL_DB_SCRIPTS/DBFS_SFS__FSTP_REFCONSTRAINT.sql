--------------------------------------------------------
--  Ref Constraints for Table DBFS_SFS$_FSTP
--------------------------------------------------------

  ALTER TABLE "SYS"."DBFS_SFS$_FSTP" ADD FOREIGN KEY ("VOLID", "STD_GUID", "CSNAP#")
	  REFERENCES "SYS"."DBFS_SFS$_FST" ("VOLID", "STD_GUID", "CSNAP#") ENABLE;
