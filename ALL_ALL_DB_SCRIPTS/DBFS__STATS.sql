--------------------------------------------------------
--  DDL for Table DBFS$_STATS
--------------------------------------------------------

  CREATE TABLE "SYS"."DBFS$_STATS" SHARING=METADATA 
   (	"S_OWNER" VARCHAR2(128 BYTE), 
	"S_NAME" VARCHAR2(32 BYTE), 
	"S_MOUNT" VARCHAR2(32 BYTE), 
	"OPCODE" NUMBER(*,0), 
	"COUNT" NUMBER(*,0), 
	"WTIME" NUMBER(*,0), 
	"CTIME" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
