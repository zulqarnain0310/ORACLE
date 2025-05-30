--------------------------------------------------------
--  DDL for Table PROCEDUREJAVA$
--------------------------------------------------------

  CREATE TABLE "SYS"."PROCEDUREJAVA$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"PROCEDURE#" NUMBER, 
	"OWNERNAME" VARCHAR2(128 BYTE), 
	"OWNERLENGTH" NUMBER, 
	"USERSIGNATURE" VARCHAR2(4000 BYTE), 
	"USERSIGLEN" NUMBER, 
	"CLASSNAME" VARCHAR2(4000 BYTE), 
	"CLASSLENGTH" NUMBER, 
	"METHODNAME" VARCHAR2(4000 BYTE), 
	"METHODLENGTH" NUMBER, 
	"SIGNATURE" LONG, 
	"SIGLENGTH" NUMBER, 
	"FLAGS" VARCHAR2(4000 BYTE), 
	"FLAGSLENGTH" NUMBER, 
	"COOKIESIZE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
