--------------------------------------------------------
--  DDL for Table WRR$_CAPTURE_UC_GRAPH
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_CAPTURE_UC_GRAPH" SHARING=METADATA 
   (	"ID" NUMBER, 
	"TIME" DATE, 
	"USER_CALLS" NUMBER, 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
