--------------------------------------------------------
--  DDL for View WAIT_STATS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."WAIT_STATS" () AS 
  SELECT * 
     FROM qpi_RBL_MISDB_PROD.wait_stats_ex 
    WHERE  category_id IS NOT NULL
;
