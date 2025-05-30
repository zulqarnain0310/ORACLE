--------------------------------------------------------
--  DDL for Index I_SCHEDULER$_LISTENERADDRESSE2
--------------------------------------------------------

  CREATE INDEX "SYS"."I_SCHEDULER$_LISTENERADDRESSE2" ON "SYS"."SCHEDULER$_LISTENERADDRESSES" ("SERVICE", "INSTANCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
