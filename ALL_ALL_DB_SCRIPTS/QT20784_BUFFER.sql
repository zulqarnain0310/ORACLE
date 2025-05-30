--------------------------------------------------------
--  DDL for View QT20784_BUFFER
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYS"."QT20784_BUFFER" ("ADDR", "INDX", "INST_ID", "OBJNO", "QUEUE_ID", "MSGID", "CORRID", "SEQUENCE_NUM", "MSG_NUM", "STATE", "PRIORITY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_USER_NAME", "RETRY_COUNT", "SENDER_NAME", "SENDER_ADDRESS", "SENDER_PROTOCOL", "DEQUEUE_MSGID", "SRCSEQUENCE_NUM", "SUBSCRIBER_ID", "EXCEPTIONQ_SCHEMA", "EXCEPTIONQ_NAME") AS 
  SELECT  ADDR, INDX, INST_ID, OBJNO, QUEUE_ID, MSGID, CORRID,  SEQUENCE_NUM, MSG_NUM, STATE, PRIORITY, EXPIRATION,  ENQ_TIME, ENQ_UID, ENQ_USER_NAME, RETRY_COUNT, SENDER_NAME,  SENDER_ADDRESS, SENDER_PROTOCOL, DEQUEUE_MSGID,  SRCSEQUENCE_NUM, SUBSCRIBER_ID, EXCEPTIONQ_SCHEMA,  EXCEPTIONQ_NAME  FROM X$BUFFER2 x WHERE objno = 20784
;
  GRANT SELECT ON "SYS"."QT20784_BUFFER" TO "GSMADMIN_INTERNAL";
