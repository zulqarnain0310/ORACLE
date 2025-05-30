--------------------------------------------------------
--  DDL for Index LINK_SOURCES$_UI
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."LINK_SOURCES$_UI" ON "SYS"."LINK_SOURCES$" ("DB_NAME", "DBID", "USERNAME", "USER#", "HOST_NAME", "IP_ADDRESS", "PROTOCOL", "DB_UNIQUE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
