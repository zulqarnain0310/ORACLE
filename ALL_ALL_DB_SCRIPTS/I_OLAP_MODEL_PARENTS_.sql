--------------------------------------------------------
--  DDL for Index I_OLAP_MODEL_PARENTS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_MODEL_PARENTS$" ON "SYS"."OLAP_MODEL_PARENTS$" ("MODEL_ID", "PARENT_MODEL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
