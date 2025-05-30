--------------------------------------------------------
--  DDL for Index I_CHNFDIRECTLOAD$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_CHNFDIRECTLOAD$" ON "SYS"."CHNFDIRECTLOAD$" ("TABLEOBJ#", "XID", "LOWROWID", "HIGHROWID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
