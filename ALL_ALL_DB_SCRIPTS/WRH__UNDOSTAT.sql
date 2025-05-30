--------------------------------------------------------
--  DDL for Table WRH$_UNDOSTAT
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_UNDOSTAT" SHARING=METADATA 
   (	"BEGIN_TIME" DATE, 
	"END_TIME" DATE, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"SNAP_ID" NUMBER, 
	"UNDOTSN" NUMBER, 
	"UNDOBLKS" NUMBER, 
	"TXNCOUNT" NUMBER, 
	"MAXQUERYLEN" NUMBER, 
	"MAXQUERYSQLID" VARCHAR2(13 BYTE), 
	"MAXCONCURRENCY" NUMBER, 
	"UNXPSTEALCNT" NUMBER, 
	"UNXPBLKRELCNT" NUMBER, 
	"UNXPBLKREUCNT" NUMBER, 
	"EXPSTEALCNT" NUMBER, 
	"EXPBLKRELCNT" NUMBER, 
	"EXPBLKREUCNT" NUMBER, 
	"SSOLDERRCNT" NUMBER, 
	"NOSPACEERRCNT" NUMBER, 
	"ACTIVEBLKS" NUMBER, 
	"UNEXPIREDBLKS" NUMBER, 
	"EXPIREDBLKS" NUMBER, 
	"TUNED_UNDORETENTION" NUMBER, 
	"STATUS" NUMBER, 
	"SPCPRS_RETENTION" NUMBER, 
	"RUNAWAYQUERYSQLID" VARCHAR2(13 BYTE), 
	"CON_DBID" NUMBER DEFAULT 0, 
	"PER_PDB" NUMBER DEFAULT null
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT DELETE ON "SYS"."WRH$_UNDOSTAT" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRH$_UNDOSTAT" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRH$_UNDOSTAT" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRH$_UNDOSTAT" TO "SYSUMF_ROLE";
