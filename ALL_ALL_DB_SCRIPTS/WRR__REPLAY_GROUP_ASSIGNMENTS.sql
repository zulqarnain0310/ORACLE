--------------------------------------------------------
--  DDL for Table WRR$_REPLAY_GROUP_ASSIGNMENTS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_REPLAY_GROUP_ASSIGNMENTS" SHARING=METADATA 
   (	"REPLAY_DIR_NUMBER" NUMBER(*,0), 
	"INST_ID" NUMBER(*,0), 
	"GID" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
