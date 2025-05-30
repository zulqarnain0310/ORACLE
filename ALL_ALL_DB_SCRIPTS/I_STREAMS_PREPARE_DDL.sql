--------------------------------------------------------
--  DDL for Index I_STREAMS_PREPARE_DDL
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_PREPARE_DDL" ON "SYS"."STREAMS$_PREPARE_DDL" ("GLOBAL_FLAG", "USRID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
