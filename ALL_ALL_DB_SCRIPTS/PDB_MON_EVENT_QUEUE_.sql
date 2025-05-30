--------------------------------------------------------
--  DDL for Queue PDB_MON_EVENT_QUEUE$
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => '"SYS"."PDB_MON_EVENT_QUEUE$"',
     Queue_table         => '"SYS"."PDB_MON_EVENT_QTABLE$"',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     Retention_time      =>  86400,
     dependency_tracking =>  FALSE,
     comment             => 'Queue for raw pdb event information');
  END;
/
