--------------------------------------------------------
--  DDL for Table WRH$_SYSSTAT_BL
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_SYSSTAT_BL" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"STAT_ID" NUMBER, 
	"VALUE" NUMBER, 
	"CON_DBID" NUMBER, 
	"PER_PDB" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
