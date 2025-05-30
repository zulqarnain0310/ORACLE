--------------------------------------------------------
--  DDL for Table WRR$_REPLAY_CONN_DATA
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_REPLAY_CONN_DATA" SHARING=METADATA 
   (	"CONN_ID" NUMBER, 
	"SLAVE_ID" NUMBER(*,0), 
	"CONN_STR" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
