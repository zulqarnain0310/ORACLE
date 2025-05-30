--------------------------------------------------------
--  DDL for View DB_FILE_STATS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."DB_FILE_STATS" () AS 
  SELECT * 
     FROM fn_file_stats(/*TODO:SQLDEV*/ DB_ID() /*END:SQLDEV*/, NULL, NULL)
;
