--------------------------------------------------------
--  Constraints for Table DBFS_HS$_STOREIDTABLE
--------------------------------------------------------

  ALTER TABLE "SYS"."DBFS_HS$_STOREIDTABLE" ADD UNIQUE ("STORENAME", "STOREOWNER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
