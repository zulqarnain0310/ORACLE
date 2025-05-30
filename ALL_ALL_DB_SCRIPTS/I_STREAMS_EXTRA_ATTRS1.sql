--------------------------------------------------------
--  DDL for Index I_STREAMS_EXTRA_ATTRS1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_EXTRA_ATTRS1" ON "SYS"."STREAMS$_EXTRA_ATTRS" ("PROCESS#", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
