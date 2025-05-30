--------------------------------------------------------
--  DDL for Queue Table CQN_EVENT_TABLE
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYS"."CQN_EVENT_TABLE"',
     Queue_payload_type => '"SYS"."AQ$_EVENT_MESSAGE"',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 8 NEXT 1 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1) TABLESPACE SYSTEM LOB ("USER_DATA"."PBLOB") STORE AS BASICFILE ',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3',
     comment            => 'CREATING CQN_EVENT_TABLE QUEUE TABLE');
  END;
/
