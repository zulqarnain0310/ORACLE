REM INSERTING into SYS.SCHEDULER$_SCHEDULE
SET DEFINE OFF;
Insert into SYS.SCHEDULER$_SCHEDULE (OBJ#,RECURRENCE_EXPR,QUEUE_OWNER,QUEUE_NAME,QUEUE_AGENT,REFERENCE_DATE,END_DATE,COMMENTS,FLAGS,MAX_COUNT,FW_NAME) values (19624,'freq=daily;byhour=3;byminute=0;bysecond=0',null,null,null,null,null,null,0,null,null);
Insert into SYS.SCHEDULER$_SCHEDULE (OBJ#,RECURRENCE_EXPR,QUEUE_OWNER,QUEUE_NAME,QUEUE_AGENT,REFERENCE_DATE,END_DATE,COMMENTS,FLAGS,MAX_COUNT,FW_NAME) values (19627,'FREQ=MINUTELY;INTERVAL=10',null,null,null,null,null,null,0,null,null);
Insert into SYS.SCHEDULER$_SCHEDULE (OBJ#,RECURRENCE_EXPR,QUEUE_OWNER,QUEUE_NAME,QUEUE_AGENT,REFERENCE_DATE,END_DATE,COMMENTS,FLAGS,MAX_COUNT,FW_NAME) values (19632,'FREQ=DAILY; BYHOUR=02; BYMINUTE=0; BYSECOND=0',null,null,null,null,null,null,0,null,null);
Insert into SYS.SCHEDULER$_SCHEDULE (OBJ#,RECURRENCE_EXPR,QUEUE_OWNER,QUEUE_NAME,QUEUE_AGENT,REFERENCE_DATE,END_DATE,COMMENTS,FLAGS,MAX_COUNT,FW_NAME) values (20406,'FREQ=WEEKLY',null,null,null,to_timestamp_tz('02-JUN-19 12.00.00.000000000 AM -06:00','DD-MON-RR HH.MI.SSXFF AM TZR'),null,'Pre-defined schedule for computing moving window baseline statistics',0,null,null);
