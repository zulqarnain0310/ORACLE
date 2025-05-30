--------------------------------------------------------
--  DDL for View WAIT_STATS_EX
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."WAIT_STATS_EX" ("CATEGORY", "WAIT_TYPE", "WAITING_TASKS_COUNT", "WAIT_TIME_S", "WAIT_PER_TASK_MS", "MAX_WAIT_TIME_MS", "SIGNAL_WAIT_TIME_S", "CATEGORY_ID", "INFO") AS 
  SELECT c.category category  ,
          wait_type wait_type  ,
          waiting_tasks_count ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(wait_time_ms / 1000., 1),12,1) wait_time_s  ,
          wait_time_ms / CASE 
                              WHEN waiting_tasks_count = 0 THEN NULL
          ELSE waiting_tasks_count
             END wait_per_task_ms  ,
          max_wait_time_ms ,
          signal_wait_time_ms / 1000 signal_wait_time_s  ,
          cid.category_id category_id  ,
          'www.sqlskills.com/help/waits/' || wait_type info  
     FROM sys.dm_os_wait_stats CROSS
;
