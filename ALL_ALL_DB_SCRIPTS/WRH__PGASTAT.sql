--------------------------------------------------------
--  DDL for Table WRH$_PGASTAT
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_PGASTAT" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"NAME" VARCHAR2(64 BYTE), 
	"VALUE" NUMBER, 
	"CON_DBID" NUMBER DEFAULT 0, 
	"PER_PDB" NUMBER DEFAULT null
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT DELETE ON "SYS"."WRH$_PGASTAT" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRH$_PGASTAT" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRH$_PGASTAT" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRH$_PGASTAT" TO "SYSUMF_ROLE";
