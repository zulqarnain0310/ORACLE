--------------------------------------------------------
--  DDL for View WAIT_STATS_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."WAIT_STATS_HISTORY" () AS 
  SELECT * 
     FROM wait_stats_as_of(NULL)
;
