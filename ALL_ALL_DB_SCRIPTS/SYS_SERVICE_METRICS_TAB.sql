--------------------------------------------------------
--  DDL for Queue Table SYS$SERVICE_METRICS_TAB
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYS"."SYS$SERVICE_METRICS_TAB"',
     Queue_payload_type => '"SYS"."SYS$RLBTYP"',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 128 NEXT 1 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1) TABLESPACE SYSAUX',
     Sort_list          => 'ENQ_TIME',
     Multiple_consumers =>  TRUE,
     Compatible         => '10.0.0');
  END;
/
