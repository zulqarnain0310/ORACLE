--------------------------------------------------------
--  DDL for Table WRM$_PDB_IN_SNAP_BL
--------------------------------------------------------

  CREATE TABLE "SYS"."WRM$_PDB_IN_SNAP_BL" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"CON_DBID" NUMBER, 
	"FLAG" NUMBER, 
	"OPEN_TIME_TZ" TIMESTAMP (3) WITH TIME ZONE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
