--------------------------------------------------------
--  DDL for Table STAGE_SYB12_SYSOBJECTS
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "RBL_TEMPDB"."STAGE_SYB12_SYSOBJECTS" 
   (	"SVRID_FK" NUMBER, 
	"DBID_GEN_FK" NUMBER, 
	"OBJID_GEN" NUMBER, 
	"SUID_GEN_FK" NUMBER, 
	"NAME" VARCHAR2(256 BYTE), 
	"ID" NUMBER, 
	"DB_UID" NUMBER, 
	"DB_TYPE" VARCHAR2(256 BYTE), 
	"USERSTAT" NUMBER, 
	"SYSSTAT" NUMBER, 
	"INDEXDEL" NUMBER, 
	"SCHEMATACNT" NUMBER, 
	"SYSSTAT2" NUMBER, 
	"CRDATE" VARCHAR2(255 BYTE), 
	"EXPDATE" VARCHAR2(255 BYTE), 
	"DELTRIG" NUMBER, 
	"INSTRIG" NUMBER, 
	"UPDTRIG" NUMBER, 
	"SELTRIG" NUMBER, 
	"CKFIRST" NUMBER, 
	"DB_CACHE" NUMBER, 
	"AUDFLAGS" NUMBER, 
	"OBJSPARE" NUMBER, 
	"VERSIONTS" RAW(255), 
	"LOGINNAME" VARCHAR2(255 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
