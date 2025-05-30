--------------------------------------------------------
--  DDL for Index I_PROXY_ROLE_INFO$_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_PROXY_ROLE_INFO$_2" ON "SYS"."PROXY_ROLE_INFO$" ("CLIENT#", "PROXY#", "ROLE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
