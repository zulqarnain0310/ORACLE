--------------------------------------------------------
--  DDL for Table WRH$_CELL_IOREASON_BL
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_CELL_IOREASON_BL" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"CELL_HASH" NUMBER, 
	"INCARNATION_NUM" NUMBER, 
	"CON_DBID" NUMBER, 
	"REASON_ID" NUMBER, 
	"REQUESTS" NUMBER, 
	"BYTES" NUMBER, 
	"PER_PDB" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
