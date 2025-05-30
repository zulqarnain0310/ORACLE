--------------------------------------------------------
--  DDL for Queue SCHEDULER$_REMDB_JOBQ
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => '"SYS"."SCHEDULER$_REMDB_JOBQ"',
     Queue_table         => '"SYS"."SCHEDULER$_REMDB_JOBQTAB"',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  FALSE,
     comment             => 'Scheduler remote db job queue');
  END;
/
