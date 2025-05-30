--------------------------------------------------------
--  Ref Constraints for Table SYSDBIMFS$
--------------------------------------------------------

  ALTER TABLE "SYS"."SYSDBIMFS$" ADD CONSTRAINT "SYSDBIMFS_SEGID_REF$" FOREIGN KEY ("SEGID")
	  REFERENCES "SYS"."SYSDBIMFSSEG$" ("SEGID") ON DELETE CASCADE ENABLE;
