--------------------------------------------------------
--  DDL for Index I_OLAP_MEAS_FOLDER_CONTENTS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_MEAS_FOLDER_CONTENTS$" ON "SYS"."OLAP_MEAS_FOLDER_CONTENTS$" ("MEASURE_FOLDER_OBJ#", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
