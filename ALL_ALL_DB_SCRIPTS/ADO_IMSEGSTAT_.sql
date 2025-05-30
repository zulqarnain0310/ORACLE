--------------------------------------------------------
--  DDL for Table ADO_IMSEGSTAT$
--------------------------------------------------------

  CREATE TABLE "SYS"."ADO_IMSEGSTAT$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"STAT#" NUMBER, 
	"VALUE" NUMBER, 
	"TRACKTIME" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
