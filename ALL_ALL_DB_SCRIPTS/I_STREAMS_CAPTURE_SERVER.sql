--------------------------------------------------------
--  DDL for Index I_STREAMS_CAPTURE_SERVER
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_CAPTURE_SERVER" ON "SYS"."STREAMS$_CAPTURE_SERVER" ("CAPTURE_NAME", "PROPAGATION_NAME", "APPLY_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
