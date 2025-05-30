--------------------------------------------------------
--  DDL for Index WRR$_CAPTURE_BUCKETS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_CAPTURE_BUCKETS_PK" ON "SYS"."WRR$_CAPTURE_BUCKETS" ("CAPTURE_ID", "BUCKET_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
