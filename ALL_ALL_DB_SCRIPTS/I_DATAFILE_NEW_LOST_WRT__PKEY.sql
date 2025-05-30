--------------------------------------------------------
--  DDL for Index I_DATAFILE_NEW_LOST_WRT$_PKEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_DATAFILE_NEW_LOST_WRT$_PKEY" ON "SYS"."NEW_LOST_WRITE_DATAFILES$" ("DATAFILE_TSID_TRACKED", "DATAFILE_RFN_TRACKED") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
