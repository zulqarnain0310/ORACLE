--------------------------------------------------------
--  DDL for Index I1_DBFS_HS$_BACKUPFILETABLE
--------------------------------------------------------

  CREATE INDEX "SYS"."I1_DBFS_HS$_BACKUPFILETABLE" ON "SYS"."DBFS_HS$_BACKUPFILETABLE" ("STOREID", "TARBALLID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
