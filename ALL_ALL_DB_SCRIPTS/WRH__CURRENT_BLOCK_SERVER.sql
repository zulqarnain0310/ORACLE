--------------------------------------------------------
--  DDL for Table WRH$_CURRENT_BLOCK_SERVER
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_CURRENT_BLOCK_SERVER" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"PIN1" NUMBER, 
	"PIN10" NUMBER, 
	"PIN100" NUMBER, 
	"PIN1000" NUMBER, 
	"PIN10000" NUMBER, 
	"FLUSH1" NUMBER, 
	"FLUSH10" NUMBER, 
	"FLUSH100" NUMBER, 
	"FLUSH1000" NUMBER, 
	"FLUSH10000" NUMBER, 
	"WRITE1" NUMBER, 
	"WRITE10" NUMBER, 
	"WRITE100" NUMBER, 
	"WRITE1000" NUMBER, 
	"WRITE10000" NUMBER, 
	"CON_DBID" NUMBER DEFAULT 0, 
	"PIN0" NUMBER, 
	"FLUSH0" NUMBER, 
	"PER_PDB" NUMBER DEFAULT null
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT DELETE ON "SYS"."WRH$_CURRENT_BLOCK_SERVER" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRH$_CURRENT_BLOCK_SERVER" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRH$_CURRENT_BLOCK_SERVER" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRH$_CURRENT_BLOCK_SERVER" TO "SYSUMF_ROLE";
