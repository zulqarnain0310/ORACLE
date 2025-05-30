--------------------------------------------------------
--  DDL for Index I_HCS_LVLGRP_LVLS_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_LVLGRP_LVLS_1" ON "SYS"."HCS_LVLGRP_LVLS$" ("AV#", "LVLGRP#", "DIM_ALIAS", "HIER_ALIAS", "LEVEL_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
