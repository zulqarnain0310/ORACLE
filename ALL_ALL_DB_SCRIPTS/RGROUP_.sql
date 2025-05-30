--------------------------------------------------------
--  DDL for Table RGROUP$
--------------------------------------------------------

  CREATE TABLE "SYS"."RGROUP$" SHARING=METADATA 
   (	"REFGROUP" NUMBER, 
	"OWNER" VARCHAR2(128 BYTE), 
	"NAME" VARCHAR2(128 BYTE), 
	"FLAG" NUMBER DEFAULT 0, 
	"ROLLBACK_SEG" VARCHAR2(128 BYTE), 
	"FIELD1" NUMBER DEFAULT 0, 
	"JOB" NUMBER, 
	"PURGE_OPT#" NUMBER(*,0), 
	"PARALLELISM#" NUMBER(*,0), 
	"HEAP_SIZE#" NUMBER(*,0), 
	"INSTSITE" NUMBER(*,0) DEFAULT 0, 
	"REFRESH_SEQUENCE" NUMBER, 
	"JOB_NAME" VARCHAR2(128 BYTE) DEFAULT NULL            /* job name in */
                             /* dba_scheduler_jobs for refreshing this group */
   ) CLUSTER "SYS"."C_RG#" ("REFGROUP");
