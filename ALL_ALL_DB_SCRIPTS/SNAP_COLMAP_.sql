--------------------------------------------------------
--  DDL for Table SNAP_COLMAP$
--------------------------------------------------------

  CREATE TABLE "SYS"."SNAP_COLMAP$" SHARING=METADATA 
   (	"SOWNER" VARCHAR2(128 BYTE), 
	"VNAME" VARCHAR2(128 BYTE), 
	"SNACOL" VARCHAR2(128 BYTE), 
	"TABNUM" NUMBER(*,0), 
	"MASCOL" VARCHAR2(128 BYTE), 
	"MASPOS" NUMBER(*,0), 
	"COLROLE" NUMBER, 
	"INSTSITE" NUMBER(*,0) DEFAULT 0, 
	"SNAPOS" NUMBER(*,0) DEFAULT 0     /* position of col in snapshot table */
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
