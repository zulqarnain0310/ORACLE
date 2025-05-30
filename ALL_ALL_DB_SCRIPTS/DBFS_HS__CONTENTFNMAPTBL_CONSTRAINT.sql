--------------------------------------------------------
--  Constraints for Table DBFS_HS$_CONTENTFNMAPTBL
--------------------------------------------------------

  ALTER TABLE "SYS"."DBFS_HS$_CONTENTFNMAPTBL" ADD PRIMARY KEY ("CONTENTFILENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
