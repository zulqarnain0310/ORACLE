--------------------------------------------------------
--  DDL for Index I_XSTREAM_PARAMETERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_XSTREAM_PARAMETERS" ON "SYS"."XSTREAM$_PARAMETERS" ("SERVER_NAME", "SERVER_TYPE", "POSITION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
