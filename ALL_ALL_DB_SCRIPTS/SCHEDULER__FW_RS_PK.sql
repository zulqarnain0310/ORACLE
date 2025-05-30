--------------------------------------------------------
--  DDL for Index SCHEDULER$_FW_RS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_FW_RS_PK" ON "SYS"."SCHEDULER$_FILEWATCHER_RESEND" ("DESTINATION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
