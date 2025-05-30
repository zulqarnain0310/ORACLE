--------------------------------------------------------
--  DDL for Index I_OLAP_ATTRIBUTE_VISIBILITY$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_ATTRIBUTE_VISIBILITY$" ON "SYS"."OLAP_ATTRIBUTE_VISIBILITY$" ("ATTRIBUTE_ID", "OWNING_DIM_ID", "OWNING_DIM_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
