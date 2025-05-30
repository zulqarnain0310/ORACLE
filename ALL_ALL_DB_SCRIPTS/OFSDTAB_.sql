--------------------------------------------------------
--  DDL for Table OFSDTAB$
--------------------------------------------------------

  CREATE TABLE "SYS"."OFSDTAB$" SHARING=METADATA 
   (	"NAME" VARCHAR2(1024 BYTE), 
	"FSID" NUMBER(*,0), 
	"ST_INO" NUMBER(*,0), 
	"ST_PINO" NUMBER(*,0), 
	"ST_MODE" NUMBER(*,0), 
	"ST_NLINK" NUMBER(*,0), 
	"ST_UID" NUMBER(*,0), 
	"ST_GID" NUMBER(*,0), 
	"ST_SIZE" NUMBER(*,0), 
	"ST_BLKSIZE" NUMBER(*,0), 
	"ST_BLOCKS" NUMBER(*,0), 
	"ST_ATIME" NUMBER(*,0), 
	"ST_MTIME" NUMBER(*,0), 
	"ST_CTIME" NUMBER(*,0), 
	"ST_ATIMENS" NUMBER(*,0), 
	"ST_MTIMENS" NUMBER(*,0), 
	"ST_CTIMENS" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
