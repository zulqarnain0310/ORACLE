--------------------------------------------------------
--  DDL for Index I_XSTREAM_SERVER1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_XSTREAM_SERVER1" ON "SYS"."XSTREAM$_SERVER" ("SERVER_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
