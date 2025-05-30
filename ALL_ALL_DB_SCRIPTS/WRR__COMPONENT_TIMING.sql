--------------------------------------------------------
--  DDL for Table WRR$_COMPONENT_TIMING
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_COMPONENT_TIMING" SHARING=METADATA 
   (	"INST_ID" NUMBER(*,0), 
	"REPLAY_ID" NUMBER, 
	"COMP_ID" NUMBER(*,0), 
	"COMP_NAME" VARCHAR2(128 BYTE), 
	"ELAPSED_TIME" NUMBER, 
	"NUM_EXECS" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING
  TABLESPACE "SYSAUX" ;
