--------------------------------------------------------
--  DDL for Index I_SUMDELTA$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_SUMDELTA$" ON "SYS"."SUMDELTA$" ("TABLEOBJ#", "PARTITIONOBJ#", "TIMESTAMP", "LOWROWID", "HIGHROWID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "SYSTEM" ;
