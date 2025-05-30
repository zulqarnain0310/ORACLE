--------------------------------------------------------
--  DDL for Table WRH$_STREAMS_CAPTURE
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_STREAMS_CAPTURE" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"CAPTURE_NAME" VARCHAR2(128 BYTE), 
	"STARTUP_TIME" DATE, 
	"LAG" NUMBER, 
	"TOTAL_MESSAGES_CAPTURED" NUMBER, 
	"TOTAL_MESSAGES_ENQUEUED" NUMBER, 
	"ELAPSED_RULE_TIME" NUMBER, 
	"ELAPSED_ENQUEUE_TIME" NUMBER, 
	"ELAPSED_REDO_WAIT_TIME" NUMBER, 
	"ELAPSED_PAUSE_TIME" NUMBER, 
	"CON_DBID" NUMBER DEFAULT 0, 
	"EXTRACT_NAME" VARCHAR2(128 BYTE), 
	"BYTES_REDO_MINED" NUMBER, 
	"BYTES_SENT" NUMBER, 
	"SESSION_MODULE" VARCHAR2(64 BYTE) DEFAULT 'Streams', 
	"PER_PDB" NUMBER DEFAULT null
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT DELETE ON "SYS"."WRH$_STREAMS_CAPTURE" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRH$_STREAMS_CAPTURE" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRH$_STREAMS_CAPTURE" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRH$_STREAMS_CAPTURE" TO "SYSUMF_ROLE";
