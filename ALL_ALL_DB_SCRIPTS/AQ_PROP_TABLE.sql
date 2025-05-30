--------------------------------------------------------
--  DDL for Queue Table AQ_PROP_TABLE
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYS"."AQ_PROP_TABLE"',
     Queue_payload_type => '"SYS"."AQ$_NOTIFY_MSG"',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 8 NEXT 1 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1) TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Multiple_consumers =>  TRUE,
     Compatible         => '10.0.0',
     comment            => 'Queue Table for Notification in AQ Prop. Scheduling');
  END;
/
