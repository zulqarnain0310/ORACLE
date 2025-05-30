--------------------------------------------------------
--  DDL for Table SYSDBIMFSSEG$
--------------------------------------------------------

  CREATE TABLE "SYS"."SYSDBIMFSSEG$" SHARING=METADATA 
   (	"SEGID" NUMBER, 
	"PDB" NUMBER, 
	"TSN" NUMBER, 
	"OBJD" NUMBER, 
	"VERSION" NUMBER DEFAULT 0
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
