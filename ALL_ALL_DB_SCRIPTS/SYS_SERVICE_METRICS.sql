--------------------------------------------------------
--  DDL for Queue SYS$SERVICE_METRICS
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => '"SYS"."SYS$SERVICE_METRICS"',
     Queue_table         => '"SYS"."SYS$SERVICE_METRICS_TAB"',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     Retention_time      =>  3600,
     dependency_tracking =>  FALSE);
  END;
/
