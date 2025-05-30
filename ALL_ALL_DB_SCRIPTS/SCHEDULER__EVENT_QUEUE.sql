--------------------------------------------------------
--  DDL for Queue SCHEDULER$_EVENT_QUEUE
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => '"SYS"."SCHEDULER$_EVENT_QUEUE"',
     Queue_table         => '"SYS"."SCHEDULER$_EVENT_QTAB"',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     Retention_time      =>  3600,
     dependency_tracking =>  FALSE,
     comment             => 'Scheduler event queue');
  END;
/

  GRANT DEQUEUE ON "SYS"."SCHEDULER$_EVENT_QUEUE" TO PUBLIC;
