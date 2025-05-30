--------------------------------------------------------
--  Ref Constraints for Table DBFS_SFS$_VOL
--------------------------------------------------------

  ALTER TABLE "SYS"."DBFS_SFS$_VOL" ADD FOREIGN KEY ("TABID")
	  REFERENCES "SYS"."DBFS_SFS$_TAB" ("TABID") ENABLE;
