--------------------------------------------------------
--  DDL for Queue AQ_PROP_NOTIFY
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => '"SYS"."AQ_PROP_NOTIFY"',
     Queue_table         => '"SYS"."AQ_PROP_TABLE"',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  FALSE,
     comment             => 'Queue for Notifying events in AQ Prop. Scheduling');
  END;
/
