--------------------------------------------------------
--  DDL for Index I_WRI$_OPTSTAT_SYNOPPARTGRP
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_WRI$_OPTSTAT_SYNOPPARTGRP" ON "SYS"."WRI$_OPTSTAT_SYNOPSIS_PARTGRP" ("OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
