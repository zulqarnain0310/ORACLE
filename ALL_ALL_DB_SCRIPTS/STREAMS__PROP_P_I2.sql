--------------------------------------------------------
--  DDL for Index STREAMS$_PROP_P_I2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."STREAMS$_PROP_P_I2" ON "SYS"."STREAMS$_PROPAGATION_PROCESS" ("SOURCE_QUEUE_SCHEMA", "SOURCE_QUEUE", "DESTINATION_QUEUE_SCHEMA", "DESTINATION_QUEUE", "DESTINATION_DBLINK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
