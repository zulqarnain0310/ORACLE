--------------------------------------------------------
--  DDL for Index I_TSM_SRC2$
--------------------------------------------------------

  CREATE INDEX "SYS"."I_TSM_SRC2$" ON "SYS"."TSM_SRC$" ("SRC_SID", "SRC_SERIAL#", "SEQUENCE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
