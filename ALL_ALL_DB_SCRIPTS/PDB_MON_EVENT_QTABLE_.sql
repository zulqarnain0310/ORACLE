--------------------------------------------------------
--  DDL for Queue Table PDB_MON_EVENT_QTABLE$
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYS"."PDB_MON_EVENT_QTABLE$"',
     Queue_payload_type => '"SYS"."PDB_MON_EVENT_TYPE$"',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 8 NEXT 1 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1) TABLESPACE SYSAUX LOB ("USER_DATA"."EVENT_INFO") STORE AS SECUREFILE ',
     Sort_list          => 'ENQ_TIME',
     Multiple_consumers =>  TRUE,
     Compatible         => '10.0.0',
     comment            => 'Raw queue table containing event information');
  END;
/
