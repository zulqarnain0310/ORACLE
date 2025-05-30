--------------------------------------------------------
--  DDL for Index I_OLAP_MODELS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_MODELS$" ON "SYS"."OLAP_MODELS$" ("OWNING_OBJ_ID", "OWNING_OBJ_TYPE", "MODEL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
