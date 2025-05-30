--------------------------------------------------------
--  DDL for Index I_HCS_MEASLST_MEASURES_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_MEASLST_MEASURES_2" ON "SYS"."HCS_MEASLST_MEASURES$" ("AV#", "MEASLST#", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
