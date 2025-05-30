--------------------------------------------------------
--  DDL for Table OFSOTAB$
--------------------------------------------------------

  CREATE TABLE "SYS"."OFSOTAB$" SHARING=METADATA 
   (	"PATH" VARCHAR2(1024 BYTE), 
	"F_TYPE" NUMBER(*,0), 
	"F_BSIZE" NUMBER(*,0), 
	"F_BLOCKS" NUMBER(*,0), 
	"F_BFREE" NUMBER(*,0), 
	"F_BAVAIL" NUMBER(*,0), 
	"F_FILES" NUMBER(*,0), 
	"F_FFREE" NUMBER(*,0), 
	"F_FSID" NUMBER(*,0), 
	"F_NAMELEN" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
