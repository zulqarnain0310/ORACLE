--------------------------------------------------------
--  DDL for Table WRR$_ASREPLAY_DATA
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_ASREPLAY_DATA" SHARING=METADATA 
   (	"ECID" NUMBER, 
	"DSCN" NUMBER, 
	"SSCN" NUMBER, 
	"CWSCN" NUMBER, 
	"PCSCN" NUMBER, 
	"SQLID" NUMBER, 
	"FILEID" NUMBER, 
	"CALLCTR" NUMBER, 
	"ENDT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
