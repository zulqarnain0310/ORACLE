--------------------------------------------------------
--  DDL for Queue SCHEDULER_FILEWATCHER_Q
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => '"SYS"."SCHEDULER_FILEWATCHER_Q"',
     Queue_table         => '"SYS"."SCHEDULER_FILEWATCHER_QT"',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  FALSE,
     comment             => 'Scheduler file watcher results queue');
  END;
/

  GRANT DEQUEUE ON "SYS"."SCHEDULER_FILEWATCHER_Q" TO PUBLIC;
