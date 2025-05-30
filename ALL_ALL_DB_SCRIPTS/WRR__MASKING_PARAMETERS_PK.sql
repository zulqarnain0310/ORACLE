--------------------------------------------------------
--  DDL for Index WRR$_MASKING_PARAMETERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_MASKING_PARAMETERS_PK" ON "SYS"."WRR$_MASKING_PARAMETERS" ("SCRIPT_ID", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
