--------------------------------------------------------
--  DDL for Index I_OLAP_SYNTAX$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_SYNTAX$" ON "SYS"."OLAP_SYNTAX$" ("REF_ROLE", "OWNER_ID", "OWNER_TYPE", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
