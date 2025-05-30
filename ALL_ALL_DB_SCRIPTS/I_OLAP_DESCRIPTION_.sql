--------------------------------------------------------
--  DDL for Index I_OLAP_DESCRIPTION$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_DESCRIPTION$" ON "SYS"."OLAP_DESCRIPTIONS$" ("OWNING_OBJECT_TYPE", "OWNING_OBJECT_ID", "LANGUAGE", "DESCRIPTION_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
