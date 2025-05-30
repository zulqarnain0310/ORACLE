--------------------------------------------------------
--  DDL for Table WRH$_DLM_MISC_BL
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_DLM_MISC_BL" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"STATISTIC#" NUMBER, 
	"NAME" VARCHAR2(38 BYTE), 
	"VALUE" NUMBER, 
	"CON_DBID" NUMBER, 
	"PER_PDB" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
