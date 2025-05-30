--------------------------------------------------------
--  DDL for Table WRWC$_EXP_CONTROL
--------------------------------------------------------

  CREATE TABLE "SYS"."WRWC$_EXP_CONTROL" SHARING=METADATA 
   (	"DBID" NUMBER, 
	"FLAG" NUMBER, 
	"EXP_SNAP_CNT" NUMBER, 
	"LAST_EXP_SNAPID" NUMBER, 
	"MRCT_EXP_TIME" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
