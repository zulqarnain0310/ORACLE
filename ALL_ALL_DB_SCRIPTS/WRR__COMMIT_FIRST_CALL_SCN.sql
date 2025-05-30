--------------------------------------------------------
--  DDL for Table WRR$_COMMIT_FIRST_CALL_SCN
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_COMMIT_FIRST_CALL_SCN" SHARING=METADATA 
   (	"FILE_ID" NUMBER(*,0), 
	"COMMIT_SCN" NUMBER(*,0), 
	"OBJ_ID" NUMBER(*,0), 
	"CALL_SCN" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING
  TABLESPACE "SYSAUX" ;
