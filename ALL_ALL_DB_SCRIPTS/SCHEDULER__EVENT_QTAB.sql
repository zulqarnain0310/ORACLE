--------------------------------------------------------
--  DDL for Queue Table SCHEDULER$_EVENT_QTAB
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYS"."SCHEDULER$_EVENT_QTAB"',
     Queue_payload_type => '"SYS"."SCHEDULER$_EVENT_INFO"',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 8 NEXT 1 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1) TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Multiple_consumers =>  TRUE,
     Compatible         => '10.0.0',
     comment            => 'Scheduler event queue table');
  END;
/
