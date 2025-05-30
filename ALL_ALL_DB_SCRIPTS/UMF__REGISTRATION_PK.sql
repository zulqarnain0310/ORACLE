--------------------------------------------------------
--  DDL for Index UMF$_REGISTRATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."UMF$_REGISTRATION_PK" ON "SYS"."UMF$_REGISTRATION" ("TOPOLOGY_NAME", "NODE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
