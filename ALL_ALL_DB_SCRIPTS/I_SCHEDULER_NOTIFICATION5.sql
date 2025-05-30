--------------------------------------------------------
--  DDL for Index I_SCHEDULER_NOTIFICATION5
--------------------------------------------------------

  CREATE INDEX "SYS"."I_SCHEDULER_NOTIFICATION5" ON "SYS"."SCHEDULER$_NOTIFICATION" ("OWNER", "NOTIFICATION_OWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
