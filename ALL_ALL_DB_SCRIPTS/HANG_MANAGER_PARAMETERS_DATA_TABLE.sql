REM INSERTING into SYS.HANG_MANAGER_PARAMETERS
SET DEFINE OFF;
Insert into SYS.HANG_MANAGER_PARAMETERS (NAME,CURRENT_VALUE,CURRENT_TIME,PREVIOUS_VALUE,PREVIOUS_TIME) values ('resolution scope','INSTANCE',to_date('30-MAY-19','DD-MON-RR'),'INSTANCE',to_date('30-MAY-19','DD-MON-RR'));
Insert into SYS.HANG_MANAGER_PARAMETERS (NAME,CURRENT_VALUE,CURRENT_TIME,PREVIOUS_VALUE,PREVIOUS_TIME) values ('sensitivity','NORMAL',to_date('30-MAY-19','DD-MON-RR'),'NORMAL',to_date('30-MAY-19','DD-MON-RR'));
Insert into SYS.HANG_MANAGER_PARAMETERS (NAME,CURRENT_VALUE,CURRENT_TIME,PREVIOUS_VALUE,PREVIOUS_TIME) values ('base file size limit','100000000',to_date('30-MAY-19','DD-MON-RR'),'100000000',to_date('30-MAY-19','DD-MON-RR'));
Insert into SYS.HANG_MANAGER_PARAMETERS (NAME,CURRENT_VALUE,CURRENT_TIME,PREVIOUS_VALUE,PREVIOUS_TIME) values ('base file set count','5',to_date('30-MAY-19','DD-MON-RR'),'5',to_date('30-MAY-19','DD-MON-RR'));
Insert into SYS.HANG_MANAGER_PARAMETERS (NAME,CURRENT_VALUE,CURRENT_TIME,PREVIOUS_VALUE,PREVIOUS_TIME) values ('long waiting session file size limit','100000000',to_date('30-MAY-19','DD-MON-RR'),'100000000',to_date('30-MAY-19','DD-MON-RR'));
Insert into SYS.HANG_MANAGER_PARAMETERS (NAME,CURRENT_VALUE,CURRENT_TIME,PREVIOUS_VALUE,PREVIOUS_TIME) values ('long waiting session file set count','5',to_date('30-MAY-19','DD-MON-RR'),'5',to_date('30-MAY-19','DD-MON-RR'));
