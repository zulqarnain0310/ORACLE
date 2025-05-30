--------------------------------------------------------
--  DDL for Index I_ARGUMENT1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_ARGUMENT1" ON "SYS"."ARGUMENT$" ("OBJ#", "PROCEDURE$", "OVERLOAD#", "SEQUENCE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 16384 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
