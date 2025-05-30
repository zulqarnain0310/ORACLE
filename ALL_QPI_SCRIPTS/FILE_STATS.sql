--------------------------------------------------------
--  DDL for View FILE_STATS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."FILE_STATS" () AS 
  SELECT * 
     FROM fn_file_stats(NULL, NULL, NULL)
;
