--------------------------------------------------------
--  DDL for Index I_OPT_CALIBRATION_STATS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OPT_CALIBRATION_STATS$" ON "SYS"."OPT_CALIBRATION_STATS$" ("STATID#", "ORIGIN", "PROPERTIES") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
