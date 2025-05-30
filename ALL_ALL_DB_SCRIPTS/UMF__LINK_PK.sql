--------------------------------------------------------
--  DDL for Index UMF$_LINK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."UMF$_LINK_PK" ON "SYS"."UMF$_LINK" ("TOPOLOGY_NAME", "FROM_NODE_ID", "TO_NODE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
