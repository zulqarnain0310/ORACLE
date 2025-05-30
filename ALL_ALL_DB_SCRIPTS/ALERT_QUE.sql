--------------------------------------------------------
--  DDL for Queue ALERT_QUE
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => '"SYS"."ALERT_QUE"',
     Queue_table         => '"SYS"."ALERT_QT"',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  FALSE,
     comment             => 'Server Generated Alert Queue');
  END;
/

  GRANT DEQUEUE ON "SYS"."ALERT_QUE" TO "OEM_MONITOR";
