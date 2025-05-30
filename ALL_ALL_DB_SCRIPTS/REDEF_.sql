--------------------------------------------------------
--  DDL for Table REDEF$
--------------------------------------------------------

  CREATE TABLE "SYS"."REDEF$" SHARING=METADATA 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(128 BYTE), 
	"STATE" NUMBER(*,0), 
	"FLAG" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
