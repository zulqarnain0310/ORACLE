--------------------------------------------------------
--  DDL for Queue SRVQUEUE
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => '"SYS"."SRVQUEUE"',
     Queue_table         => '"SYS"."AQ$_MEM_MC"',
     Queue_type          =>  2,
     Max_retries         =>  0,
     Retry_delay         =>  0,
     dependency_tracking =>  FALSE);
  END;
/

  GRANT DEQUEUE ON "SYS"."SRVQUEUE" TO PUBLIC WITH GRANT OPTION;
