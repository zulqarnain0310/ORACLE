--------------------------------------------------------
--  DDL for Table WRR$_MASKING_PARAMETERS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_MASKING_PARAMETERS" SHARING=METADATA 
   (	"SCRIPT_ID" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"VALUE" VARCHAR2(4000 BYTE), 
	"DATATYPE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
