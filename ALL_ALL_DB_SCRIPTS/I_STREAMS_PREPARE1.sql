--------------------------------------------------------
--  DDL for Index I_STREAMS_PREPARE1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_PREPARE1" ON "SYS"."STREAMS$_PREPARE_OBJECT" ("OBJ#", "CAP_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
