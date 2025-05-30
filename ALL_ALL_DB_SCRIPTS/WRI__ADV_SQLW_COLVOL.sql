--------------------------------------------------------
--  DDL for Table WRI$_ADV_SQLW_COLVOL
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_ADV_SQLW_COLVOL" SHARING=METADATA 
   (	"WORKLOAD_ID" NUMBER, 
	"TABLE_OWNER#" NUMBER, 
	"TABLE#" NUMBER, 
	"COL#" NUMBER, 
	"UPD_FREQ" NUMBER, 
	"UPD_ROWS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
