--------------------------------------------------------
--  DDL for Queue ORA$PREPLUGIN_BACKUP_QUE
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => '"SYS"."ORA$PREPLUGIN_BACKUP_QUE"',
     Queue_table         => '"SYS"."ORA$PREPLUGIN_BACKUP_QTB"',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  FALSE,
     comment             => 'SYS.ORA$PREPLUGIN_BACKUP_QUE');
  END;
/
