--------------------------------------------------------
--  DDL for Index I_OLAP_IMPL_OPTIONS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_IMPL_OPTIONS$" ON "SYS"."OLAP_IMPL_OPTIONS$" ("OWNING_OBJECTID", "OBJECT_TYPE", "OPTION_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
