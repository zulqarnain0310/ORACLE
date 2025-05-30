--------------------------------------------------------
--  DDL for Index I_DIR$REASON_STRINGS_UI
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_DIR$REASON_STRINGS_UI" ON "SYS"."DIR$REASON_STRINGS" ("REASON_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
