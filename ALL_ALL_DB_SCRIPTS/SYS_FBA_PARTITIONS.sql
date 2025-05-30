--------------------------------------------------------
--  DDL for Table SYS_FBA_PARTITIONS
--------------------------------------------------------

  CREATE TABLE "SYS"."SYS_FBA_PARTITIONS" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"PARTITIONSCN" NUMBER, 
	"FLAGS" NUMBER, 
	"SPARE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
