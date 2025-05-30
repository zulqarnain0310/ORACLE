--------------------------------------------------------
--  DDL for Table WRR$_CAPTURE_BUCKETS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_CAPTURE_BUCKETS" SHARING=METADATA 
   (	"CAPTURE_ID" NUMBER, 
	"BUCKET_ID" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
