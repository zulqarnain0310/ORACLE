--------------------------------------------------------
--  DDL for Table SNAP_XCMT$
--------------------------------------------------------

  CREATE TABLE "SYS"."SNAP_XCMT$" SHARING=METADATA 
   (	"XID" NUMBER, 
	"COMMIT_SCN" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
