--------------------------------------------------------
--  Constraints for Table DBMS_ALERT_INFO
--------------------------------------------------------

  ALTER TABLE "SYS"."DBMS_ALERT_INFO" ADD PRIMARY KEY ("NAME", "SID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
