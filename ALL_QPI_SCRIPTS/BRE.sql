--------------------------------------------------------
--  DDL for View BRE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."BRE" ("COMMAND", "PERCENT_COMPLETE", "ETA", "ELAPSED_MI", "ETA_H", "QUERY", "SESSION_ID") AS 
  SELECT r.command ,
          UTILS.CONVERT_TO_NUMBER(r.percent_complete,6,2) percent_complete  ,
          UTILS.CONVERT_TO_VARCHAR2(utils.dateadd('MS', r.estimated_completion_time, SYSDATE),20,p_style=>20) ETA  ,
          UTILS.CONVERT_TO_NUMBER(r.total_elapsed_time / 1000.0 / 60.0,10,2) elapsed_mi  ,
          UTILS.CONVERT_TO_NUMBER(r.estimated_completion_time / 1000.0 / 60.0 / 60.0,10,2) eta_h  ,
          UTILS.CONVERT_TO_VARCHAR2(( SELECT SUBSTR(TEXT, r.statement_start_offset / 2, CASE 
                                                                                             WHEN r.statement_end_offset = -1 THEN 1000
                                                    ELSE (r.statement_end_offset - r.statement_start_offset) / 2
                                                       END) 
                                      FROM TABLE(dm_exec_sql_text(sql_handle))  ),1000) QUERY  ,
          r.session_id 
     FROM sys.dm_exec_requests r
    WHERE  command IN ( 'RESTORE DATABASE','BACKUP DATABASE','BACKUP LOG','RESTORE LOG' )
;
