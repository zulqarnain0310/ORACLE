--------------------------------------------------------
--  DDL for Index I_NEW_LOST_WRITE_EXTENTS$
--------------------------------------------------------

  CREATE INDEX "SYS"."I_NEW_LOST_WRITE_EXTENTS$" ON "SYS"."NEW_LOST_WRITE_EXTENTS$" ("EXTENT_LENGTH_BLOCKS_2K") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
