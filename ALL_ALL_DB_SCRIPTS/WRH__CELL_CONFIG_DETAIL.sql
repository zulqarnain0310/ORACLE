--------------------------------------------------------
--  DDL for Table WRH$_CELL_CONFIG_DETAIL
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_CELL_CONFIG_DETAIL" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"CON_DBID" NUMBER, 
	"CELLHASH" NUMBER, 
	"CONFTYPE" VARCHAR2(15 BYTE), 
	"CONFVAL_HASH" NUMBER, 
	"PER_PDB" NUMBER DEFAULT null
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT DELETE ON "SYS"."WRH$_CELL_CONFIG_DETAIL" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRH$_CELL_CONFIG_DETAIL" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRH$_CELL_CONFIG_DETAIL" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRH$_CELL_CONFIG_DETAIL" TO "SYSUMF_ROLE";
