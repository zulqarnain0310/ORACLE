--------------------------------------------------------
--  DDL for Index STREAMS$_COMPONENT_LINK_IND
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."STREAMS$_COMPONENT_LINK_IND" ON "SYS"."STREAMS$_COMPONENT_LINK" ("SOURCE_COMPONENT_ID", "DEST_COMPONENT_ID", "PATH_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
