--------------------------------------------------------
--  DDL for Index SCHEDULER$_QINFO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_QINFO_PK" ON "SYS"."SCHEDULER$_SRCQ_INFO" ("OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
