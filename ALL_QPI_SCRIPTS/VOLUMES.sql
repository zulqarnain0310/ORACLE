--------------------------------------------------------
--  DDL for View VOLUMES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."VOLUMES" ("VOLUME_MOUNT_POINT", "USED_GB", "AVAILABLE_GB", "TOTAL_GB") AS 
  SELECT volume_mount_point ,
          UTILS.CONVERT_TO_NUMBER(MIN(total_bytes / 1024. / 1024 / 1024) ,10,1) used_gb  ,
          UTILS.CONVERT_TO_NUMBER(MIN(available_bytes / 1024. / 1024 / 1024) ,10,1) available_gb  ,
          UTILS.CONVERT_TO_NUMBER(MIN((total_bytes + available_bytes) / 1024. / 1024 / 1024) ,10,1) total_gb  
     FROM sys.master_files f
             /*TODO:SQLDEV*/ CROSS APPLY sys.dm_os_volume_stats(f.database_id, f.file_id) /*END:SQLDEV*/ 
     GROUP BY volume_mount_point
;
