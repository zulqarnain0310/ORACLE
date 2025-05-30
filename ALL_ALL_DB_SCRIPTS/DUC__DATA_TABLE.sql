REM INSERTING into SYS.DUC$
SET DEFINE OFF;
Insert into SYS.DUC$ (OWNER,PACK,PROC,FIELD1,OPERATION#,SEQ,COM) values ('SYS','PRVT_ADVISOR','DELETE_USER_TASKS',0,1,1,'During drop cascade, drop advisor tasks belonging to user');
Insert into SYS.DUC$ (OWNER,PACK,PROC,FIELD1,OPERATION#,SEQ,COM) values ('SYS','DBMS_SQLTUNE_INTERNAL','I_DROP_USER_SQLSETS',0,1,1,'During drop cascade, drop sql tuning sets belonging to user');
Insert into SYS.DUC$ (OWNER,PACK,PROC,FIELD1,OPERATION#,SEQ,COM) values ('SYS','PRVT_WORKLOAD','DELETE_USER_SQLWKLD',0,1,1,'During drop cascade, drop advisor workload tasks belonging to user');
Insert into SYS.DUC$ (OWNER,PACK,PROC,FIELD1,OPERATION#,SEQ,COM) values ('SYS','DBMS_ISNAPSHOT','DROP_USER_SNAPSHOTS',0,1,2,'Drop user snapshot definitions (but not the tables, views, etc.)');
Insert into SYS.DUC$ (OWNER,PACK,PROC,FIELD1,OPERATION#,SEQ,COM) values ('SYS','DBMS_IREFRESH','DROP_USER_GROUPS',0,1,3,'Run during drop user cascade to drop all refresh groups');
Insert into SYS.DUC$ (OWNER,PACK,PROC,FIELD1,OPERATION#,SEQ,COM) values ('SYS','DBMS_REGISTRY_SYS','DROP_USER',0,1,1,'Delete registry entries when schema or invoker is dropped');
Insert into SYS.DUC$ (OWNER,PACK,PROC,FIELD1,OPERATION#,SEQ,COM) values ('SYS','OJDS_CONTEXT','USER_DROPPED',0,1,1,null);
Insert into SYS.DUC$ (OWNER,PACK,PROC,FIELD1,OPERATION#,SEQ,COM) values ('CTXSYS','CTX_ADM','DROP_USER_OBJECTS',0,1,1,'Drops any Text objects for this user');
