--------------------------------------------------------
--  DDL for Index I_OLAP_MULTI_OPTIONS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_MULTI_OPTIONS" ON "SYS"."OLAP_MULTI_OPTIONS$" ("OWNING_OBJECTID", "OBJECT_TYPE", "OPTION_TYPE", "OPTION_ORDER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
