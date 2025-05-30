--------------------------------------------------------
--  DDL for Queue CQN_EVENT_TABLE_Q
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => '"SYS"."CQN_EVENT_TABLE_Q"',
     Queue_table         => '"SYS"."CQN_EVENT_TABLE"',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  FALSE,
     comment             => 'CREATING CQN_EVENT_TABLE_Q QUEUE');
  END;
/
