--------------------------------------------------------
--  DDL for Table JAVA$RUNTIME$EXEC$USER$
--------------------------------------------------------

  CREATE TABLE "SYS"."JAVA$RUNTIME$EXEC$USER$" SHARING=METADATA 
   (	"OWNER#" NUMBER, 
	"OS_USERNAME" VARCHAR2(512 BYTE), 
	"OS_PASSWORD" VARCHAR2(512 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
