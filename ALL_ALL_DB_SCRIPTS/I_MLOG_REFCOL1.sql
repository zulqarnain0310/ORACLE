--------------------------------------------------------
--  DDL for Index I_MLOG_REFCOL1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_MLOG_REFCOL1" ON "SYS"."MLOG_REFCOL$" ("MOWNER", "MASTER", "COLNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
