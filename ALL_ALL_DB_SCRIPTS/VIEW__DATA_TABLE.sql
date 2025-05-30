REM INSERTING into SYS.VIEW$
SET DEFINE OFF;
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (4997,'--------------------------------------',6,6,0,0,1862,'select attr_u.name, ''N'', owner_u.name, obj_o.name,
       decode(cd.con#, 0, ''Y'', ''N''), con_o.name
  from sys.condata$ cd, sys."_BASE_USER" attr_u,
       sys."_CURRENT_EDITION_OBJ" obj_o, sys.int$container_obj$ con_o,
       sys."_BASE_USER" owner_u
  where cd.user# = attr_u.user#
    and cd.obj# != 0
    and cd.obj# = obj_o.obj#
    and obj_o.owner# = owner_u.user#
    and cd.con# = con_o.con_id (+)
    and (cd.con# = 0 or con_o.con_id is not NULL)
union all
select attr_u.name, ''N'', ''SYS'', obj_o.name,
       decode(cd.con#, 0, ''Y'', ''N''), con_o.name
  from sys.condata$ cd, sys."_BASE_USER" attr_u,
       sys.v$fixed_table obj_o, sys.int$container_obj$ con_o
  where cd.user# = attr_u.user#
    and cd.obj# != 0
    and cd.obj# = obj_o.object_id
    and cd.con# = con_o.con_id (+)
    and (cd.con# = 0 or con_o.con_id is not NULL)
union all
select attr_u.name, ''Y'', NULL, NULL,
       decode(cd.con#, 0, ''Y'', ''N''), con_o.name
  from sys.condata$ cd, sys."_BASE_USER" attr_u,
       sys.int$container_obj$ con_o
  where cd.user# = attr_u.user#
    and cd.obj# = 0
    and cd.con# = con_o.con_id (+)
    and (cd.con# = 0 or con_o.con_id is not NULL)
union all
  select ''SYS'', ''Y'', NULL, NULL, ''Y'', NULL from dual
    where sys_context(''userenv'', ''con_id'') = 1
       or sys_context(''userenv'', ''is_application_root'') = ''YES''
union all
  select ''SYSBACKUP'', ''Y'', NULL, NULL, ''Y'', NULL from dual
    where sys_context(''userenv'', ''con_id'') = 1
       or sys_context(''userenv'', ''is_application_root'') = ''YES''
union all
  select ''SYSDG'', ''Y'', NULL, NULL, ''Y'', NULL from dual
    where sys_context(''userenv'', ''con_id'') = 1
       or sys_context(''userenv'', ''is_application_root'') = ''YES''
union all
  select ''SYSRAC'', ''Y'', NULL, NULL, ''Y'', NULL from dual
    where sys_context(''userenv'', ''con_id'') = 1
       or sys_context(''userenv'', ''is_application_root'') = ''YES''');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19662,'--------------------------------------',24,24,0,0,330,'SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 19643');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19663,'--------------------------------------',31,31,147458,0,5634,'SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,''UNDELIVERABLE'',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   ''READY'',	     
                              		                                          1,   ''WAIT'',	     
                                                                                  2,   ''PROCESSED'',	     
                                                                                  3,   ''EXPIRED'',
                                                                                  8,   ''DEFERRED'',
                                                                                 10,  ''BUFFERED_EXPIRED''),(decode(l.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED''))), (decode(h.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED'')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         ''Messages to be cleaned up later'',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   ''MAX_RETRY_EXCEEDED'',
                                                   ''TIME_EXPIRATION''),
                                                   ''INVALID_TRANSACTION'', NULL,
                                                   ''MAX_RETRY_EXCEEDED''), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 ''PROPAGATION_FAILURE'', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, ''0'', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "SCHEDULER$_EVENT_QTAB" qt, "AQ$_SCHEDULER$_EVENT_QTAB_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 19643 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "SYS"."AQ$_SCHEDULER$_EVENT_QTAB_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_SCHEDULER$_EVENT_QTAB_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19664,'--------------------------------------',36,36,147458,0,1708,'SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, ''PERSISTENT'' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "SCHEDULER$_EVENT_QTAB" qt, "AQ$_SCHEDULER$_EVENT_QTAB_I" iot, SYS.USER_AQ_AGENT_PRIVS up, SYS.ALL_INT_DEQUEUE_QUEUES qo  WHERE qt.msgid=iot.msgid  and (iot.name = up.agent_name or  iot.subscriber# = (select s.subscriber_id from "AQ$_SCHEDULER$_EVENT_QTAB_S" s  where s.name = up.agent_name and  bitand(s.subscriber_type, 9) = 1)) and qt.q_name = qo.name  AND qo.owner = ''SYS'' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19696,'--------------------------------------',24,24,0,0,330,'SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 19670');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19697,'--------------------------------------',31,31,147458,0,5646,'SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,''UNDELIVERABLE'',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   ''READY'',	     
                              		                                          1,   ''WAIT'',	     
                                                                                  2,   ''PROCESSED'',	     
                                                                                  3,   ''EXPIRED'',
                                                                                  8,   ''DEFERRED'',
                                                                                 10,  ''BUFFERED_EXPIRED''),(decode(l.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED''))), (decode(h.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED'')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         ''Messages to be cleaned up later'',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   ''MAX_RETRY_EXCEEDED'',
                                                   ''TIME_EXPIRATION''),
                                                   ''INVALID_TRANSACTION'', NULL,
                                                   ''MAX_RETRY_EXCEEDED''), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 ''PROPAGATION_FAILURE'', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, ''0'', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "SCHEDULER$_REMDB_JOBQTAB" qt, "AQ$_SCHEDULER$_REMDB_JOBQTAB_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 19670 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "SYS"."AQ$_SCHEDULER$_REMDB_JOBQTAB_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_SCHEDULER$_REMDB_JOBQTAB_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19698,'--------------------------------------',36,36,147458,0,1502,'SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, ''PERSISTENT'' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "SCHEDULER$_REMDB_JOBQTAB" qt, "AQ$_SCHEDULER$_REMDB_JOBQTAB_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = ''SYS'' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19726,'--------------------------------------',24,24,0,0,330,'SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 19704');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19727,'--------------------------------------',31,31,147458,0,5646,'SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,''UNDELIVERABLE'',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   ''READY'',	     
                              		                                          1,   ''WAIT'',	     
                                                                                  2,   ''PROCESSED'',	     
                                                                                  3,   ''EXPIRED'',
                                                                                  8,   ''DEFERRED'',
                                                                                 10,  ''BUFFERED_EXPIRED''),(decode(l.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED''))), (decode(h.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED'')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         ''Messages to be cleaned up later'',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   ''MAX_RETRY_EXCEEDED'',
                                                   ''TIME_EXPIRATION''),
                                                   ''INVALID_TRANSACTION'', NULL,
                                                   ''MAX_RETRY_EXCEEDED''), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 ''PROPAGATION_FAILURE'', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, ''0'', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "SCHEDULER_FILEWATCHER_QT" qt, "AQ$_SCHEDULER_FILEWATCHER_QT_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 19704 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "SYS"."AQ$_SCHEDULER_FILEWATCHER_QT_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_SCHEDULER_FILEWATCHER_QT_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19728,'--------------------------------------',36,36,147458,0,1717,'SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, ''PERSISTENT'' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "SCHEDULER_FILEWATCHER_QT" qt, "AQ$_SCHEDULER_FILEWATCHER_QT_I" iot, SYS.USER_AQ_AGENT_PRIVS up, SYS.ALL_INT_DEQUEUE_QUEUES qo  WHERE qt.msgid=iot.msgid  and (iot.name = up.agent_name or  iot.subscriber# = (select s.subscriber_id from "AQ$_SCHEDULER_FILEWATCHER_QT_S" s  where s.name = up.agent_name and  bitand(s.subscriber_type, 9) = 1)) and qt.q_name = qo.name  AND qo.owner = ''SYS'' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19781,'--------------------------------------',24,24,0,0,330,'SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 19762');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19782,'--------------------------------------',31,31,147458,0,5582,'SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,''UNDELIVERABLE'',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   ''READY'',	     
                              		                                          1,   ''WAIT'',	     
                                                                                  2,   ''PROCESSED'',	     
                                                                                  3,   ''EXPIRED'',
                                                                                  8,   ''DEFERRED'',
                                                                                 10,  ''BUFFERED_EXPIRED''),(decode(l.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED''))), (decode(h.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED'')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         ''Messages to be cleaned up later'',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   ''MAX_RETRY_EXCEEDED'',
                                                   ''TIME_EXPIRATION''),
                                                   ''INVALID_TRANSACTION'', NULL,
                                                   ''MAX_RETRY_EXCEEDED''), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 ''PROPAGATION_FAILURE'', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, ''0'', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "ALERT_QT" qt, "AQ$_ALERT_QT_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 19762 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "SYS"."AQ$_ALERT_QT_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_ALERT_QT_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (19783,'--------------------------------------',36,36,147458,0,1669,'SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, ''PERSISTENT'' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "ALERT_QT" qt, "AQ$_ALERT_QT_I" iot, SYS.USER_AQ_AGENT_PRIVS up, SYS.ALL_INT_DEQUEUE_QUEUES qo  WHERE qt.msgid=iot.msgid  and (iot.name = up.agent_name or  iot.subscriber# = (select s.subscriber_id from "AQ$_ALERT_QT_S" s  where s.name = up.agent_name and  bitand(s.subscriber_type, 9) = 1)) and qt.q_name = qo.name  AND qo.owner = ''SYS'' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20082,'--------------------------------------',24,24,0,0,330,'SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 20063');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20083,'--------------------------------------',31,31,147458,0,5646,'SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,''UNDELIVERABLE'',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   ''READY'',	     
                              		                                          1,   ''WAIT'',	     
                                                                                  2,   ''PROCESSED'',	     
                                                                                  3,   ''EXPIRED'',
                                                                                  8,   ''DEFERRED'',
                                                                                 10,  ''BUFFERED_EXPIRED''),(decode(l.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED''))), (decode(h.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED'')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         ''Messages to be cleaned up later'',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   ''MAX_RETRY_EXCEEDED'',
                                                   ''TIME_EXPIRATION''),
                                                   ''INVALID_TRANSACTION'', NULL,
                                                   ''MAX_RETRY_EXCEEDED''), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 ''PROPAGATION_FAILURE'', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, ''0'', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "ORA$PREPLUGIN_BACKUP_QTB" qt, "AQ$_ORA$PREPLUGIN_BACKUP_QTB_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 20063 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "SYS"."AQ$_ORA$PREPLUGIN_BACKUP_QTB_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_ORA$PREPLUGIN_BACKUP_QTB_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20084,'--------------------------------------',36,36,147458,0,1502,'SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, ''PERSISTENT'' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "ORA$PREPLUGIN_BACKUP_QTB" qt, "AQ$_ORA$PREPLUGIN_BACKUP_QTB_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = ''SYS'' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20301,'--------------------------------------',24,24,0,0,330,'SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 20280');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20302,'--------------------------------------',31,31,411648,0,5590,'SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,''UNDELIVERABLE'',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   ''READY'',	     
                              		                                          1,   ''WAIT'',	     
                                                                                  2,   ''PROCESSED'',	     
                                                                                  3,   ''EXPIRED'',
                                                                                  8,   ''DEFERRED'',
                                                                                 10,  ''BUFFERED_EXPIRED''),(decode(l.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED''))), (decode(h.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED'')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         ''Messages to be cleaned up later'',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   ''MAX_RETRY_EXCEEDED'',
                                                   ''TIME_EXPIRATION''),
                                                   ''INVALID_TRANSACTION'', NULL,
                                                   ''MAX_RETRY_EXCEEDED''), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 ''PROPAGATION_FAILURE'', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, ''0'', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "AQ$_MEM_MC" qt, "AQ$_AQ$_MEM_MC_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 20280 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "SYS"."AQ$_AQ$_MEM_MC_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_AQ$_MEM_MC_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20303,'--------------------------------------',36,36,411650,0,1474,'SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, ''PERSISTENT'' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "AQ$_MEM_MC" qt, "AQ$_AQ$_MEM_MC_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = ''SYS'' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20314,'--------------------------------------',23,23,147458,0,2365,'SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   ''READY'',
                                1,   ''WAIT'',
                                2,   ''PROCESSED'',
                                3,   ''EXPIRED'',
                                10,  ''BUFFERED_EXPIRED'') MSG_STATE, cast(FROM_TZ(delay, ''00:00'')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, ''00:00'')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, ''00:00'')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, ''00:00'')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, ''00:00'')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, ''00:00'')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, ''INVALID_TRANSACTION'', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, ''INVALID_TRANSACTION'', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , ''MAX_RETRY_EXCEEDED'',
                            ''TIME_EXPIRATION''),
                              ''INVALID_TRANSACTION'', NULL,
                              ''MAX_RETRY_EXCEEDED''), NULL), NULL) 
                             EXPIRATION_REASON  FROM "AQ_EVENT_TABLE" WHERE state != 7 AND   state != 9 WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20315,'--------------------------------------',25,25,147458,0,988,'SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "AQ_EVENT_TABLE" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = ''SYS'' WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20337,'--------------------------------------',24,24,0,0,330,'SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 20318');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20338,'--------------------------------------',31,31,147458,0,5602,'SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,''UNDELIVERABLE'',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   ''READY'',	     
                              		                                          1,   ''WAIT'',	     
                                                                                  2,   ''PROCESSED'',	     
                                                                                  3,   ''EXPIRED'',
                                                                                  8,   ''DEFERRED'',
                                                                                 10,  ''BUFFERED_EXPIRED''),(decode(l.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED''))), (decode(h.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED'')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         ''Messages to be cleaned up later'',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   ''MAX_RETRY_EXCEEDED'',
                                                   ''TIME_EXPIRATION''),
                                                   ''INVALID_TRANSACTION'', NULL,
                                                   ''MAX_RETRY_EXCEEDED''), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 ''PROPAGATION_FAILURE'', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, ''0'', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "AQ_PROP_TABLE" qt, "AQ$_AQ_PROP_TABLE_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 20318 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "SYS"."AQ$_AQ_PROP_TABLE_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_AQ_PROP_TABLE_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20339,'--------------------------------------',36,36,147458,0,1480,'SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, ''PERSISTENT'' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "AQ_PROP_TABLE" qt, "AQ$_AQ_PROP_TABLE_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = ''SYS'' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20359,'--------------------------------------',23,23,147458,0,2366,'SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   ''READY'',
                                1,   ''WAIT'',
                                2,   ''PROCESSED'',
                                3,   ''EXPIRED'',
                                10,  ''BUFFERED_EXPIRED'') MSG_STATE, cast(FROM_TZ(delay, ''00:00'')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, ''00:00'')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, ''00:00'')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, ''00:00'')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, ''00:00'')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, ''00:00'')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, ''INVALID_TRANSACTION'', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, ''INVALID_TRANSACTION'', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , ''MAX_RETRY_EXCEEDED'',
                            ''TIME_EXPIRATION''),
                              ''INVALID_TRANSACTION'', NULL,
                              ''MAX_RETRY_EXCEEDED''), NULL), NULL) 
                             EXPIRATION_REASON  FROM "CQN_EVENT_TABLE" WHERE state != 7 AND   state != 9 WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20360,'--------------------------------------',25,25,147458,0,989,'SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "CQN_EVENT_TABLE" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = ''SYS'' WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20496,'--------------------------------------',24,24,0,0,330,'SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 20477');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20497,'--------------------------------------',31,31,147458,0,5642,'SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,''UNDELIVERABLE'',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   ''READY'',	     
                              		                                          1,   ''WAIT'',	     
                                                                                  2,   ''PROCESSED'',	     
                                                                                  3,   ''EXPIRED'',
                                                                                  8,   ''DEFERRED'',
                                                                                 10,  ''BUFFERED_EXPIRED''),(decode(l.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED''))), (decode(h.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED'')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         ''Messages to be cleaned up later'',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   ''MAX_RETRY_EXCEEDED'',
                                                   ''TIME_EXPIRATION''),
                                                   ''INVALID_TRANSACTION'', NULL,
                                                   ''MAX_RETRY_EXCEEDED''), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 ''PROPAGATION_FAILURE'', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, ''0'', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "SYS$SERVICE_METRICS_TAB" qt, "AQ$_SYS$SERVICE_METRICS_TAB_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 20477 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "SYS"."AQ$_SYS$SERVICE_METRICS_TAB_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_SYS$SERVICE_METRICS_TAB_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20498,'--------------------------------------',36,36,147458,0,1500,'SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, ''PERSISTENT'' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "SYS$SERVICE_METRICS_TAB" qt, "AQ$_SYS$SERVICE_METRICS_TAB_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = ''SYS'' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20661,'--------------------------------------',24,24,0,0,330,'SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 20640');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20662,'--------------------------------------',31,31,147458,0,5634,'SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,''UNDELIVERABLE'',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   ''READY'',	     
                              		                                          1,   ''WAIT'',	     
                                                                                  2,   ''PROCESSED'',	     
                                                                                  3,   ''EXPIRED'',
                                                                                  8,   ''DEFERRED'',
                                                                                 10,  ''BUFFERED_EXPIRED''),(decode(l.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED''))), (decode(h.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED'')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         ''Messages to be cleaned up later'',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   ''MAX_RETRY_EXCEEDED'',
                                                   ''TIME_EXPIRATION''),
                                                   ''INVALID_TRANSACTION'', NULL,
                                                   ''MAX_RETRY_EXCEEDED''), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 ''PROPAGATION_FAILURE'', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, ''0'', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "PDB_MON_EVENT_QTABLE$" qt, "AQ$_PDB_MON_EVENT_QTABLE$_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 20640 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "SYS"."AQ$_PDB_MON_EVENT_QTABLE$_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_PDB_MON_EVENT_QTABLE$_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20663,'--------------------------------------',36,36,147458,0,1496,'SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, ''PERSISTENT'' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "PDB_MON_EVENT_QTABLE$" qt, "AQ$_PDB_MON_EVENT_QTABLE$_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = ''SYS'' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20803,'--------------------------------------',24,24,0,0,330,'SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 20784');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20804,'--------------------------------------',31,31,147458,0,5652,'SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,''UNDELIVERABLE'',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   ''READY'',	     
                              		                                          1,   ''WAIT'',	     
                                                                                  2,   ''PROCESSED'',	     
                                                                                  3,   ''EXPIRED'',
                                                                                  8,   ''DEFERRED'',
                                                                                 10,  ''BUFFERED_EXPIRED''),(decode(l.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED''))), (decode(h.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED'')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         ''Messages to be cleaned up later'',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   ''MAX_RETRY_EXCEEDED'',
                                                   ''TIME_EXPIRATION''),
                                                   ''INVALID_TRANSACTION'', NULL,
                                                   ''MAX_RETRY_EXCEEDED''), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 ''PROPAGATION_FAILURE'', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, ''0'', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "CHANGE_LOG_QUEUE_TABLE" qt, "AQ$_CHANGE_LOG_QUEUE_TABLE_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 20784 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "GSMADMIN_INTERNAL"."AQ$_CHANGE_LOG_QUEUE_TABLE_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_CHANGE_LOG_QUEUE_TABLE_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (20805,'--------------------------------------',36,36,147458,0,1512,'SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, ''PERSISTENT'' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "CHANGE_LOG_QUEUE_TABLE" qt, "AQ$_CHANGE_LOG_QUEUE_TABLE_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = ''GSMADMIN_INTERNAL'' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (22539,'--------------------------------------',24,24,0,0,330,'SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 22515');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (22540,'--------------------------------------',31,31,147458,0,5632,'SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,''UNDELIVERABLE'',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   ''READY'',	     
                              		                                          1,   ''WAIT'',	     
                                                                                  2,   ''PROCESSED'',	     
                                                                                  3,   ''EXPIRED'',
                                                                                  8,   ''DEFERRED'',
                                                                                 10,  ''BUFFERED_EXPIRED''),(decode(l.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED''))), (decode(h.transaction_id, NULL, ''UNDELIVERABLE'', ''PROCESSED'')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, ''00:00'')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, ''00:00'')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, ''00:00'')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         ''Messages to be cleaned up later'',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   ''MAX_RETRY_EXCEEDED'',
                                                   ''TIME_EXPIRATION''),
                                                   ''INVALID_TRANSACTION'', NULL,
                                                   ''MAX_RETRY_EXCEEDED''), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 ''PROPAGATION_FAILURE'', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, ''0'', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "WM$EVENT_QUEUE_TABLE" qt, "AQ$_WM$EVENT_QUEUE_TABLE_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 22515 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "WMSYS"."AQ$_WM$EVENT_QUEUE_TABLE_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_WM$EVENT_QUEUE_TABLE_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (22541,'--------------------------------------',36,36,147458,0,1496,'SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, ''00:00'') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, ''00:00'') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, ''00:00'') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, ''00:00'') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, ''PERSISTENT'' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "WM$EVENT_QUEUE_TABLE" qt, "AQ$_WM$EVENT_QUEUE_TABLE_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = ''WMSYS'' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (72886,'--------------------------------------',16,16,16384,0,538,'SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73030,'--------------------------------------',15,15,0,0,928,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_tables.id
  AND md_tables.schema_id_fk            = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73031,'--------------------------------------',10,10,16384,0,601,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_projects
  WHERE md_schemas.catalog_id_fk   = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73032,'--------------------------------------',13,13,16384,0,767,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_projects
  WHERE md_tables.schema_id_fk     = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73033,'--------------------------------------',9,9,16384,0,506,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name
  FROM md_projects ,
    md_connections,
    md_catalogs
  WHERE md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk   = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73034,'--------------------------------------',8,8,16384,0,396,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    MD_CONNECTIONS.ID CONNECTION_ID ,
    MD_CONNECTIONS.NAME CONNECTION_NAME,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl
  FROM md_projects,
    md_connections
  WHERE MD_CONNECTIONS.PROJECT_ID_FK = MD_PROJECTS.ID
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73035,'--------------------------------------',15,15,0,0,921,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_views.id
  AND md_views.schema_id_fk             = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73036,'--------------------------------------',14,14,0,0,881,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name ,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_stored_programs.id stored_program_id ,
    md_stored_programs.programtype programtype ,
    md_stored_programs.name stored_program_name,
    md_stored_programs.package_id_fk package_id_fk
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_stored_programs
  WHERE md_stored_programs.schema_id_fk = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73037,'--------------------------------------',13,13,16384,0,753,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views
  WHERE md_views.schema_id_fk      = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73052,'--------------------------------------',16,16,0,0,562,'SELECT ''MD_CATALOGS'' objtype, cat.catalog_name objname, cat.id objid,  ''MD_CATALOGS'' MainObjType,cat.catalog_name MAINOBJNAME, cat.id MAINOBJID,null SchemaName,null schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name ELSE NULL END QualifiedName
FROM  MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE  cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73053,'--------------------------------------',16,16,0,0,594,'SELECT ''MD_SCHEMAS'' objtype, s.name objname, s.id objid,  ''MD_SCHEMAS'' MainObjType,s.name MAINOBJNAME, s.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name QualifiedName
FROM MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73054,'--------------------------------------',16,16,0,0,729,'SELECT ''MD_TABLES'' objtype, t.table_name objname, t.id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN   md_meta.quote(cat.catalog_name,s.name,t.table_name,conn.id)
                            ELSE   s.name || ''.'' || t.table_name END QualifiedName
FROM MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73055,'--------------------------------------',16,16,0,0,779,'SELECT ''MD_PARTITIONS'' objtype, ''PARTTITION_EXP'' objname, t.id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN   md_meta.quote(cat.catalog_name,s.name,t.table_name,conn.id)
                            ELSE   s.name || ''.'' || t.table_name END QualifiedName
FROM MD_PARTITIONS p, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE p.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73056,'--------------------------------------',16,16,0,0,669,'SELECT ''MD_STORED_PROGRAMS'' objtype,p.name objname, p.Id objid,  ''MD_STORED_PROGRAMS'' MainObjType,p.name MAINOBJNAME,p.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||p.name  QualifiedName
FROM MD_STORED_PROGRAMS p,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE p.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73057,'--------------------------------------',16,16,0,0,655,'SELECT ''MD_VIEWS'' objtype, v.view_name objname, v.Id objid,  ''MD_VIEWS'' MainObjType,v.view_name MAINOBJNAME,v.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||v.view_name  QualifiedName
FROM MD_VIEWS v,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE v.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73058,'--------------------------------------',16,16,0,0,723,'SELECT ''MD_COLUMNS'' objtype, c.COLUMN_NAME objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.COLUMN_NAME QualifiedName
FROM MD_COLUMNS c, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73059,'--------------------------------------',16,16,0,0,717,'SELECT ''MD_CONSTRAINTS'' objtype, c.name objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.name QualifiedName
FROM MD_CONSTRAINTS c, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73060,'--------------------------------------',16,16,0,0,700,'SELECT ''MD_INDEXES'' objtype,i.index_name objname, i.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME,t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid, proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||i.index_name  QualifiedName
FROM MD_INDEXES i, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn,MD_PROJECTS proj
WHERE i.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73061,'--------------------------------------',16,16,0,0,1483,'SELECT ''MD_TRIGGERS'' objtype,trig.trigger_name objname, trig.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME,t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||trig.trigger_name  QualifiedName
FROM MD_TRIGGERS trig, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE trig.table_or_view_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id 
UNION ALL
SELECT ''MD_TRIGGERS'' objtype,trig.trigger_name objname, trig.Id objid,  ''MD_VIEWS'' MainObjType,v.view_name MAINOBJNAME,v.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||trig.trigger_name  QualifiedName
FROM MD_TRIGGERS trig, MD_VIEWS v,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE trig.table_or_view_id_fk = v.id
AND v.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id 
ORDER BY objid');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73062,'--------------------------------------',16,16,0,0,2469,'SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CATALOG_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_SCHEMA_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TABLES_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_COLUMN_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CONSTRAINTS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_INDEX_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TRIGGER_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_VIEW_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PROGRAMS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PARTITIONS_DETAILS');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73063,'--------------------------------------',18,18,264192,0,1143,'SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME", p.native_sql,p.linecount 
FROM md_stored_programs p , mgv_all_programs_details d
WHERE p.id = d.objid
AND d.capturedorconverted = ''CAPTURED''
UNION ALL
SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME",v.native_sql,v.linecount
FROM md_views v , mgv_all_view_details d
WHERE v.id = d.objid
AND d.capturedorconverted = ''CAPTURED''
UNION ALL
SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME" ,t.native_sql,t.linecount
FROM md_triggers t , mgv_all_trigger_details d
WHERE t.id = d.objid
AND d.capturedorconverted = ''CAPTURED''');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73064,'--------------------------------------',18,18,0,0,879,'SELECT ''MD_COLUMNS'' objtype, c.COLUMN_NAME objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname ,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.COLUMN_NAME QualifiedName,
c.column_type datatype,
CASE WHEN p.PROP_KEY=''SEEDVALUE'' THEN ''Y'' ELSE ''N'' END IsIdentity
FROM MD_COLUMNS c LEFT OUTER JOIN MD_ADDITIONAL_PROPERTIES p ON c.id =p.ref_id_fk
, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn,MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73065,'--------------------------------------',32,32,0,0,1252,'select d1.catalogid capcatalogid,
   d1.catalogname capcatalogname,
   d1.connid capconnid,
   d1.connname capconnname,
   d1.mainobjid capmainobjid,
   d1.mainobjname capmainobjname,
   d1.mainobjtype capmainobjtype ,
   d1.objid capobjid,
   d1.objname capobjname,
   d1.objtype capobjtype,
   d1.projectid capprojectid,
   d1.projectname capprojectname,
   d1.qualifiedname capqualifiedname,
   d1.schemaid capschemaid,
   d1.schemaname capschemaname,
   d2.catalogid concatalogid,
   d2.catalogname concatalogname,
   d2.connid conconnid,
   d2.connname conconnname,
   d2.mainobjid conmainobjid,
   d2.mainobjname conmainobjname,
   d2.mainobjtype conmainobjtype ,
   d2.objid conobjid,
   d2.objname conobjname,
   d2.objtype conobjtype,
   d2.projectid conprojectid,
   d2.projectname conprojectname,
   d2.qualifiedname conqualifiedname,
   d2.schemaid conschemaid,
   d2.schemaname conschemaname,
    der.derivative_reason,
    der.transformed
  FROM mgv_all_details d1
  LEFT OUTER JOIN md_derivatives der
  ON der.src_id              = d1.objid
  AND der.derivative_reason IS NULL
  LEFT OUTER JOIN mgv_all_details d2
  ON der.derived_id            = d2.objid
  WHERE d1.capturedorconverted = ''CAPTURED''
  AND der.derivative_reason   IS NULL');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73066,'--------------------------------------',17,17,0,0,366,'SELECT "ID","SRC_ID","SRC_TYPE","DERIVED_ID","DERIVED_TYPE","DERIVED_CONNECTION_ID_FK","TRANSFORMED","ORIGINAL_IDENTIFIER","NEW_IDENTIFIER","DERIVED_OBJECT_NAMESPACE","DERIVATIVE_REASON","SECURITY_GROUP_ID","CREATED_ON","CREATED_BY","LAST_UPDATED_ON","LAST_UPDATED_BY","ENABLED" FROM MD_DERIVATIVES WHERE (Derivative_Reason <> ''SCRATCH'' OR DERIVative_Reason IS NULL)');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (73067,'--------------------------------------',17,17,0,0,334,'SELECT "ID","SRC_ID","SRC_TYPE","DERIVED_ID","DERIVED_TYPE","DERIVED_CONNECTION_ID_FK","TRANSFORMED","ORIGINAL_IDENTIFIER","NEW_IDENTIFIER","DERIVED_OBJECT_NAMESPACE","DERIVATIVE_REASON","SECURITY_GROUP_ID","CREATED_ON","CREATED_BY","LAST_UPDATED_ON","LAST_UPDATED_BY","ENABLED" FROM MD_DERIVATIVES WHERE Derivative_Reason = ''SCRATCH''');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79092,'--------------------------------------',7,7,0,0,397,'SELECT Q.TEXT ,
          Q.params ,
          Q.query_text_id ,
          query_id ,
          Q.context_settings_id ,
          Q.query_hash ,
          o.* 
     FROM qpi_RBL_MISDB_PROD.db_queries Q
            JOIN sys.query_context_settings ctx   ON Q.context_settings_id = ctx.context_settings_id
             /*TODO:SQLDEV*/ CROSS APPLY qpi.decode_options(ctx.set_options) o /*END:SQLDEV*/ ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79093,'--------------------------------------',12,12,0,0,422,'SELECT Q.TEXT ,
          Q.params ,
          Q.query_text_id ,
          p.plan_id ,
          p.query_id ,
          p.compatibility_level ,
          p.query_plan_hash ,
          p.count_compiles ,
          p.is_parallel_plan ,
          p.is_forced_plan ,
          p.query_plan ,
          Q.query_hash 
     FROM sys.query_store_plan p
            JOIN qpi_RBL_MISDB_PROD.db_queries Q   ON p.query_id = Q.query_id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79094,'--------------------------------------',5,5,0,0,216,'SELECT Q.TEXT ,
          Q.params ,
          Q.query_text_id ,
          p.* ,
          Q.query_hash 
     FROM sys.query_store_plan p
            JOIN qpi_RBL_MISDB_PROD.db_queries Q   ON p.query_id = Q.query_id ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79095,'--------------------------------------',0,0,0,0,84,'SELECT * 
     FROM TABLE(db_query_wait_stats_as_of(SYS_EXTRACT_UTC(SYSTIMESTAMP))) ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79096,'--------------------------------------',0,0,0,0,84,'SELECT * 
     FROM TABLE(db_query_exec_stats_as_of(SYS_EXTRACT_UTC(SYSTIMESTAMP))) ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79097,'--------------------------------------',15,15,0,0,958,'WITH ws AS ( SELECT query_id ,
                       start_time ,
                       execution_type_desc ,
                       SUM(wait_time_ms)  wait_time_ms  
     FROM qpi_RBL_MISDB_PROD.db_query_wait_stats 
     GROUP BY query_id,start_time,execution_type_desc ) 
      SELECT TEXT ,
             params ,
             qes.execution_type_desc ,
             qes.query_id ,
             count_executions ,
             duration_s ,
             cpu_time_ms ,
             wait_time_ms ,
             log_bytes_used_kb ,
             logical_io_reads_kb ,
             logical_io_writes_kb ,
             physical_io_reads_kb ,
             clr_time_ms ,
             qes.start_time ,
             qes.query_hash 
        FROM qpi_RBL_MISDB_PROD.db_query_exec_stats qes
               LEFT JOIN ws    ON qes.query_id = ws.query_id
               AND qes.start_time = ws.start_time
               AND qes.execution_type_desc = ws.execution_type_desc');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79098,'--------------------------------------',0,0,0,0,52,'SELECT * 
     FROM db_query_wait_stats_as_of(NULL) ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79099,'--------------------------------------',0,0,0,0,52,'SELECT * 
     FROM db_query_exec_stats_as_of(NULL) ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79100,'--------------------------------------',15,15,0,0,974,'WITH ws AS ( SELECT query_id ,
                       start_time ,
                       execution_type_desc ,
                       SUM(wait_time_ms)  wait_time_ms  
     FROM qpi_RBL_MISDB_PROD.db_query_wait_stats_history 
     GROUP BY query_id,start_time,execution_type_desc ) 
      SELECT TEXT ,
             params ,
             qes.execution_type_desc ,
             qes.query_id ,
             count_executions ,
             duration_s ,
             cpu_time_ms ,
             wait_time_ms ,
             log_bytes_used_kb ,
             logical_io_reads_kb ,
             logical_io_writes_kb ,
             physical_io_reads_kb ,
             clr_time_ms ,
             qes.start_time ,
             qes.query_hash 
        FROM qpi_RBL_MISDB_PROD.db_query_exec_stats_history qes
               LEFT JOIN ws    ON qes.query_id = ws.query_id
               AND qes.start_time = ws.start_time
               AND qes.execution_type_desc = ws.execution_type_desc');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79101,'--------------------------------------',16,16,0,0,1249,'SELECT Q.TEXT ,
          Q.params ,
          Q.query_id ,
          Q.session_id ,
          Q.request_id ,
          Q.memory_mb ,
          Q.start_time ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_elapsed_time / execution_count / 1000.0 / 1000.0, 2),12,2) duration_s  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_worker_time / execution_count, 1),12,1) cpu_time_ms  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_logical_reads / execution_count * 8 / 1000.0, 2),12,2) logical_io_reads_kb  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_logical_writes / execution_count * 8 / 1000.0, 2),12,2) logical_io_writes_kb  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_physical_reads / execution_count * 8 / 1000.0, 2),12,2) physical_io_reads_kb  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_clr_time / execution_count / 1000.0, 1),12,1) clr_time_ms  ,
          rs.total_grant_kb / execution_count / 1024 granted_mb  ,
          rs.total_used_grant_kb / execution_count / 1024 used_mb  ,
          rs.total_ideal_grant_kb / execution_count / 1024 ideal_mb  
     FROM qpi_RBL_MISDB_PROD.queries Q
            LEFT JOIN sys.dm_exec_query_stats rs   ON Q.sql_handle = rs.sql_handle');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79102,'--------------------------------------',16,16,0,0,741,'SELECT Q.TEXT ,
          Q.params ,
          Q.query_id ,
          Q.session_id ,
          Q.request_id ,
          Q.memory_mb ,
          Q.start_time ,
          mg.required_memory_kb / 1024 required_mb  ,
          mg.requested_memory_kb / 1024 requested_mb  ,
          mg.granted_memory_kb / 1024 granted_mb  ,
          mg.used_memory_kb / 1024 used_mb  ,
          mg.max_used_memory_kb / 1024 max_used_mb  ,
          mg.ideal_memory_kb / 1024 ideal_mb  ,
          mg.timeout_sec timeout_s  ,
          mg.wait_time_ms ,
          mg.is_next_candidate 
     FROM qpi_RBL_MISDB_PROD.queries Q
            LEFT JOIN sys.dm_exec_query_memory_grants mg   ON Q.session_id = mg.session_id
            AND Q.request_id = mg.request_id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79103,'--------------------------------------',0,0,0,0,489,'SELECT CONCAT(''FPQ-'', query_id) NAME  ,
          query_id ,
          TEXT TEXT  ,
          plan_id forced_plan_id  ,
          NULL hints  
     FROM qpi_RBL_MISDB_PROD.db_query_plans 
    WHERE  is_forced_plan = 1
   UNION ALL 
   SELECT NAME ,
          Q.query_id ,
          query_text TEXT  ,
          NULL forced_plan_id  ,
          hints 
     FROM sys.plan_guides pg
            LEFT JOIN qpi_RBL_MISDB_PROD.db_queries Q   ON Q.TEXT = pg.query_text
    WHERE  is_disabled = 0 ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79104,'--------------------------------------',14,14,0,0,1530,'SELECT Q.TEXT TEXT  ,
          Q.session_id session_id  ,
          tl.request_owner_type ,
          tl.request_status ,
          tl.request_mode ,
          tl.request_type ,
          obj.OBJECT_ID locked_object_id  ,
          /*TODO:SQLDEV*/ SCHEMA_NAME(obj.schema_id) /*END:SQLDEV*/ locked_object_schema  ,
          obj.NAME locked_object_name  ,
          obj.type_desc locked_object_type  ,
          tl.resource_type locked_resource_type  ,
          SYS_CONTEXT(''USERENV'','''') locked_resource_db  ,
          Q.request_id ,
          tl.resource_associated_entity_id 
     FROM qpi_RBL_MISDB_PROD.queries Q
            JOIN sys.dm_tran_locks tl   ON Q.session_id = tl.request_session_id
            AND Q.request_id = tl.request_request_id
            LEFT JOIN ( SELECT p.OBJECT_ID ,
                               p.hobt_id ,
                               au.allocation_unit_id 
                        FROM sys.partitions p
                               LEFT JOIN sys.allocation_units au   ON ( au.TYPE IN ( 1,3 )

                               AND au.container_id = p.hobt_id )
                               OR ( au.TYPE = 2
                               AND au.container_id = p.partition_id ) ) p   ON tl.resource_type IN ( ''PAGE'',''KEY'',''RID'',''HOBT'' )

            AND p.hobt_id = tl.resource_associated_entity_id
            OR tl.resource_type = ''ALLOCATION_UNIT''
            AND p.allocation_unit_id = tl.resource_associated_entity_id
            LEFT JOIN sys.objects obj   ON p.OBJECT_ID = obj.OBJECT_ID');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79105,'--------------------------------------',9,9,0,0,587,'SELECT c.category category  ,
          wait_type wait_type  ,
          waiting_tasks_count ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(wait_time_ms / 1000., 1),12,1) wait_time_s  ,
          wait_time_ms / CASE 
                              WHEN waiting_tasks_count = 0 THEN NULL
          ELSE waiting_tasks_count
             END wait_per_task_ms  ,
          max_wait_time_ms ,
          signal_wait_time_ms / 1000 signal_wait_time_s  ,
          cid.category_id category_id  ,
          ''www.sqlskills.com/help/waits/'' || wait_type info  
     FROM sys.dm_os_wait_stats CROSS');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79106,'--------------------------------------',0,0,0,0,89,'SELECT * 
     FROM qpi_RBL_MISDB_PROD.wait_stats_ex 
    WHERE  category_id IS NOT NULL ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79107,'--------------------------------------',3,3,0,0,212,'SELECT S.snapshot_name ,
          S.start_time ,
          fs.* 
     FROM qpi_RBL_MISDB_PROD.file_stats_snapshots S
             /*TODO:SQLDEV*/ cross apply qpi.file_stats_at(s.snapshot_name) fs /*END:SQLDEV*/ ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79108,'--------------------------------------',3,3,0,0,215,'SELECT S.snapshot_name ,
          S.start_time ,
          fs.* 
     FROM qpi_RBL_MISDB_PROD.file_stats_snapshots S
             /*TODO:SQLDEV*/ cross apply qpi.db_file_stats_at(s.snapshot_name) fs /*END:SQLDEV*/ ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79109,'--------------------------------------',4,4,0,0,497,'SELECT volume_mount_point ,
          UTILS.CONVERT_TO_NUMBER(MIN(total_bytes / 1024. / 1024 / 1024) ,10,1) used_gb  ,
          UTILS.CONVERT_TO_NUMBER(MIN(available_bytes / 1024. / 1024 / 1024) ,10,1) available_gb  ,
          UTILS.CONVERT_TO_NUMBER(MIN((total_bytes + available_bytes) / 1024. / 1024 / 1024) ,10,1) total_gb  
     FROM sys.master_files f
             /*TODO:SQLDEV*/ CROSS APPLY sys.dm_os_volume_stats(f.database_id, f.file_id) /*END:SQLDEV*/ 
     GROUP BY volume_mount_point');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79110,'--------------------------------------',83,83,264192,0,1718,'SELECT "ENTITYKEY","ACCOUNTENTITYID","RESTRUCTURETYPEALT_KEY","RESTRUCTUREPROPOSALDT","RESTRUCTUREDT","RESTRUCTUREAMT","RESTRUCTUREAPPROVALDT","RESTRUCTURESEQUENCEREFNO","DIMINUTIONAMOUNT","RESTRUCTUREBYALT_KEY","REFCUSTOMERID","REFSYSTEMACID","SDR_INVOKED","SDR_REFER_DATE","REMARK","RESTRUCTUREFACILITYTYPEALT_KEY","BANKINGRELATIONTYPEALT_KEY","INVOCATIONDATE","ASSETCLASSALT_KEYONINVOCATION","EQUITYCONVERSIONYN","CONVERSIONDATE","PRINCREPAYSTARTDATE","INTTREPAYSTARTDATE","PRERESTRUCTUREASSETCLASSALT_KEY","PRERESTRUCTURENPA_DATE","PROVPERONRESTRUCURE","COVID_OTR_CATGALT_KEY","RESTRUCTUREAPPROVINGAUTHORITY","RESTRUCTRETOS","UNSERVICEINTTASONRESTRUCTURE","RESTRUCTUREPOS","RESTRUCTURESTAGE","RESTRUCTURESTATUS","DPD_ASONRESTRUCTURE","DPD_BREACH_DATE","ZERODPD_DATE","SURVPERIODENDDATE","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","RESTRUCTUREFAILUREDATE","UPGRADEDATE","PREDEGPROVPER","SP_EXPIRYEXTENDEDDATE","CHANGEFIELD","RESTRUCTUREDESCRIPTION","INVESTMENTGRADE","POS_10PERPAIDDATE","FLGMORAT","PRERESTRUCTURENPA_PROV","RESTRUCTUREASSETCLASSALT_KEY","POSTRESTRUCASSETCLASS","RESTRUCTURECATGALT_KEY","BANKINGTYPE","COVID_OTR_CATG","IS_COVID_MORAT","IS_INVESTMENTGRADE","REVISEDBUSINESSSEGMENT","PRERESTRUCNPA_DATE","DISBURSEMENTDATE","PRERESTRUCDEFAULTDATE","NPA_QTR","RESTRUCTUREDATE","APPROVINGAUTHALT_KEY","REPAYMENTSTARTDATE","INTREPAYSTARTDATE","REFDATE","ISEQUITYCOVERSION","FSTDEFAULTREPORTINGBANK","ICA_SIGNDATE","CREDITPROVISION","DFVPROVISION","MTMPROVISION","CRILIC_FST_DEFAULTDATE","REVISEDBUSSEGALT_KEY","NPA_PROVISION_PER" 
     FROM CurDat_RBL_MISDB_PROD.AdvAcRestructureDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79111,'--------------------------------------',32,32,0,0,597,'SELECT "ENTITYKEY","CUSTOMERENTITYID","BRANCHCODE","TOTLIMITFUNDED","TOTLIMITNF","TOTOSFUNDED","TOTOSNF","TOTOVERDUE","TOTCADU","TOTCAD","CUST_ASSETCLASSALT_KEY","TOTPROVISION","TOTADDITIONALPROVISION","TOTGENERICADDLPROVISION","TOTUNAPPLIEDINT","ENTITYCLOSUREDATE","ENTITYCLOSUREREASONALT_KEY","OLD_CUST_ASSETCLASSALT_KEY","REFCUSTOMERID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","MOCSTATUS","MOCDATE","MOCTYPEALT_KEY" 
     FROM CurDat_RBL_MISDB_PROD.ADVCUSTFINANCIALDETAIL');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79112,'--------------------------------------',7,7,0,0,1052,'SELECT r.command ,
          UTILS.CONVERT_TO_NUMBER(r.percent_complete,6,2) percent_complete  ,
          UTILS.CONVERT_TO_VARCHAR2(utils.dateadd(''MS'', r.estimated_completion_time, SYSDATE),20,p_style=>20) ETA  ,
          UTILS.CONVERT_TO_NUMBER(r.total_elapsed_time / 1000.0 / 60.0,10,2) elapsed_mi  ,
          UTILS.CONVERT_TO_NUMBER(r.estimated_completion_time / 1000.0 / 60.0 / 60.0,10,2) eta_h  ,
          UTILS.CONVERT_TO_VARCHAR2(( SELECT SUBSTR(TEXT, r.statement_start_offset / 2, CASE 
                                                                                             WHEN r.statement_end_offset = -1 THEN 1000
                                                    ELSE (r.statement_end_offset - r.statement_start_offset) / 2
                                                       END) 
                                      FROM TABLE(dm_exec_sql_text(sql_handle))  ),1000) QUERY  ,
          r.session_id 
     FROM sys.dm_exec_requests r
    WHERE  command IN ( ''RESTORE DATABASE'',''BACKUP DATABASE'',''BACKUP LOG'',''RESTORE LOG'' )');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79113,'--------------------------------------',0,0,0,0,86,'SELECT * 
     FROM fn_file_stats(/*TODO:SQLDEV*/ DB_ID() /*END:SQLDEV*/, NULL, NULL) ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79114,'--------------------------------------',0,0,0,0,89,'SELECT * 
     FROM TABLE(db_query_plan_exec_stats_as_of(SYS_EXTRACT_UTC(SYSTIMESTAMP))) ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79115,'--------------------------------------',0,0,0,0,92,'SELECT * 
     FROM TABLE(db_query_plan_exec_stats_ex_as_of(SYS_EXTRACT_UTC(SYSTIMESTAMP))) ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79116,'--------------------------------------',0,0,0,0,57,'SELECT * 
     FROM db_query_plan_exec_stats_as_of(NULL) ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79117,'--------------------------------------',0,0,0,0,89,'SELECT * 
     FROM TABLE(db_query_plan_wait_stats_as_of(SYS_EXTRACT_UTC(SYSTIMESTAMP))) ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79118,'--------------------------------------',0,0,0,0,52,'SELECT * 
     FROM fn_file_stats(NULL, NULL, NULL) ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79119,'--------------------------------------',5,5,0,0,266,'SELECT objtype cached_object  ,
          SUM(size_in_bytes / 1024 / 1024 / 1024)  memory_gb  ,
          COUNT(*)  plan_count  ,
          SUM(usecounts)  used_plans  ,
          SUM(refcounts)  references  
     FROM sys.dm_exec_cached_plans 
     GROUP BY objtype');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79120,'--------------------------------------',0,0,0,0,525,'SELECT REPLACE(NVL(type, ''-->  TOTAL USED:''), ''MEMORYCLERK_'', '''') memory  ,
          UTILS.CONVERT_TO_NUMBER(SUM(pages_kb)  / 1024.1 / 1024,6,1) GB  ,
          UTILS.CONVERT_TO_NUMBER(SUM(pages_kb)  / 10.24 / memory_mb(),3,0) perc  
     FROM sys.dm_os_memory_clerks 
     GROUP BY ROLLUP( TYPE )

      HAVING SUM(pages_kb)  / 1024. / 1024 > 0.1
   UNION ALL 
   SELECT ''-->  TOTAL AVAILABLE:'' memory  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(memory_mb() / 1024., 1),6,1) GB  ,
          100 perc  
     FROM DUAL ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79121,'--------------------------------------',5,5,0,0,1406,'WITH src AS ( SELECT database_id ,
                        COUNT(*)  db_buffer_pages  ,
                        AVG(read_microsec)  / 1000. read_time_ms  ,
                        (100 * SUM(CASE 
                                        WHEN is_modified = 1 THEN 1
                                   ELSE 0
                                      END) ) / COUNT(*)  modified_perc  
     FROM sys.dm_os_buffer_descriptors 

   --WHERE database_id BETWEEN 5 AND 32766 --> to exclude system databases
   GROUP BY ROLLUP( database_id ) ) 
      SELECT CASE 
                  WHEN database_id = 32767 THEN ''Resource DB''
                  WHEN database_id IS NULL THEN ''--> TOTAL:''
             ELSE SYS_CONTEXT(''USERENV'','''')
                END db_name  ,
             db_buffer_pages / 128 / 1024 buffer_gb  ,
             UTILS.CONVERT_TO_NUMBER(db_buffer_pages * 100.0 / ( SELECT cntr_value 
                                                                 FROM sys.dm_os_performance_counters 
                                                                  WHERE  RTRIM(object_name) LIKE ''%Buffer Manager''
                                                                           AND counter_name = ''Database Pages'' 
                                                                   FETCH FIRST 1 ROWS ONLY ),6,3) buffer_percent  ,
             read_time_ms ,
             modified_perc 
        FROM src');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79122,'--------------------------------------',0,0,0,0,43,'SELECT * 
     FROM wait_stats_as_of(NULL) ');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79144,'--------------------------------------',66,66,264192,0,996,'SELECT "ENTITYKEY","BRANCHCODE","UCIF_ID","UCIFENTITYID","CUSTOMERENTITYID","PARENTCUSTOMERID","REFCUSTOMERID","SOURCESYSTEMCUSTOMERID","CUSTOMERNAME","CUSTSEGMENTCODE","CONSTITUTIONALT_KEY","PANNO","AADHARCARDNO","SRCASSETCLASSALT_KEY","SYSASSETCLASSALT_KEY","SPLCATG1ALT_KEY","SPLCATG2ALT_KEY","SPLCATG3ALT_KEY","SPLCATG4ALT_KEY","SMA_CLASS_KEY","PNPA_CLASS_KEY","PRVQTRRV","CURNTQTRRV","TOTPROVISION","BANKTOTPROVISION","RBITOTPROVISION","SRCNPA_DT","SYSNPA_DT","DBTDT","DBTDT2","DBTDT3","LOSSDT","MOC_DT","EROSIONDT","SMA_DT","PNPA_DT","ASSET_NORM","FLGDEG","FLGUPG","FLGMOC","FLGSMA","FLGPROCESSING","FLGEROSION","FLGPNPA","FLGPERCOLATION","FLGINMONTH","FLGDIRTYROW","DEGDATE","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","COMMONMOCTYPEALT_KEY","INMONTHMARK","MOCSTATUSMARK","SOURCEALT_KEY","BANKASSETCLASS","CUST_EXPO","MOCREASON","ADDLPROVISIONPER","FRAUDDT","FRAUDAMOUNT","DEGREASON","CUSTMOVEDESCRIPTION","TOTOSCUST","MOCTYPE","SCREENFLAG","CHANGEFLD" 
     FROM MAIN_PRO.CustomerCal_Main');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86613,'--------------------------------------',16,16,0,0,1483,'SELECT ''MD_TRIGGERS'' objtype,trig.trigger_name objname, trig.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME,t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||trig.trigger_name  QualifiedName
FROM MD_TRIGGERS trig, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE trig.table_or_view_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id 
UNION ALL
SELECT ''MD_TRIGGERS'' objtype,trig.trigger_name objname, trig.Id objid,  ''MD_VIEWS'' MainObjType,v.view_name MAINOBJNAME,v.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||trig.trigger_name  QualifiedName
FROM MD_TRIGGERS trig, MD_VIEWS v,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE trig.table_or_view_id_fk = v.id
AND v.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id 
ORDER BY objid');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86614,'--------------------------------------',16,16,0,0,2469,'SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CATALOG_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_SCHEMA_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TABLES_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_COLUMN_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CONSTRAINTS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_INDEX_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TRIGGER_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_VIEW_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PROGRAMS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PARTITIONS_DETAILS');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86615,'--------------------------------------',18,18,264192,0,1143,'SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME", p.native_sql,p.linecount 
FROM md_stored_programs p , mgv_all_programs_details d
WHERE p.id = d.objid
AND d.capturedorconverted = ''CAPTURED''
UNION ALL
SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME",v.native_sql,v.linecount
FROM md_views v , mgv_all_view_details d
WHERE v.id = d.objid
AND d.capturedorconverted = ''CAPTURED''
UNION ALL
SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME" ,t.native_sql,t.linecount
FROM md_triggers t , mgv_all_trigger_details d
WHERE t.id = d.objid
AND d.capturedorconverted = ''CAPTURED''');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84961,'--------------------------------------',18,18,264192,0,1143,'SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME", p.native_sql,p.linecount 
FROM md_stored_programs p , mgv_all_programs_details d
WHERE p.id = d.objid
AND d.capturedorconverted = ''CAPTURED''
UNION ALL
SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME",v.native_sql,v.linecount
FROM md_views v , mgv_all_view_details d
WHERE v.id = d.objid
AND d.capturedorconverted = ''CAPTURED''
UNION ALL
SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME" ,t.native_sql,t.linecount
FROM md_triggers t , mgv_all_trigger_details d
WHERE t.id = d.objid
AND d.capturedorconverted = ''CAPTURED''');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84962,'--------------------------------------',18,18,0,0,879,'SELECT ''MD_COLUMNS'' objtype, c.COLUMN_NAME objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname ,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.COLUMN_NAME QualifiedName,
c.column_type datatype,
CASE WHEN p.PROP_KEY=''SEEDVALUE'' THEN ''Y'' ELSE ''N'' END IsIdentity
FROM MD_COLUMNS c LEFT OUTER JOIN MD_ADDITIONAL_PROPERTIES p ON c.id =p.ref_id_fk
, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn,MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84963,'--------------------------------------',32,32,0,0,1252,'select d1.catalogid capcatalogid,
   d1.catalogname capcatalogname,
   d1.connid capconnid,
   d1.connname capconnname,
   d1.mainobjid capmainobjid,
   d1.mainobjname capmainobjname,
   d1.mainobjtype capmainobjtype ,
   d1.objid capobjid,
   d1.objname capobjname,
   d1.objtype capobjtype,
   d1.projectid capprojectid,
   d1.projectname capprojectname,
   d1.qualifiedname capqualifiedname,
   d1.schemaid capschemaid,
   d1.schemaname capschemaname,
   d2.catalogid concatalogid,
   d2.catalogname concatalogname,
   d2.connid conconnid,
   d2.connname conconnname,
   d2.mainobjid conmainobjid,
   d2.mainobjname conmainobjname,
   d2.mainobjtype conmainobjtype ,
   d2.objid conobjid,
   d2.objname conobjname,
   d2.objtype conobjtype,
   d2.projectid conprojectid,
   d2.projectname conprojectname,
   d2.qualifiedname conqualifiedname,
   d2.schemaid conschemaid,
   d2.schemaname conschemaname,
    der.derivative_reason,
    der.transformed
  FROM mgv_all_details d1
  LEFT OUTER JOIN md_derivatives der
  ON der.src_id              = d1.objid
  AND der.derivative_reason IS NULL
  LEFT OUTER JOIN mgv_all_details d2
  ON der.derived_id            = d2.objid
  WHERE d1.capturedorconverted = ''CAPTURED''
  AND der.derivative_reason   IS NULL');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84964,'--------------------------------------',17,17,0,0,366,'SELECT "ID","SRC_ID","SRC_TYPE","DERIVED_ID","DERIVED_TYPE","DERIVED_CONNECTION_ID_FK","TRANSFORMED","ORIGINAL_IDENTIFIER","NEW_IDENTIFIER","DERIVED_OBJECT_NAMESPACE","DERIVATIVE_REASON","SECURITY_GROUP_ID","CREATED_ON","CREATED_BY","LAST_UPDATED_ON","LAST_UPDATED_BY","ENABLED" FROM MD_DERIVATIVES WHERE (Derivative_Reason <> ''SCRATCH'' OR DERIVative_Reason IS NULL)');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84965,'--------------------------------------',17,17,0,0,334,'SELECT "ID","SRC_ID","SRC_TYPE","DERIVED_ID","DERIVED_TYPE","DERIVED_CONNECTION_ID_FK","TRANSFORMED","ORIGINAL_IDENTIFIER","NEW_IDENTIFIER","DERIVED_OBJECT_NAMESPACE","DERIVATIVE_REASON","SECURITY_GROUP_ID","CREATED_ON","CREATED_BY","LAST_UPDATED_ON","LAST_UPDATED_BY","ENABLED" FROM MD_DERIVATIVES WHERE Derivative_Reason = ''SCRATCH''');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79147,'--------------------------------------',26,26,0,0,484,'SELECT "ENTITYKEY","BRANCHCODE","ISSUERENTITYID","ISSUERID","ISSUERNAME","RATINGSTATUS","ISSUERACCPRATING","ISSUERACCPRATINGDT","ISSUERRATINGAGENCY","REF_TXN_SYS_CUST_ID","ISSUER_CATEGORY_CODE","GRPENTITYOFBANK","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","SOURCEALT_KEY","UCIFID","PANNO","SETTLEMENT_FLAG","SETTLEMENT_DATE" 
     FROM CurDat_RBL_MISDB_PROD.InvestmentIssuerDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79126,'--------------------------------------',83,83,0,0,1428,'SELECT "AC_KEY","BRANCHCODE","ACCOUNTENTITYID","CUSTOMERENTITYID","SYSTEMACID","CUSTOMERACID","GLALT_KEY","PRODUCTALT_KEY","GLPRODUCTALT_KEY","FACILITYTYPE","SECTORALT_KEY","SUBSECTORALT_KEY","ACTIVITYALT_KEY","INDUSTRYALT_KEY","SCHEMEALT_KEY","DISTRICTALT_KEY","AREAALT_KEY","VILLAGEALT_KEY","STATEALT_KEY","CURRENCYALT_KEY","ORIGINALSANCTIONAUTHALT_KEY","ORIGINALLIMITREFNO","ORIGINALLIMIT","ORIGINALLIMITDT","DTOFFIRSTDISB","FLAGRELIEFWAVIER","UNDERLINEACTIVITYALT_KEY","MICROCREDIT","SCRCRERROR","ADJDT","ADJREASONALT_KEY","MARGINTYPE","PREF_INTTRATE","CURRENTLIMITREFNO","GUARANTEECOVERALT_KEY","ACCOUNTNAME","ASSETCLASS","JOINTACCOUNT","LASTDISBDT","SCRCRERRORBACKUP","ACCOUNTOPENDATE","AC_LADDT","AC_DOCUMENTDT","CURRENTLIMIT","INTTTYPEALT_KEY","INTTRATELOADFACTOR","MARGIN","CURRENTLIMITDT","AC_DUEDT","DRAWINGPOWERALT_KEY","REFCUSTOMERID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","MOCSTATUS","MOCDATE","MOCTYPEALT_KEY","ISLAD","FINCALEBASEDINDUSTRYALT_KEY","ACCATEGORYALT_KEY","ORIGINALSANCTIONAUTHLEVELALT_KEY","ACTYPEALT_KEY","SCRCRERRORSEQ","BSRUNID","ADDITIONALPROV","ACLATTESTDEVELOPMENT","SOURCEALT_KEY","LOANSERIES","LOANREFNO","SECURITIZATIONCODE","FULL_DISB","ORIGINALBRANCHCODE","PROJECTCOST","FLGSECURED","SEGMENTCODE","REFERENCEPERIOD" 
     FROM CurDat_RBL_MISDB_PROD.AdvAcBasicDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79127,'--------------------------------------',34,34,0,0,610,'SELECT "ENTITYKEY","ACCOUNTENTITYID","AC_LASTREVIEWDUEDT","AC_REVIEWTYPEALT_KEY","AC_REVIEWDT","AC_REVIEWAUTHALT_KEY","AC_NEXTREVIEWDUEDT","DRAWINGPOWER","INTTRATE","NPADT","BOOKDEBTS","UNDRAWNAMT","UNADJSUBSIDY","LASTINTTREALISEDT","MOCSTATUS","MOCREASON","LIMITDISBURSED","REFCUSTOMERID","REFSYSTEMACID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","MOCDATE","MOCTYPEALT_KEY","CROPDURATION","AC_REVIEWAUTHLEVELALT_KEY","ACCOUNTBLKCODE2" 
     FROM CurDat_RBL_MISDB_PROD.AdvAcFinancialDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84959,'--------------------------------------',16,16,0,0,1483,'SELECT ''MD_TRIGGERS'' objtype,trig.trigger_name objname, trig.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME,t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||trig.trigger_name  QualifiedName
FROM MD_TRIGGERS trig, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE trig.table_or_view_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id 
UNION ALL
SELECT ''MD_TRIGGERS'' objtype,trig.trigger_name objname, trig.Id objid,  ''MD_VIEWS'' MainObjType,v.view_name MAINOBJNAME,v.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||trig.trigger_name  QualifiedName
FROM MD_TRIGGERS trig, MD_VIEWS v,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE trig.table_or_view_id_fk = v.id
AND v.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id 
ORDER BY objid');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84960,'--------------------------------------',16,16,0,0,2469,'SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CATALOG_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_SCHEMA_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TABLES_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_COLUMN_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CONSTRAINTS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_INDEX_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TRIGGER_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_VIEW_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PROGRAMS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PARTITIONS_DETAILS');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79128,'--------------------------------------',29,29,0,0,510,'SELECT "ENTITYKEY","ACCOUNTENTITYID","GOVGURAMT","SPLCATG1ALT_KEY","SPLCATG2ALT_KEY","REFINANCEAGENCYALT_KEY","REFINANCEAMOUNT","BANKALT_KEY","TRANSFERAMT","PROJECTID","CONSORTIUMID","REFSYSTEMACID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","MOCSTATUS","MOCDATE","SPLCATG3ALT_KEY","SPLCATG4ALT_KEY","MOCTYPEALT_KEY","GOVGUREXPDT","SPLFLAG" 
     FROM CurDat_RBL_MISDB_PROD.AdvAcOtherDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79129,'--------------------------------------',24,24,0,0,463,'SELECT "ENTITYKEY","BRANCHCODE","RELATIONENTITYID","CUSTOMERENTITYID","ACCOUNTENTITYID","RELATIONTYPEALT_KEY","RELATIONSRNO","RELATIONSHIPAUTHORITYCODEALT_KEY","INWARDNO","FACILITYNO","GUARANTEEVALUE","REFCUSTOMERID","REFSYSTEMACID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","STATUSACTIONTAKEN" 
     FROM CurDat_RBL_MISDB_PROD.AdvAcRelations');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79137,'--------------------------------------',27,27,0,0,473,'SELECT "ENTITYKEY","ACCOUNTENTITYID","CREDITCARDENTITYID","CORPORATEUCIC_ID","CORPORATECUSTOMERID","LIABILITY","MINIMUMAMOUNTDUE","CD","BUCKET","DPD","REFSYSTEMACID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","MOCSTATUS","MOCDATE","ACCOUNTSTATUS","ACCOUNTBLKCODE2","ACCOUNTBLKCODE1","CHARGEOFFY_N" 
     FROM CurDat_RBL_MISDB_PROD.AdvFacCreditCardDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87243,'--------------------------------------',16,16,0,0,729,'SELECT ''MD_TABLES'' objtype, t.table_name objname, t.id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN   md_meta.quote(cat.catalog_name,s.name,t.table_name,conn.id)
                            ELSE   s.name || ''.'' || t.table_name END QualifiedName
FROM MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87244,'--------------------------------------',16,16,0,0,779,'SELECT ''MD_PARTITIONS'' objtype, ''PARTTITION_EXP'' objname, t.id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN   md_meta.quote(cat.catalog_name,s.name,t.table_name,conn.id)
                            ELSE   s.name || ''.'' || t.table_name END QualifiedName
FROM MD_PARTITIONS p, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE p.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87245,'--------------------------------------',16,16,0,0,669,'SELECT ''MD_STORED_PROGRAMS'' objtype,p.name objname, p.Id objid,  ''MD_STORED_PROGRAMS'' MainObjType,p.name MAINOBJNAME,p.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||p.name  QualifiedName
FROM MD_STORED_PROGRAMS p,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE p.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87246,'--------------------------------------',16,16,0,0,655,'SELECT ''MD_VIEWS'' objtype, v.view_name objname, v.Id objid,  ''MD_VIEWS'' MainObjType,v.view_name MAINOBJNAME,v.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||v.view_name  QualifiedName
FROM MD_VIEWS v,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE v.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87247,'--------------------------------------',16,16,0,0,723,'SELECT ''MD_COLUMNS'' objtype, c.COLUMN_NAME objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.COLUMN_NAME QualifiedName
FROM MD_COLUMNS c, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87248,'--------------------------------------',16,16,0,0,717,'SELECT ''MD_CONSTRAINTS'' objtype, c.name objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.name QualifiedName
FROM MD_CONSTRAINTS c, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87249,'--------------------------------------',16,16,0,0,700,'SELECT ''MD_INDEXES'' objtype,i.index_name objname, i.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME,t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid, proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||i.index_name  QualifiedName
FROM MD_INDEXES i, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn,MD_PROJECTS proj
WHERE i.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79131,'--------------------------------------',39,39,0,0,644,'SELECT "ENTITYKEY","CUSTOMERENTITYID","RELATIONENTITYID","RELATIONADDENTITYID","ADDRESSCATEGORYALT_KEY","ADDRESSTYPEALT_KEY","ADD1","ADD2","ADD3","COUNTRYALT_KEY","DISTRICTALT_KEY","CITYALT_KEY","PINCODE","CUSTLOCATIONCODE","STD_CODE_RES","PHONENO_RES","STD_CODE_OFF","PHONENO_OFF","FAXNO","EXTENSIONNO","SCRCRERROR","REFCUSTOMERID","ISMAINADDRESS","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","DUNSNO","CIBILPGID","CITYNAME","SCRCRERRORSEQ","UCIF_ID","UCIFENTITYID" 
     FROM CurDat_RBL_MISDB_PROD.AdvCustCommunicationDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84952,'--------------------------------------',16,16,0,0,729,'SELECT ''MD_TABLES'' objtype, t.table_name objname, t.id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN   md_meta.quote(cat.catalog_name,s.name,t.table_name,conn.id)
                            ELSE   s.name || ''.'' || t.table_name END QualifiedName
FROM MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84953,'--------------------------------------',16,16,0,0,779,'SELECT ''MD_PARTITIONS'' objtype, ''PARTTITION_EXP'' objname, t.id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN   md_meta.quote(cat.catalog_name,s.name,t.table_name,conn.id)
                            ELSE   s.name || ''.'' || t.table_name END QualifiedName
FROM MD_PARTITIONS p, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE p.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84954,'--------------------------------------',16,16,0,0,669,'SELECT ''MD_STORED_PROGRAMS'' objtype,p.name objname, p.Id objid,  ''MD_STORED_PROGRAMS'' MainObjType,p.name MAINOBJNAME,p.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||p.name  QualifiedName
FROM MD_STORED_PROGRAMS p,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE p.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84955,'--------------------------------------',16,16,0,0,655,'SELECT ''MD_VIEWS'' objtype, v.view_name objname, v.Id objid,  ''MD_VIEWS'' MainObjType,v.view_name MAINOBJNAME,v.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||v.view_name  QualifiedName
FROM MD_VIEWS v,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE v.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84956,'--------------------------------------',16,16,0,0,723,'SELECT ''MD_COLUMNS'' objtype, c.COLUMN_NAME objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.COLUMN_NAME QualifiedName
FROM MD_COLUMNS c, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84957,'--------------------------------------',16,16,0,0,717,'SELECT ''MD_CONSTRAINTS'' objtype, c.name objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.name QualifiedName
FROM MD_CONSTRAINTS c, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84958,'--------------------------------------',16,16,0,0,700,'SELECT ''MD_INDEXES'' objtype,i.index_name objname, i.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME,t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid, proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||i.index_name  QualifiedName
FROM MD_INDEXES i, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn,MD_PROJECTS proj
WHERE i.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79132,'--------------------------------------',26,26,0,0,473,'SELECT "ENTITYKEY","CUSTOMERENTITYID","CUST_ASSETCLASSALT_KEY","NPADT","LASTINTTCHARGEDDT","DBTDT","LOSDT","DEFAULTREASON1ALT_KEY","DEFAULTREASON2ALT_KEY","STAFFACCOUNTABILITY","LASTINTBOOKED","REFCUSTOMERID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","MOCSTATUS","MOCDATE","MOCTYPEALT_KEY","NPA_REASON","D2KTIMESTAMP" 
     FROM CurDat_RBL_MISDB_PROD.AdvCustNpaDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79133,'--------------------------------------',85,85,0,0,1566,'SELECT "ENTITYKEY","CUSTOMERENTITYID","ORGCOSTOFEQUIP","ORGCOSTOFPLANTMECH","DEPVALPLANT","VALLAND","IECDNO","GROUPALT_KEY","CUSTOMERSWIFTCODE","SPLCATG1ALT_KEY","SPLCATG2ALT_KEY","SPLCATG3ALT_KEY","SPLCATG4ALT_KEY","CMAELIGIBLE","PFNO","SUPPERANNUATIONBENEFIT","SUPPERANNUATIONBENEFITVALUATIONDT","BUSINESSCOMMENCEDT","CANCELOBTAINED","TOTCONSORTIUMLIMITFUNDED","TOTCONSORTIUMLIMITNONFUNDED","UPGRADATIONDATE","CUSTOMEREXPIREDYN","TOTWCLIMITFUNDED","FLAGGED_SUBSECTOR","REFCUSTOMERID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","MOCSTATUS","MOCDATE","MOCTYPEALT_KEY","ANNUALEXPORTTURNOVER","FMCNUMBER","ISEMPLOYEE","ISPETITIONER","UNDERLITIGATION","PERMINATUREID","BORRUNITFUNCT","DTOFCLOSURE","NONCOOPBORROWER","ARBIAGREEMENT","TRANSTHROUGHUS","CUTBACKARRANGEMENT","BANKINGARRANGEMENT","MEMBERBANKSNO","TOTALCONSORTIUMAMT","ROC_CFCREPORTDATE","ROC_CHARGEFV","ROC_CHARGEFVDT","ROC_CHARGEREMARK","ROC_SECURITIES","ROC_COVER","ROC_COVEREDDT","CHARGEFILEDWITH","FILEDDT","EMPLOYEEID","EMPLOYEETYPE","DESIGNATION","PLACEOFPOSTING","LPERSONALCONDATE","LPERSONALCONDTLS","RECALLNOTICEDATE","RECALLNOTICEMODEID","LEGALAUDITDATE","IRREGULARITYPENDING","IRREGULARITYRECTIDATE","FRAUDACCOSTATUS","PRESARFAESINOTICEDT","FMRNO","FMRDATE","GRADESCALEALT_KEY","FRAUDNATUREREMARK","ROCCOVEREDCERTIFICATEREMARK","REASONSNONCOOPERATIVEBORROWER","STATUSNONCOOPERATIVEBORROWER","SOURCEASSETCLASS","SOURCENPADATE" 
     FROM CurDat_RBL_MISDB_PROD.AdvCustOtherDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79134,'--------------------------------------',85,85,264192,0,1432,'SELECT "ENTITYKEY","CUSTOMERENTITYID","RELATIONENTITYID","SALUTATIONALT_KEY","NAME","CONSTITUTIONALT_KEY","OCCUPATIONALT_KEY","RELIGIONALT_KEY","CASTEALT_KEY","FARMERCATALT_KEY","MARITALSTATUSALT_KEY","NETWORTH","DATEOFBIRTH","QUALIFICATION1ALT_KEY","QUALIFICATION2ALT_KEY","QUALIFICATION3ALT_KEY","QUALIFICATION4ALT_KEY","MOBILENO","EMAIL","VOTERID","RATIONCARDNO","AADHAARID","NPR_ID","PASSPORTNO","PASSPORTISSUEDT","PASSPORTEXPIRYDT","PASSPORTISSUELOCATION","DL_NO","DL_ISSUEDATE","DL_EXPIRYDATE","DL_ISSUELOCATION","BUSIENTITY_NATIONALITYTYPEALT_KEY","NATIONALITYCOUNTRYALT_KEY","PAN","TAN","TIN","REGISTRATIONNO","DIN","CIN","SERVICETAX","OTHERID","OTHERIDTYPE","REGISTRATIONAUTH","REGISTRATIONAUTHLOCATION","PREVFINYEARSALES","EMPLOYEECOUNT","SALESFIGFINYR","DESIGNATION_CONTACTPEROSON","INCORPORATIONDATE","BUSINESSCATEGORYALT_KEY","BUSINESSINDUSTRYTYPEALT_KEY","SHAREPERCENT","RETIREMENTDATE","PROFESSIONAREA","EXISTINGCUSTOMER","SCRCRERROR","REFCUSTOMERID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","CIBILPGID","INITIAL_","BECOMNRI_DT","AUTHSIGNSTARTDT","AUTHSIGNENDDT","SCRCRERRORSEQ","NETWORTHDATE","ADVNETWORTH","DEFENDENTEXPIRE","DEFENDENTEXPIREDT","PPHOTO","PPHOTODT","PPHOTOURL","ACTIONSTATUS","DIRECTORDEBARRED","LEI","UCIF_ID","UCIFENTITYID" 
     FROM CurDat_RBL_MISDB_PROD.AdvCustRelationship');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79135,'--------------------------------------',83,83,0,0,1346,'SELECT "ENTITYKEY","ACCOUNTENTITYID","BILLENTITYID","BILLNO","BILLDT","BILLAMT","BILLREFNO","BILLPURDT","ADVAMOUNT","BILLDUEDT","BILLEXTENDEDDUEDT","CRYSTALISATIONDT","COMMERCIALISATIONDT","BILLNATUREALT_KEY","BILLACCEPTANCEDT","USANCEDAYS","DRAWEENO","DRAWEEBANKNAME","DRAWERNAME","PAYEENAME","COLLECTINGBANKNAME","COLLECTINGBRANCHPLACE","INTERESTINCOME","COMMISSION","DISCOUNTCHARGES","DELAYEDINT","MARGINTYPE","MARGINAMT","COUNTRYALT_KEY","BILLOSREASONALT_KEY","COMMODITYALT_KEY","LCNO","LCAMT","LCISSUINGBANKALT_KEY","LCISSUINGBANK","CURRENCYALT_KEY","BALANCE","BALANCEINCURRENCY","OVERDUE","DERECOGNISEDINTEREST1","DERECOGNISEDINTEREST2","OVERDUESINCEDT","TOTALPROV","ADDITIONALPROV","GENERICADDLPROV","SECURED","COVERGOVGUR","UNSECURED","PROVSECURED","PROVUNSECURED","PROVDICGC","NPADT","CLAIMTYPE","CLAIMCOVERAMT","CLAIMLODGEDDT","CLAIMLODGEDAMT","CLAIMRECVDT","CLAIMRECEIVEDAMT","CLAIMRATE","SCRCRERROR","REFSYSTEMACID","ADJDT","ADJREASONALT_KEY","ENTITYCLOSUREDATE","ENTITYCLOSUREREASONALT_KEY","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","MOCSTATUS","MOCDATE","MOCTYPEALT_KEY","SCRCRERRORSEQ","CONSIGMENTEXPORT","OVERDUEINTEREST","INTERESTOVERDUEDATE","REVIEWDUEDATE" 
     FROM CurDat_RBL_MISDB_PROD.AdvFacBillDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79136,'--------------------------------------',30,30,0,0,527,'SELECT "ENTITYKEY","ACCOUNTENTITYID","ADHOCDT","ADHOCAMT","CONTEXCSSINCEDT","DERECOGNISEDINTEREST1","DERECOGNISEDINTEREST2","CLAIMTYPE","CLAIMCOVERAMT","CLAIMLODGEDDT","CLAIMLODGEDAMT","CLAIMRECVDT","CLAIMRECEIVEDAMT","CLAIMRATE","REFSYSTEMACID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","MOCSTATUS","MOCDATE","MOCTYPEALT_KEY","ADHOCEXPIRYDATE","STOCKSTMTDT" 
     FROM CurDat_RBL_MISDB_PROD.ADVFACCCDETAIL');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84930,'--------------------------------------',13,13,16384,0,767,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_projects
  WHERE md_tables.schema_id_fk     = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84931,'--------------------------------------',9,9,16384,0,506,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name
  FROM md_projects ,
    md_connections,
    md_catalogs
  WHERE md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk   = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84932,'--------------------------------------',8,8,16384,0,396,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    MD_CONNECTIONS.ID CONNECTION_ID ,
    MD_CONNECTIONS.NAME CONNECTION_NAME,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl
  FROM md_projects,
    md_connections
  WHERE MD_CONNECTIONS.PROJECT_ID_FK = MD_PROJECTS.ID
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84933,'--------------------------------------',15,15,0,0,921,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_views.id
  AND md_views.schema_id_fk             = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84934,'--------------------------------------',14,14,0,0,881,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name ,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_stored_programs.id stored_program_id ,
    md_stored_programs.programtype programtype ,
    md_stored_programs.name stored_program_name,
    md_stored_programs.package_id_fk package_id_fk
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_stored_programs
  WHERE md_stored_programs.schema_id_fk = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84935,'--------------------------------------',13,13,16384,0,753,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views
  WHERE md_views.schema_id_fk      = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84950,'--------------------------------------',16,16,0,0,562,'SELECT ''MD_CATALOGS'' objtype, cat.catalog_name objname, cat.id objid,  ''MD_CATALOGS'' MainObjType,cat.catalog_name MAINOBJNAME, cat.id MAINOBJID,null SchemaName,null schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name ELSE NULL END QualifiedName
FROM  MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE  cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84951,'--------------------------------------',16,16,0,0,594,'SELECT ''MD_SCHEMAS'' objtype, s.name objname, s.id objid,  ''MD_SCHEMAS'' MainObjType,s.name MAINOBJNAME, s.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name QualifiedName
FROM MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79138,'--------------------------------------',62,62,0,0,1032,'SELECT "ENTITYKEY","ACCOUNTENTITYID","PRINCIPAL","REPAYMODEALT_KEY","NOOFINSTALL","INSTALLAMT","FSTINSTALLDT","LASTINSTALLDT","TENURE_MONTHS","MARGINAMT","COMMODITYALT_KEY","REPHASEALT_KEY","REPHASEDT","INTSERVICED","SUSPENDEDINTEREST","DERECOGNISEDINTEREST1","DERECOGNISEDINTEREST2","ADJREASONALT_KEY","LCNO","LCAMT","LCISSUINGBANKALT_KEY","RESETFREQUENCY","RESETDT","MORATORIUM","FIRSTINSTALLDTINT","CONTEXCSSINCEDT","LOANPERIOD","CLAIMTYPE","CLAIMCOVERAMT","CLAIMLODGEDDT","CLAIMLODGEDAMT","CLAIMRECVDT","CLAIMRECEIVEDAMT","CLAIMRATE","REFSYSTEMACID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","INSTREPAYMENTDT","SCRCRERROR","INTTREPAYMENTDT","SCHEDULENO","MOCSTATUS","MOCDATE","MOCTYPEALT_KEY","UNAPPLIEDINTT","NXTINSTDAY","PRPLOVDUAFTRMTH","PRPLOVDUAFTRDAY","INTTOVDUAFTRDAY","INTTOVDUAFTRMTH","PRINOVDUENDMTH","INTTOVDUENDMTH","SCRCRERRORSEQ","COVEREXPIRYDT" 
     FROM CurDat_RBL_MISDB_PROD.ADVFACDLDETAIL');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79139,'--------------------------------------',67,67,0,0,1081,'SELECT "ENTITYKEY","ACCOUNTENTITYID","PCREFNO","PCADVDT","PCAMT","PCDUEDT","PCDURATIONDAYS","PCEXTENDEDDUEDT","EXTENSIONREASON","CURRENCYALT_KEY","LCNO","LCAMT","LCISSUEDT","LCISSUINGBANK_FIRMORDER","BALANCE","BALANCEINCURRENCY","BALANCEINUSD","OVERDUE","COMMODITYALT_KEY","COMMODITYVALUE","COMMODITYMARKETVALUE","SHIPMENTDT","COMMERCIALISATIONDT","ECGCPOLICYNO","CAD","CADU","OVERDUESINCEDT","TOTALPROV","SECURED","UNSECURED","PROVSECURED","PROVUNSECURED","PROVDICGC","NPADT","COVERGOVGUR","DERECOGNISEDINTEREST1","DERECOGNISEDINTEREST2","CLAIMTYPE","CLAIMCOVERAMT","CLAIMLODGEDDT","CLAIMLODGEDAMT","CLAIMRECVDT","CLAIMRECEIVEDAMT","CLAIMRATE","ADJDT","ENTITYCLOSUREDATE","ENTITYCLOSUREREASONALT_KEY","REFSYSTEMACID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","UNAPPLIEDINTT","MOCTYPEALT_KEY","MOCSTATUS","MOCDATE","RBI_EXTNPERMREFNO","LC_ORDERALT_KEY","ORDERLC_CURRENCYALT_KEY","COUNTRYALT_KEY","LCAMTINCURRENC" 
     FROM CurDat_RBL_MISDB_PROD.AdvFacPCDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79140,'--------------------------------------',58,58,264192,0,1134,'SELECT "ENTITYKEY","ACCOUNTENTITYID","CUSTOMERENTITYID","SECURITYTYPE","COLLATERALTYPE","SECURITYALT_KEY","SECURITYENTITYID","SECURITY_REFNO","SECURITYNATURE","SECURITYCHARGETYPEALT_KEY","CURRENCYALT_KEY","ENTRYTYPE","SCRCRERROR","INWARDNO","LIMITNODE_FLAG","REFCUSTOMERID","REFSYSTEMACID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","MOCTYPEALT_KEY","MOCSTATUS","MOCDATE","SECURITYPARTICULAR","OWNERTYPEALT_KEY","ASSETOWNERNAME","VALUEATSANCTIONTIME","BRANCHLASTINSPECDATE","SATISFACTIONNO","SATISFACTIONDATE","BANKSHARE","ACTIONTAKENREMARK","SECCHARGE","COLLATERALID","UCICID","CUSTOMERNAME","TAGGINGALT_KEY","DISTRIBUTIONALT_KEY","COLLATERALCODE","COLLATERALSUBTYPEALT_KEY","COLLATERALOWNERSHIPTYPEALT_KEY","CHARGENATUREALT_KEY","SHAREAVAILABLETOBANKALT_KEY","COLLATERALSHAREAMOUNT","IFPERCENTAGEVALUE_OR_ABSOLUTEVALUE","COLLATERALVALUEATSANCTIONINRS","COLLATERALVALUEASONNPADATEINRS","APPROVEDBYFIRSTLEVEL","DATEAPPROVEDFIRSTLEVEL","CHANGEFIELD","SEC_PERF_FLG" 
     FROM CurDat_RBL_MISDB_PROD.AdvSecurityDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79141,'--------------------------------------',22,22,0,0,470,'SELECT "ENTITYKEY","SECURITYENTITYID","VALUATIONSOURCEALT_KEY","VALUATIONDATE","CURRENTVALUE","VALUATIONEXPIRYDATE","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","CURRENTVALUESOURCE","COLLATERALVALUEATTHETIMEOFLASTREVIEWINRS","COLLATERALID","EXPIRYBUSINESSRULE","PERIODINMONTH","SECURITYVALUEMAIN" 
     FROM CurDat_RBL_MISDB_PROD.AdvSecurityValueDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79142,'--------------------------------------',3,3,0,0,135,'SELECT InitialAssetClassAlt_Key ,
          finalAssetClassAlt_Key ,
          AccountEntityID 
     FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79143,'--------------------------------------',46,46,0,0,828,'SELECT "CUSTOMER_KEY","CUSTOMERENTITYID","CUSTOMERID","D2KCUSTOMERID","UCIF_ID","UCIFENTITYID","PARENTBRANCHCODE","CUSTOMERNAME","CUSTOMERINITIAL","CUSTOMERSINCEDT","CONSTITUTIONALT_KEY","OCCUPATIONALT_KEY","RELIGIONALT_KEY","CASTEALT_KEY","FARMERCATALT_KEY","GAURDIANSALUTATIONALT_KEY","GAURDIANNAME","GUARDIANTYPE","CUSTSALUTATIONALT_KEY","MARITALSTATUSALT_KEY","ASSETCLASS","BIITRANSACTIONCODE","D2K_REF_NO","SCRCRERROR","REFERENCEACNO","CUSTCRM_RATINGALT_KEY","CUSTCRM_RATINGDT","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","FLAG","MOCSTATUS","MOCDATE","MOCTYPEALT_KEY","COMMONMOCTYPEALT_KEY","LANDHOLDING","SCRCRERRORSEQ","REMARK","SOURCESYSTEMALT_KEY" 
     FROM CurDat_RBL_MISDB_PROD.CustomerBasicDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79145,'--------------------------------------',36,36,0,0,613,'SELECT "ENTITYKEY","BRANCHCODE","INVENTITYID","INVID","ISSUERENTITYID","REFISSUERID","ISIN","INSTRTYPEALT_KEY","INSTRNAME","INVESTMENTNATURE","INTERNALRATING","INRATINGDATE","INRATINGEXPIRYDATE","EXRATING","EXRATINGAGENCY","EXRATINGDATE","EXRATINGEXPIRYDATE","SECTOR","INDUSTRY_ALTKEY","LISTEDSTKEXCHANGE","EXPOSURETYPE","SECURITYVALUE","MATURITYDT","RESTRUCTUREDATE","MORTGAGESTATUS","NHBSTATUS","RESIPURPOSE","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED" 
     FROM CurDat_RBL_MISDB_PROD.InvestmentBasicDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84791,'--------------------------------------',32,32,0,0,1252,'select d1.catalogid capcatalogid,
   d1.catalogname capcatalogname,
   d1.connid capconnid,
   d1.connname capconnname,
   d1.mainobjid capmainobjid,
   d1.mainobjname capmainobjname,
   d1.mainobjtype capmainobjtype ,
   d1.objid capobjid,
   d1.objname capobjname,
   d1.objtype capobjtype,
   d1.projectid capprojectid,
   d1.projectname capprojectname,
   d1.qualifiedname capqualifiedname,
   d1.schemaid capschemaid,
   d1.schemaname capschemaname,
   d2.catalogid concatalogid,
   d2.catalogname concatalogname,
   d2.connid conconnid,
   d2.connname conconnname,
   d2.mainobjid conmainobjid,
   d2.mainobjname conmainobjname,
   d2.mainobjtype conmainobjtype ,
   d2.objid conobjid,
   d2.objname conobjname,
   d2.objtype conobjtype,
   d2.projectid conprojectid,
   d2.projectname conprojectname,
   d2.qualifiedname conqualifiedname,
   d2.schemaid conschemaid,
   d2.schemaname conschemaname,
    der.derivative_reason,
    der.transformed
  FROM mgv_all_details d1
  LEFT OUTER JOIN md_derivatives der
  ON der.src_id              = d1.objid
  AND der.derivative_reason IS NULL
  LEFT OUTER JOIN mgv_all_details d2
  ON der.derived_id            = d2.objid
  WHERE d1.capturedorconverted = ''CAPTURED''
  AND der.derivative_reason   IS NULL');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84792,'--------------------------------------',17,17,0,0,366,'SELECT "ID","SRC_ID","SRC_TYPE","DERIVED_ID","DERIVED_TYPE","DERIVED_CONNECTION_ID_FK","TRANSFORMED","ORIGINAL_IDENTIFIER","NEW_IDENTIFIER","DERIVED_OBJECT_NAMESPACE","DERIVATIVE_REASON","SECURITY_GROUP_ID","CREATED_ON","CREATED_BY","LAST_UPDATED_ON","LAST_UPDATED_BY","ENABLED" FROM MD_DERIVATIVES WHERE (Derivative_Reason <> ''SCRATCH'' OR DERIVative_Reason IS NULL)');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84793,'--------------------------------------',17,17,0,0,334,'SELECT "ID","SRC_ID","SRC_TYPE","DERIVED_ID","DERIVED_TYPE","DERIVED_CONNECTION_ID_FK","TRANSFORMED","ORIGINAL_IDENTIFIER","NEW_IDENTIFIER","DERIVED_OBJECT_NAMESPACE","DERIVATIVE_REASON","SECURITY_GROUP_ID","CREATED_ON","CREATED_BY","LAST_UPDATED_ON","LAST_UPDATED_BY","ENABLED" FROM MD_DERIVATIVES WHERE Derivative_Reason = ''SCRATCH''');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84928,'--------------------------------------',15,15,0,0,928,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_tables.id
  AND md_tables.schema_id_fk            = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84929,'--------------------------------------',10,10,16384,0,601,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_projects
  WHERE md_schemas.catalog_id_fk   = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79146,'--------------------------------------',62,62,0,0,1004,'SELECT "ENTITYKEY","INVENTITYID","REFINVID","HOLDINGNATURE","CURRENCYALT_KEY","CURRENCYCONVRATE","BOOKTYPE","BOOKVALUE","BOOKVALUEINR","MTMVALUE","MTMVALUEINR","ENCUMBEREDMTM","ASSETCLASS_ALTKEY","NPIDT","TOTALPROVISON","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","DBTDATE","LATESTBSDATE","INTEREST_DIVIDENDDUEDATE","INTEREST_DIVIDENDDUEAMOUNT","PARTIALREDUMPTIONDUEDATE","PARTIALREDUMPTIONSETTLEDY_N","FLGDEG","DEGREASON","DPD","FLGUPG","UPGDATE","PROVISIONALT_KEY","INITIALASSETALT_KEY","INITIALNPIDT","REFISSUERID","DPD_MATURITY","DPD_DIVOVERDUE","FINALASSETCLASSALT_KEY","PARTIALREDUMPTIONDPD","ASSET_NORM","BALANCESHEETDATE","LISTEDSHARES","DPD_BS_DATE","ISIN","ASSETCLASS","GL_CODE","GL_DESCRIPTION","OVERDUE_AMOUNT","FLGSMA","SMA_DT","SMA_CLASS","SMA_REASON","ADDLPROVISION","ADDLPROVISIONPER","MOCBY","MOC_DATE","FLGMOC","MOC_REASON" 
     FROM CurDat_RBL_MISDB_PROD.InvestmentFinancialDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84756,'--------------------------------------',15,15,0,0,928,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_tables.id
  AND md_tables.schema_id_fk            = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84757,'--------------------------------------',10,10,16384,0,601,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_projects
  WHERE md_schemas.catalog_id_fk   = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84758,'--------------------------------------',13,13,16384,0,767,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_projects
  WHERE md_tables.schema_id_fk     = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84759,'--------------------------------------',9,9,16384,0,506,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name
  FROM md_projects ,
    md_connections,
    md_catalogs
  WHERE md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk   = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84760,'--------------------------------------',8,8,16384,0,396,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    MD_CONNECTIONS.ID CONNECTION_ID ,
    MD_CONNECTIONS.NAME CONNECTION_NAME,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl
  FROM md_projects,
    md_connections
  WHERE MD_CONNECTIONS.PROJECT_ID_FK = MD_PROJECTS.ID
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84761,'--------------------------------------',15,15,0,0,921,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_views.id
  AND md_views.schema_id_fk             = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84762,'--------------------------------------',14,14,0,0,881,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name ,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_stored_programs.id stored_program_id ,
    md_stored_programs.programtype programtype ,
    md_stored_programs.name stored_program_name,
    md_stored_programs.package_id_fk package_id_fk
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_stored_programs
  WHERE md_stored_programs.schema_id_fk = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84763,'--------------------------------------',13,13,16384,0,753,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views
  WHERE md_views.schema_id_fk      = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84778,'--------------------------------------',16,16,0,0,562,'SELECT ''MD_CATALOGS'' objtype, cat.catalog_name objname, cat.id objid,  ''MD_CATALOGS'' MainObjType,cat.catalog_name MAINOBJNAME, cat.id MAINOBJID,null SchemaName,null schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name ELSE NULL END QualifiedName
FROM  MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE  cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84779,'--------------------------------------',16,16,0,0,594,'SELECT ''MD_SCHEMAS'' objtype, s.name objname, s.id objid,  ''MD_SCHEMAS'' MainObjType,s.name MAINOBJNAME, s.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name QualifiedName
FROM MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84780,'--------------------------------------',16,16,0,0,729,'SELECT ''MD_TABLES'' objtype, t.table_name objname, t.id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN   md_meta.quote(cat.catalog_name,s.name,t.table_name,conn.id)
                            ELSE   s.name || ''.'' || t.table_name END QualifiedName
FROM MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84781,'--------------------------------------',16,16,0,0,779,'SELECT ''MD_PARTITIONS'' objtype, ''PARTTITION_EXP'' objname, t.id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN   md_meta.quote(cat.catalog_name,s.name,t.table_name,conn.id)
                            ELSE   s.name || ''.'' || t.table_name END QualifiedName
FROM MD_PARTITIONS p, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE p.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84782,'--------------------------------------',16,16,0,0,669,'SELECT ''MD_STORED_PROGRAMS'' objtype,p.name objname, p.Id objid,  ''MD_STORED_PROGRAMS'' MainObjType,p.name MAINOBJNAME,p.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||p.name  QualifiedName
FROM MD_STORED_PROGRAMS p,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE p.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84783,'--------------------------------------',16,16,0,0,655,'SELECT ''MD_VIEWS'' objtype, v.view_name objname, v.Id objid,  ''MD_VIEWS'' MainObjType,v.view_name MAINOBJNAME,v.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||v.view_name  QualifiedName
FROM MD_VIEWS v,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE v.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84784,'--------------------------------------',16,16,0,0,723,'SELECT ''MD_COLUMNS'' objtype, c.COLUMN_NAME objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.COLUMN_NAME QualifiedName
FROM MD_COLUMNS c, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84785,'--------------------------------------',16,16,0,0,717,'SELECT ''MD_CONSTRAINTS'' objtype, c.name objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.name QualifiedName
FROM MD_CONSTRAINTS c, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84786,'--------------------------------------',16,16,0,0,700,'SELECT ''MD_INDEXES'' objtype,i.index_name objname, i.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME,t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid, proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||i.index_name  QualifiedName
FROM MD_INDEXES i, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn,MD_PROJECTS proj
WHERE i.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84787,'--------------------------------------',16,16,0,0,1483,'SELECT ''MD_TRIGGERS'' objtype,trig.trigger_name objname, trig.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME,t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||trig.trigger_name  QualifiedName
FROM MD_TRIGGERS trig, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE trig.table_or_view_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id 
UNION ALL
SELECT ''MD_TRIGGERS'' objtype,trig.trigger_name objname, trig.Id objid,  ''MD_VIEWS'' MainObjType,v.view_name MAINOBJNAME,v.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||trig.trigger_name  QualifiedName
FROM MD_TRIGGERS trig, MD_VIEWS v,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE trig.table_or_view_id_fk = v.id
AND v.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id 
ORDER BY objid');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84788,'--------------------------------------',16,16,0,0,2469,'SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CATALOG_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_SCHEMA_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TABLES_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_COLUMN_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CONSTRAINTS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_INDEX_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TRIGGER_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_VIEW_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PROGRAMS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PARTITIONS_DETAILS');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84789,'--------------------------------------',18,18,264192,0,1143,'SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME", p.native_sql,p.linecount 
FROM md_stored_programs p , mgv_all_programs_details d
WHERE p.id = d.objid
AND d.capturedorconverted = ''CAPTURED''
UNION ALL
SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME",v.native_sql,v.linecount
FROM md_views v , mgv_all_view_details d
WHERE v.id = d.objid
AND d.capturedorconverted = ''CAPTURED''
UNION ALL
SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME" ,t.native_sql,t.linecount
FROM md_triggers t , mgv_all_trigger_details d
WHERE t.id = d.objid
AND d.capturedorconverted = ''CAPTURED''');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (84790,'--------------------------------------',18,18,0,0,879,'SELECT ''MD_COLUMNS'' objtype, c.COLUMN_NAME objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname ,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.COLUMN_NAME QualifiedName,
c.column_type datatype,
CASE WHEN p.PROP_KEY=''SEEDVALUE'' THEN ''Y'' ELSE ''N'' END IsIdentity
FROM MD_COLUMNS c LEFT OUTER JOIN MD_ADDITIONAL_PROPERTIES p ON c.id =p.ref_id_fk
, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn,MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79130,'--------------------------------------',21,21,0,0,390,'SELECT "ENTITYKEY","ACCOUNTENTITYID","CREDITCARDENTITYID","BALANCE_POS","BALANCE_LOAN","BALANCE_INT","BALANCE_GST","BALANCE_FEES","REFSYSTEMACID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","MOCSTATUS","MOCDATE" 
     FROM CurDat_RBL_MISDB_PROD.AdvCreditCardBalanceDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87220,'--------------------------------------',10,10,16384,0,601,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_projects
  WHERE md_schemas.catalog_id_fk   = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87221,'--------------------------------------',13,13,16384,0,767,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_projects
  WHERE md_tables.schema_id_fk     = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87222,'--------------------------------------',9,9,16384,0,506,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name
  FROM md_projects ,
    md_connections,
    md_catalogs
  WHERE md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk   = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87223,'--------------------------------------',8,8,16384,0,396,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    MD_CONNECTIONS.ID CONNECTION_ID ,
    MD_CONNECTIONS.NAME CONNECTION_NAME,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl
  FROM md_projects,
    md_connections
  WHERE MD_CONNECTIONS.PROJECT_ID_FK = MD_PROJECTS.ID
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87224,'--------------------------------------',15,15,0,0,921,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_views.id
  AND md_views.schema_id_fk             = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87225,'--------------------------------------',14,14,0,0,881,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name ,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_stored_programs.id stored_program_id ,
    md_stored_programs.programtype programtype ,
    md_stored_programs.name stored_program_name,
    md_stored_programs.package_id_fk package_id_fk
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_stored_programs
  WHERE md_stored_programs.schema_id_fk = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87226,'--------------------------------------',13,13,16384,0,753,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views
  WHERE md_views.schema_id_fk      = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87241,'--------------------------------------',16,16,0,0,562,'SELECT ''MD_CATALOGS'' objtype, cat.catalog_name objname, cat.id objid,  ''MD_CATALOGS'' MainObjType,cat.catalog_name MAINOBJNAME, cat.id MAINOBJID,null SchemaName,null schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name ELSE NULL END QualifiedName
FROM  MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE  cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87242,'--------------------------------------',16,16,0,0,594,'SELECT ''MD_SCHEMAS'' objtype, s.name objname, s.id objid,  ''MD_SCHEMAS'' MainObjType,s.name MAINOBJNAME, s.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name QualifiedName
FROM MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79123,'--------------------------------------',176,176,264192,0,2817,'SELECT "ENTITYKEY","ACCOUNTENTITYID","UCIFENTITYID","CUSTOMERENTITYID","CUSTOMERACID","REFCUSTOMERID","SOURCESYSTEMCUSTOMERID","UCIF_ID","BRANCHCODE","FACILITYTYPE","ACOPENDT","FIRSTDTOFDISB","PRODUCTALT_KEY","SCHEMEALT_KEY","SUBSECTORALT_KEY","SPLCATG1ALT_KEY","SPLCATG2ALT_KEY","SPLCATG3ALT_KEY","SPLCATG4ALT_KEY","SOURCEALT_KEY","ACTSEGMENTCODE","INTTRATE","BALANCE","BALANCEINCRNCY","CURRENCYALT_KEY","DRAWINGPOWER","CURRENTLIMIT","CURRENTLIMITDT","CONTIEXCESSDT","STOCKSTDT","DEBITSINCEDT","LASTCRDATE","INTTSERVICED","INTNOTSERVICEDDT","OVERDUEAMT","OVERDUESINCEDT","REVIEWDUEDT","SECURITYVALUE","DFVAMT","GOVTGTYAMT","COVERGOVGUR","WRITEOFFAMOUNT","UNADJSUBSIDY","CREDITSINCEDT","DEGREASON","ASSET_NORM","REFPERIODMAX","REFPERIODOVERDUE","REFPERIODOVERDRAWN","REFPERIODNOCREDIT","REFPERIODINTSERVICE","REFPERIODSTKSTATEMENT","REFPERIODREVIEW","NETBALANCE","APPRRV","SECUREDAMT","UNSECUREDAMT","PROVDFV","PROVSECURED","PROVUNSECURED","PROVCOVERGOVGUR","ADDLPROVISION","TOTALPROVISION","BANKPROVSECURED","BANKPROVUNSECURED","BANKTOTALPROVISION","RBIPROVSECURED","RBIPROVUNSECURED","RBITOTALPROVISION","INITIALNPADT","FINALNPADT","SMA_DT","UPGDATE","INITIALASSETCLASSALT_KEY","FINALASSETCLASSALT_KEY","PROVISIONALT_KEY","PNPA_REASON","SMA_CLASS","SMA_REASON","FLGMOC","MOC_DT","COMMONMOCTYPEALT_KEY","FLGDEG","FLGDIRTYROW","FLGINMONTH","FLGSMA","FLGPNPA","FLGUPG","FLGFITL","FLGABINITIO","NPA_DAYS","REFPERIODOVERDUEUPG","REFPERIODOVERDRAWNUPG","REFPERIODNOCREDITUPG","REFPERIODINTSERVICEUPG","REFPERIODSTKSTATEMENTUPG","REFPERIODREVIEWUPG","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","APPGOVGUR","USEDRV","COMPUTEDCLAIM","UPG_RELAX_MSME","DEG_RELAX_MSME","PNPA_DATE","NPA_REASON","PNPAASSETCLASSALT_KEY","DISBAMOUNT","PRINCOUTSTD","PRINCOVERDUE","PRINCOVERDUESINCEDT","INTOVERDUE","INTOVERDUESINCEDT","OTHEROVERDUE","OTHEROVERDUESINCEDT","RELATIONSHIPNUMBER","ACCOUNTFLAG","COMMERCIALFLAG_ALTKEY","LIABILITY","CD","ACCOUNTSTATUS","ACCOUNTBLKCODE1","ACCOUNTBLKCODE2","EXPOSURETYPE","MTM_VALUE","BANKASSETCLASS","NPATYPE","SECAPP","BORROWERTYPEID","LINECODE","PROVPERSECURED","PROVPERUNSECURED","MOCREASON","ADDLPROVISIONPER","FLGINFRA","REPOSSESSIONDATE","DERECOGNISEDINTEREST1","DERECOGNISEDINTEREST2","PRODUCTCODE","FLGLCBG","UNSERVIEDINT","PREQTRCREDIT","PRVQTRINT","CURQTRCREDIT","CURQTRINT","ORIGINALBRANCHCODE","ADVANCERECOVERY","NOTIONALINTTAMT","PRVASSETCLASSALT_KEY","MOCTYPE","FLGSECURED","REPOSSESSION","RCPENDING","PAYMENTPENDING","WHEELCASE","CUSTOMERLEVELMAXPER","FINALPROVISIONPER","ISIBPC","ISSECURITISED","RFA","ISNONCOOPERATIVE","SARFAESI","WEAKACCOUNT","PUI","FLGFRAUD","FLGRESTRUCTURE","RESTRUCTUREDATE","SARFAESIDATE","FLGUNUSUALBOUNCE","UNUSUALBOUNCEDATE","FLGUNCLEAREDEFFECT","UNCLEAREDEFFECTDATE","FRAUDDATE","WEAKACCOUNTDATE","SCREENFLAG","CHANGEFIELD" 
     FROM MAIN_PRO.AccountCal_Main');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86616,'--------------------------------------',18,18,0,0,879,'SELECT ''MD_COLUMNS'' objtype, c.COLUMN_NAME objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname ,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.COLUMN_NAME QualifiedName,
c.column_type datatype,
CASE WHEN p.PROP_KEY=''SEEDVALUE'' THEN ''Y'' ELSE ''N'' END IsIdentity
FROM MD_COLUMNS c LEFT OUTER JOIN MD_ADDITIONAL_PROPERTIES p ON c.id =p.ref_id_fk
, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn,MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86617,'--------------------------------------',32,32,0,0,1252,'select d1.catalogid capcatalogid,
   d1.catalogname capcatalogname,
   d1.connid capconnid,
   d1.connname capconnname,
   d1.mainobjid capmainobjid,
   d1.mainobjname capmainobjname,
   d1.mainobjtype capmainobjtype ,
   d1.objid capobjid,
   d1.objname capobjname,
   d1.objtype capobjtype,
   d1.projectid capprojectid,
   d1.projectname capprojectname,
   d1.qualifiedname capqualifiedname,
   d1.schemaid capschemaid,
   d1.schemaname capschemaname,
   d2.catalogid concatalogid,
   d2.catalogname concatalogname,
   d2.connid conconnid,
   d2.connname conconnname,
   d2.mainobjid conmainobjid,
   d2.mainobjname conmainobjname,
   d2.mainobjtype conmainobjtype ,
   d2.objid conobjid,
   d2.objname conobjname,
   d2.objtype conobjtype,
   d2.projectid conprojectid,
   d2.projectname conprojectname,
   d2.qualifiedname conqualifiedname,
   d2.schemaid conschemaid,
   d2.schemaname conschemaname,
    der.derivative_reason,
    der.transformed
  FROM mgv_all_details d1
  LEFT OUTER JOIN md_derivatives der
  ON der.src_id              = d1.objid
  AND der.derivative_reason IS NULL
  LEFT OUTER JOIN mgv_all_details d2
  ON der.derived_id            = d2.objid
  WHERE d1.capturedorconverted = ''CAPTURED''
  AND der.derivative_reason   IS NULL');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86618,'--------------------------------------',17,17,0,0,366,'SELECT "ID","SRC_ID","SRC_TYPE","DERIVED_ID","DERIVED_TYPE","DERIVED_CONNECTION_ID_FK","TRANSFORMED","ORIGINAL_IDENTIFIER","NEW_IDENTIFIER","DERIVED_OBJECT_NAMESPACE","DERIVATIVE_REASON","SECURITY_GROUP_ID","CREATED_ON","CREATED_BY","LAST_UPDATED_ON","LAST_UPDATED_BY","ENABLED" FROM MD_DERIVATIVES WHERE (Derivative_Reason <> ''SCRATCH'' OR DERIVative_Reason IS NULL)');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86619,'--------------------------------------',17,17,0,0,334,'SELECT "ID","SRC_ID","SRC_TYPE","DERIVED_ID","DERIVED_TYPE","DERIVED_CONNECTION_ID_FK","TRANSFORMED","ORIGINAL_IDENTIFIER","NEW_IDENTIFIER","DERIVED_OBJECT_NAMESPACE","DERIVATIVE_REASON","SECURITY_GROUP_ID","CREATED_ON","CREATED_BY","LAST_UPDATED_ON","LAST_UPDATED_BY","ENABLED" FROM MD_DERIVATIVES WHERE Derivative_Reason = ''SCRATCH''');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87079,'--------------------------------------',15,15,0,0,928,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_tables.id
  AND md_tables.schema_id_fk            = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79124,'--------------------------------------',30,30,0,0,470,'SELECT "ENTITYKEY","BRANCHCODE","CUSTOMERID","CUSTOMERACID","ACCOUNTENTITYID","TXNDATE","TXNTYPE","TXNSUBTYPE","TXNTIME","CURRENCYALT_KEY","CURRENCYCONVRATE","TXNAMOUNT","TXNAMOUNTINCURRENCY","EXTDATE","TXNREFNO","TXNVALUEDATE","MNEMONICCODE","PARTICULAR","AUTHORISATIONSTATUS","CREATEDBY","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","D2KTIMESTAMP","REMARK","TRUECREDIT","ISPROCESSED","BALANCE" 
     FROM CURDAT_RBL_MISDB_PROD.AcDailyTxnDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87080,'--------------------------------------',10,10,16384,0,601,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_projects
  WHERE md_schemas.catalog_id_fk   = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87081,'--------------------------------------',13,13,16384,0,767,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_projects
  WHERE md_tables.schema_id_fk     = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87082,'--------------------------------------',9,9,16384,0,506,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name
  FROM md_projects ,
    md_connections,
    md_catalogs
  WHERE md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk   = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87083,'--------------------------------------',8,8,16384,0,396,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    MD_CONNECTIONS.ID CONNECTION_ID ,
    MD_CONNECTIONS.NAME CONNECTION_NAME,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl
  FROM md_projects,
    md_connections
  WHERE MD_CONNECTIONS.PROJECT_ID_FK = MD_PROJECTS.ID
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87084,'--------------------------------------',15,15,0,0,921,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_views.id
  AND md_views.schema_id_fk             = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87085,'--------------------------------------',14,14,0,0,881,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name ,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_stored_programs.id stored_program_id ,
    md_stored_programs.programtype programtype ,
    md_stored_programs.name stored_program_name,
    md_stored_programs.package_id_fk package_id_fk
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_stored_programs
  WHERE md_stored_programs.schema_id_fk = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87086,'--------------------------------------',13,13,16384,0,753,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views
  WHERE md_views.schema_id_fk      = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87219,'--------------------------------------',15,15,0,0,928,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_tables.id
  AND md_tables.schema_id_fk            = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (79125,'--------------------------------------',46,46,0,0,789,'SELECT "ENTITYKEY","ACCOUNTENTITYID","ASSETCLASSALT_KEY","BALANCEINCURRENCY","BALANCE","SIGNBALANCE","LASTCRDT","OVERDUE","TOTALPROV","REFCUSTOMERID","REFSYSTEMACID","AUTHORISATIONSTATUS","EFFECTIVEFROMTIMEKEY","EFFECTIVETOTIMEKEY","OVERDUESINCEDT","MOCSTATUS","MOCDATE","MOCTYPEALT_KEY","OLD_OVERDUESINCEDT","OLD_OVERDUE","ORG_TOTALPROV","INTREVERSEAMT","UNAPPLIEDINTAMOUNT","PS_BALANCE","NPS_BALANCE","DATECREATED","MODIFIEDBY","DATEMODIFIED","APPROVEDBY","DATEAPPROVED","CREATEDBY","UPGRADEDATE","OVERDUEPRINCIPAL","NOTIONALINTTAMT","PRINCIPALBALANCE","OVERDUEINTEREST","ADVANCERECOVERY","PS_NPS_FLAG","DFVAMT","INTERESTRECEIVABLE","OVERDUEPRINCIPALDT","OVERDUEINTDT","OVEROTHERDUE","OVERDUEOTHERDT","SOURCEASSETCLASS","SOURCENPADATE" 
     FROM CurDat_RBL_MISDB_PROD.AdvAcBalanceDetail');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86582,'--------------------------------------',15,15,0,0,928,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_tables.id
  AND md_tables.schema_id_fk            = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86583,'--------------------------------------',10,10,16384,0,601,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_projects
  WHERE md_schemas.catalog_id_fk   = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86584,'--------------------------------------',13,13,16384,0,767,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_projects
  WHERE md_tables.schema_id_fk     = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86585,'--------------------------------------',9,9,16384,0,506,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name
  FROM md_projects ,
    md_connections,
    md_catalogs
  WHERE md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk   = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86586,'--------------------------------------',8,8,16384,0,396,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    MD_CONNECTIONS.ID CONNECTION_ID ,
    MD_CONNECTIONS.NAME CONNECTION_NAME,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl
  FROM md_projects,
    md_connections
  WHERE MD_CONNECTIONS.PROJECT_ID_FK = MD_PROJECTS.ID
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86587,'--------------------------------------',15,15,0,0,921,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_views.id
  AND md_views.schema_id_fk             = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86588,'--------------------------------------',14,14,0,0,881,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name ,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_stored_programs.id stored_program_id ,
    md_stored_programs.programtype programtype ,
    md_stored_programs.name stored_program_name,
    md_stored_programs.package_id_fk package_id_fk
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_stored_programs
  WHERE md_stored_programs.schema_id_fk = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86589,'--------------------------------------',13,13,16384,0,753,'SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views
  WHERE md_views.schema_id_fk      = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86604,'--------------------------------------',16,16,0,0,562,'SELECT ''MD_CATALOGS'' objtype, cat.catalog_name objname, cat.id objid,  ''MD_CATALOGS'' MainObjType,cat.catalog_name MAINOBJNAME, cat.id MAINOBJID,null SchemaName,null schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name ELSE NULL END QualifiedName
FROM  MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE  cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86605,'--------------------------------------',16,16,0,0,594,'SELECT ''MD_SCHEMAS'' objtype, s.name objname, s.id objid,  ''MD_SCHEMAS'' MainObjType,s.name MAINOBJNAME, s.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name QualifiedName
FROM MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86606,'--------------------------------------',16,16,0,0,729,'SELECT ''MD_TABLES'' objtype, t.table_name objname, t.id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN   md_meta.quote(cat.catalog_name,s.name,t.table_name,conn.id)
                            ELSE   s.name || ''.'' || t.table_name END QualifiedName
FROM MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86607,'--------------------------------------',16,16,0,0,779,'SELECT ''MD_PARTITIONS'' objtype, ''PARTTITION_EXP'' objname, t.id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN   md_meta.quote(cat.catalog_name,s.name,t.table_name,conn.id)
                            ELSE   s.name || ''.'' || t.table_name END QualifiedName
FROM MD_PARTITIONS p, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE p.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86608,'--------------------------------------',16,16,0,0,669,'SELECT ''MD_STORED_PROGRAMS'' objtype,p.name objname, p.Id objid,  ''MD_STORED_PROGRAMS'' MainObjType,p.name MAINOBJNAME,p.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||p.name  QualifiedName
FROM MD_STORED_PROGRAMS p,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE p.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86609,'--------------------------------------',16,16,0,0,655,'SELECT ''MD_VIEWS'' objtype, v.view_name objname, v.Id objid,  ''MD_VIEWS'' MainObjType,v.view_name MAINOBJNAME,v.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||v.view_name  QualifiedName
FROM MD_VIEWS v,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE v.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86610,'--------------------------------------',16,16,0,0,723,'SELECT ''MD_COLUMNS'' objtype, c.COLUMN_NAME objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.COLUMN_NAME QualifiedName
FROM MD_COLUMNS c, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86611,'--------------------------------------',16,16,0,0,717,'SELECT ''MD_CONSTRAINTS'' objtype, c.name objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.name QualifiedName
FROM MD_CONSTRAINTS c, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (86612,'--------------------------------------',16,16,0,0,700,'SELECT ''MD_INDEXES'' objtype,i.index_name objname, i.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME,t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid, proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||i.index_name  QualifiedName
FROM MD_INDEXES i, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn,MD_PROJECTS proj
WHERE i.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87250,'--------------------------------------',16,16,0,0,1483,'SELECT ''MD_TRIGGERS'' objtype,trig.trigger_name objname, trig.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME,t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||trig.trigger_name  QualifiedName
FROM MD_TRIGGERS trig, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE trig.table_or_view_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id 
UNION ALL
SELECT ''MD_TRIGGERS'' objtype,trig.trigger_name objname, trig.Id objid,  ''MD_VIEWS'' MainObjType,v.view_name MAINOBJNAME,v.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||trig.trigger_name  QualifiedName
FROM MD_TRIGGERS trig, MD_VIEWS v,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn, MD_PROJECTS proj
WHERE trig.table_or_view_id_fk = v.id
AND v.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id 
ORDER BY objid');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87251,'--------------------------------------',16,16,0,0,2469,'SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CATALOG_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_SCHEMA_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TABLES_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_COLUMN_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CONSTRAINTS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_INDEX_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TRIGGER_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_VIEW_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PROGRAMS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PARTITIONS_DETAILS');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87252,'--------------------------------------',18,18,264192,0,1143,'SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME", p.native_sql,p.linecount 
FROM md_stored_programs p , mgv_all_programs_details d
WHERE p.id = d.objid
AND d.capturedorconverted = ''CAPTURED''
UNION ALL
SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME",v.native_sql,v.linecount
FROM md_views v , mgv_all_view_details d
WHERE v.id = d.objid
AND d.capturedorconverted = ''CAPTURED''
UNION ALL
SELECT d."OBJTYPE",d."OBJNAME",d."OBJID",d."MAINOBJTYPE",d."MAINOBJNAME",d."MAINOBJID",d."SCHEMANAME",d."SCHEMAID",d."CATALOGNAME",d."CATALOGID",d."CONNNAME",d."CONNID",d."PROJECTNAME",d."PROJECTID",d."CAPTUREDORCONVERTED",d."QUALIFIEDNAME" ,t.native_sql,t.linecount
FROM md_triggers t , mgv_all_trigger_details d
WHERE t.id = d.objid
AND d.capturedorconverted = ''CAPTURED''');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87253,'--------------------------------------',18,18,0,0,879,'SELECT ''MD_COLUMNS'' objtype, c.COLUMN_NAME objname, c.Id objid,  ''MD_TABLES'' MainObjType,t.table_name MAINOBJNAME, t.id MAINOBJID, s.name SchemaName, s.id schemaid, cat.catalog_name catalogname,cat.id catalogid, conn.name connname,conn.id  connid,proj.project_name projectname ,proj.id projectid,
NVL(conn.type,''CAPTURED'') CapturedOrConverted, 
CASE WHEN conn.type IS NULL THEN cat.catalog_name||''.'' ELSE '''' END || s.name||''.''||t.table_name ||''.''||c.COLUMN_NAME QualifiedName,
c.column_type datatype,
CASE WHEN p.PROP_KEY=''SEEDVALUE'' THEN ''Y'' ELSE ''N'' END IsIdentity
FROM MD_COLUMNS c LEFT OUTER JOIN MD_ADDITIONAL_PROPERTIES p ON c.id =p.ref_id_fk
, MD_TABLES t,MD_SCHEMAS s, MD_CATALOGS cat,MD_CONNECTIONS conn,MD_PROJECTS proj
WHERE c.table_id_fk = t.id
AND t.schema_id_fk = s.id
AND s.catalog_id_fk = cat.id
AND cat.connection_id_fk = conn.id
AND conn.PROJECT_ID_FK = proj.id');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87254,'--------------------------------------',32,32,0,0,1252,'select d1.catalogid capcatalogid,
   d1.catalogname capcatalogname,
   d1.connid capconnid,
   d1.connname capconnname,
   d1.mainobjid capmainobjid,
   d1.mainobjname capmainobjname,
   d1.mainobjtype capmainobjtype ,
   d1.objid capobjid,
   d1.objname capobjname,
   d1.objtype capobjtype,
   d1.projectid capprojectid,
   d1.projectname capprojectname,
   d1.qualifiedname capqualifiedname,
   d1.schemaid capschemaid,
   d1.schemaname capschemaname,
   d2.catalogid concatalogid,
   d2.catalogname concatalogname,
   d2.connid conconnid,
   d2.connname conconnname,
   d2.mainobjid conmainobjid,
   d2.mainobjname conmainobjname,
   d2.mainobjtype conmainobjtype ,
   d2.objid conobjid,
   d2.objname conobjname,
   d2.objtype conobjtype,
   d2.projectid conprojectid,
   d2.projectname conprojectname,
   d2.qualifiedname conqualifiedname,
   d2.schemaid conschemaid,
   d2.schemaname conschemaname,
    der.derivative_reason,
    der.transformed
  FROM mgv_all_details d1
  LEFT OUTER JOIN md_derivatives der
  ON der.src_id              = d1.objid
  AND der.derivative_reason IS NULL
  LEFT OUTER JOIN mgv_all_details d2
  ON der.derived_id            = d2.objid
  WHERE d1.capturedorconverted = ''CAPTURED''
  AND der.derivative_reason   IS NULL');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87255,'--------------------------------------',17,17,0,0,366,'SELECT "ID","SRC_ID","SRC_TYPE","DERIVED_ID","DERIVED_TYPE","DERIVED_CONNECTION_ID_FK","TRANSFORMED","ORIGINAL_IDENTIFIER","NEW_IDENTIFIER","DERIVED_OBJECT_NAMESPACE","DERIVATIVE_REASON","SECURITY_GROUP_ID","CREATED_ON","CREATED_BY","LAST_UPDATED_ON","LAST_UPDATED_BY","ENABLED" FROM MD_DERIVATIVES WHERE (Derivative_Reason <> ''SCRATCH'' OR DERIVative_Reason IS NULL)');
Insert into SYS.VIEW$ (OBJ#,AUDIT$,COLS,INTCOLS,PROPERTY,FLAGS,TEXTLENGTH,TEXT) values (87256,'--------------------------------------',17,17,0,0,334,'SELECT "ID","SRC_ID","SRC_TYPE","DERIVED_ID","DERIVED_TYPE","DERIVED_CONNECTION_ID_FK","TRANSFORMED","ORIGINAL_IDENTIFIER","NEW_IDENTIFIER","DERIVED_OBJECT_NAMESPACE","DERIVATIVE_REASON","SECURITY_GROUP_ID","CREATED_ON","CREATED_BY","LAST_UPDATED_ON","LAST_UPDATED_BY","ENABLED" FROM MD_DERIVATIVES WHERE Derivative_Reason = ''SCRATCH''');
