--------------------------------------------------------
--  DDL for Table WRI$_SEGADV_ATTRIB
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_SEGADV_ATTRIB" SHARING=METADATA 
   (	"ATTRIBUTE#" NUMBER, 
	"ATTRIBVALUE" NUMBER, 
	"DESCR" VARCHAR2(128 BYTE), 
	"SPARE" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
