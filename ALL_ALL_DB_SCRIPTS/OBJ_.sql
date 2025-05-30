--------------------------------------------------------
--  DDL for Table OBJ$
--------------------------------------------------------

  CREATE TABLE "SYS"."OBJ$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"DATAOBJ#" NUMBER, 
	"OWNER#" NUMBER, 
	"NAME" VARCHAR2(128 BYTE), 
	"NAMESPACE" NUMBER, 
	"SUBNAME" VARCHAR2(128 BYTE), 
	"TYPE#" NUMBER, 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"STIME" DATE, 
	"STATUS" NUMBER, 
	"REMOTEOWNER" VARCHAR2(128 BYTE), 
	"LINKNAME" VARCHAR2(128 BYTE), 
	"FLAGS" NUMBER, 
	"OID$" RAW(16), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(1000 BYTE), 
	"SPARE5" VARCHAR2(1000 BYTE), 
	"SPARE6" DATE, 
	"SIGNATURE" RAW(16), 
	"SPARE7" NUMBER, 
	"SPARE8" NUMBER, 
	"SPARE9" NUMBER, 
	"DFLCOLLID" NUMBER, 
	"CREAPPID" NUMBER, 
	"CREVERID" NUMBER, 
	"CREPATCHID" NUMBER, 
	"MODAPPID" NUMBER, 
	"MODVERID" NUMBER, 
	"MODPATCHID" NUMBER, 
	"SPARE10" NUMBER, 
	"SPARE11" NUMBER, 
	"SPARE12" VARCHAR2(1000 BYTE), 
	"SPARE13" VARCHAR2(1000 BYTE), 
	"SPARE14" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 16384 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  GRANT SELECT ON "SYS"."OBJ$" TO "ORACLE_OCM";
  GRANT SELECT ON "SYS"."OBJ$" TO "GSMADMIN_INTERNAL";
  GRANT SELECT ON "SYS"."OBJ$" TO "XDB";
  GRANT SELECT ON "SYS"."OBJ$" TO "CTXSYS";
  GRANT SELECT ON "SYS"."OBJ$" TO "LBACSYS";
  GRANT READ ON "SYS"."OBJ$" TO "DVSYS";
  GRANT READ ON "SYS"."OBJ$" TO "DV_SECANALYST";
