--------------------------------------------------------
--  DDL for Index WRI$_ALERTS_OUTSTANDING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ALERTS_OUTSTANDING_PK" ON "SYS"."WRI$_ALERT_OUTSTANDING" ("CON_ID", "REASON_ID", "OBJECT_ID", "SUBOBJECT_ID", "INTERNAL_INSTANCE_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
