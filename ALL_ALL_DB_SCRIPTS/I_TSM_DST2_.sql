--------------------------------------------------------
--  DDL for Index I_TSM_DST2$
--------------------------------------------------------

  CREATE INDEX "SYS"."I_TSM_DST2$" ON "SYS"."TSM_DST$" ("DST_SID", "DST_SERIAL#", "SEQUENCE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
