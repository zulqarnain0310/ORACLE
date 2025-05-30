--------------------------------------------------------
--  DDL for Table SYNCREF$_OBJECTS
--------------------------------------------------------

  CREATE TABLE "SYS"."SYNCREF$_OBJECTS" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"OBJECT_TYPE_FLAG" NUMBER, 
	"GROUP_ID" NUMBER, 
	"CURRENT_GROUP_FLAG" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
