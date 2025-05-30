--------------------------------------------------------
--  DDL for Trigger LOGMNRGGC_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."LOGMNRGGC_TRIGGER" 
BEFORE ddl ON DATABASE
 CALL logmnr_ddl_trigger_proc
/
ALTER TRIGGER "SYS"."LOGMNRGGC_TRIGGER" DISABLE;
