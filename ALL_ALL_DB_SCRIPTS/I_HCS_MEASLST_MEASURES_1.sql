--------------------------------------------------------
--  DDL for Index I_HCS_MEASLST_MEASURES_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_MEASLST_MEASURES_1" ON "SYS"."HCS_MEASLST_MEASURES$" ("AV#", "MEASLST#", "MEAS_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
