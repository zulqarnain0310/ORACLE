--------------------------------------------------------
--  DDL for Index I_SCHEDULER$_LISTENERADDRESSES
--------------------------------------------------------

  CREATE INDEX "SYS"."I_SCHEDULER$_LISTENERADDRESSES" ON "SYS"."SCHEDULER$_LISTENERADDRESSES" ("SERVICE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
