--------------------------------------------------------
--  DDL for Table WRR$_REPLAY_CALL_INFO
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_REPLAY_CALL_INFO" SHARING=METADATA 
   (	"FILE_ID" NUMBER(*,0), 
	"CALL_CTR" NUMBER(*,0), 
	"TYPE" NUMBER(*,0), 
	"VALUE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING
  TABLESPACE "SYSAUX" ;
