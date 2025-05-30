--------------------------------------------------------
--  DDL for Table SUMPARTLOG$
--------------------------------------------------------

  CREATE TABLE "SYS"."SUMPARTLOG$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"DATAOBJ#" NUMBER, 
	"BO#" NUMBER, 
	"NEWOBJ#" NUMBER, 
	"NEWDATAOBJ#" NUMBER, 
	"POBJ#" NUMBER, 
	"HIBOUNDLEN" NUMBER, 
	"LOBOUNDLEN" NUMBER, 
	"BOUNDVALS" LONG, 
	"PARTTYPE" NUMBER, 
	"PMOPTYPE" NUMBER, 
	"SCN" NUMBER, 
	"TIMESTAMP" DATE, 
	"FLAGS" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"XID" NUMBER, 
	"CSCN" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
