--------------------------------------------------------
--  DDL for Table WRR$_WORKLOAD_SESSIONS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_WORKLOAD_SESSIONS" SHARING=METADATA 
   (	"GID" NUMBER(*,0), 
	"TIME" NUMBER, 
	"VAL" NUMBER(*,0), 
	"INST_ID" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
