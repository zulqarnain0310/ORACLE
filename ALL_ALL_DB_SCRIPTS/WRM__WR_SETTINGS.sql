--------------------------------------------------------
--  DDL for Table WRM$_WR_SETTINGS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRM$_WR_SETTINGS" SHARING=METADATA 
   (	"LOCAL_AWRDBID" NUMBER, 
	"VIEW_LOCATION" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
  GRANT DELETE ON "SYS"."WRM$_WR_SETTINGS" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRM$_WR_SETTINGS" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRM$_WR_SETTINGS" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRM$_WR_SETTINGS" TO "SYSUMF_ROLE";
