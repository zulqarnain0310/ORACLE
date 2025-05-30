--------------------------------------------------------
--  DDL for Procedure SNAPSHOT_FILE_STATS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" 
(
  v_title IN NVARCHAR2 DEFAULT NULL ,
  v_db_name IN VARCHAR2 DEFAULT NULL ,
  v_file_name IN VARCHAR2 DEFAULT NULL 
)
AS

BEGIN

   MERGE  INTO qpi_RBL_MISDB_PROD.io_virtual_file_stats_snapshot TARGET
   USING ( SELECT SYS_CONTEXT('USERENV','') DB_NAME  ,
                  vfs.database_id ,
                  mf.name FILE_NAME  ,
                  8. * mf.SIZE_ / 1024 / 1024 size_gb  ,
                  vfs.file_id ,
                  io_stall_read_ms ,
                  io_stall_write_ms ,
                  io_stall_queued_read_ms ,
                  io_stall_queued_write_ms ,
                  io_stall ,
                  num_of_bytes_read ,
                  num_of_bytes_written ,
                  num_of_reads ,
                  num_of_writes 
           FROM dm_io_virtual_file_stats(/*TODO:SQLDEV*/ db_id(@db_name) /*END:SQLDEV*/, NULL) vfs
                  JOIN sys.master_files mf   ON vfs.database_id = mf.database_id
                  AND vfs.file_id = mf.file_id
                  AND ( v_file_name IS NULL
                  OR mf.name = v_file_name ) ) SOURCE     ON ( TARGET.FILE_ID = SOURCE.FILE_ID
     AND TARGET.database_id = SOURCE.database_id )
   WHEN MATCHED THEN   UPDATE SET  TARGET.size_gb = SOURCE.size_gb -- Target.[io_stall_read_ms],
                                   ,
                                   TARGET.io_stall_read_ms = SOURCE.io_stall_read_ms -- Target.[io_stall_read_ms],
                                   ,
                                   TARGET.io_stall_write_ms = SOURCE.io_stall_write_ms -- Target.[io_stall_write_ms],
                                   ,
                                   TARGET.io_stall_queued_read_ms = SOURCE.io_stall_queued_read_ms -- Target.[io_stall_read_ms],
                                   ,
                                   TARGET.io_stall_queued_write_ms = SOURCE.io_stall_queued_write_ms -- Target.[io_stall_write_ms],
                                   ,
                                   TARGET.io_stall = SOURCE.io_stall -- Target.[io_stall],
                                   ,
                                   TARGET.num_of_bytes_read = SOURCE.num_of_bytes_read -- Target.[num_of_bytes_read],
                                   ,
                                   TARGET.num_of_bytes_written = SOURCE.num_of_bytes_written -- Target.[num_of_bytes_written],
                                   ,
                                   TARGET.num_of_reads = SOURCE.num_of_reads -- Target.[num_of_reads],
                                   ,
                                   TARGET.num_of_writes = SOURCE.num_of_writes -- Target.[num_of_writes],
                                   ,
                                   TARGET.title = NVL(v_title, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,30,p_style=>20)),
                                   TARGET.interval_mi = DATEDIFF_BIG(MI, TARGET.start_time, SYS_EXTRACT_UTC(SYSTIMESTAMP))   
   WHEN NOT MATCHED THEN INSERT ( DB_NAME,database_id,FILE_NAME,size_gb,file_id,io_stall_read_ms,io_stall_write_ms,io_stall_queued_read_ms,io_stall_queued_write_ms,io_stall,num_of_bytes_read,num_of_bytes_written,num_of_reads,num_of_writes,title )
   VALUES ( SOURCE.DB_NAME,SOURCE.database_id,SOURCE.FILE_NAME,SOURCE.size_gb,SOURCE.file_id,SOURCE.io_stall_read_ms,SOURCE.io_stall_write_ms,SOURCE.io_stall_queued_read_ms,SOURCE.io_stall_queued_write_ms,SOURCE.io_stall,SOURCE.num_of_bytes_read,SOURCE.num_of_bytes_written,SOURCE.num_of_reads,SOURCE.num_of_writes,NVL(v_title, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,30,p_style=>20)))  
   ;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "MAIN_PRO";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "MAIN_PRO";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "RBL_STGDB";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "RBL_TEMPDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "QPI_RBL_MISDB_PROD"."SNAPSHOT_FILE_STATS" TO "ADF_CDR_RBL_STGDB";
