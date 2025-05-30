--------------------------------------------------------
--  DDL for Index LOGMNR_BUILDLOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."LOGMNR_BUILDLOG_PK" ON "SYS"."LOGMNR_BUILDLOG" ("INITIAL_XID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
