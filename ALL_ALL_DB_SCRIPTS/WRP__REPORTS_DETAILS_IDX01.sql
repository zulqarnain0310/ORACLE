--------------------------------------------------------
--  DDL for Index WRP$_REPORTS_DETAILS_IDX01
--------------------------------------------------------

  CREATE INDEX "SYS"."WRP$_REPORTS_DETAILS_IDX01" ON "SYS"."WRP$_REPORTS_DETAILS" ("REPORT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P0" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
