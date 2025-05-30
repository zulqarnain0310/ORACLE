--------------------------------------------------------
--  DDL for Queue Table SCHEDULER_FILEWATCHER_QT
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYS"."SCHEDULER_FILEWATCHER_QT"',
     Queue_payload_type => '"SYS"."SCHEDULER_FILEWATCHER_RESULT"',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 8 NEXT 1 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1) TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Multiple_consumers =>  TRUE,
     Compatible         => '10.0.0',
     comment            => 'Scheduler file watcher result queue table');
  END;
/

  GRANT READ ON "SYS"."SCHEDULER_FILEWATCHER_QT" TO PUBLIC;
