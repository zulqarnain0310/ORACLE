--------------------------------------------------------
--  DDL for View DB_FILE_STATS_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."DB_FILE_STATS_HISTORY" () AS 
  SELECT S.snapshot_name ,
          S.start_time ,
          fs.* 
     FROM qpi_RBL_MISDB_PROD.file_stats_snapshots S
             /*TODO:SQLDEV*/ cross apply qpi.db_file_stats_at(s.snapshot_name) fs /*END:SQLDEV*/
;
