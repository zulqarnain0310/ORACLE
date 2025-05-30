--------------------------------------------------------
--  DDL for Table OPATCH_INST_PATCH
--------------------------------------------------------

  CREATE TABLE "SYS"."OPATCH_INST_PATCH" SHARING=METADATA 
   (	"NODENAME" VARCHAR2(128 BYTE), 
	"PATCHNUM" VARCHAR2(128 BYTE), 
	"PATCHUID" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
