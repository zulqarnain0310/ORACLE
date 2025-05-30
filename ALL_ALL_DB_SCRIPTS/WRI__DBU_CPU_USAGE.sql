--------------------------------------------------------
--  DDL for Table WRI$_DBU_CPU_USAGE
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_DBU_CPU_USAGE" SHARING=METADATA 
   (	"DBID" NUMBER, 
	"VERSION" VARCHAR2(17 BYTE), 
	"TIMESTAMP" DATE, 
	"CPU_COUNT" NUMBER, 
	"CPU_CORE_COUNT" NUMBER, 
	"CPU_SOCKET_COUNT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
