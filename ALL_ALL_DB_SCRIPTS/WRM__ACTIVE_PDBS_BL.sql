--------------------------------------------------------
--  DDL for Table WRM$_ACTIVE_PDBS_BL
--------------------------------------------------------

  CREATE TABLE "SYS"."WRM$_ACTIVE_PDBS_BL" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"PDBID" NUMBER, 
	"CON_DBID" NUMBER, 
	"TYPE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
