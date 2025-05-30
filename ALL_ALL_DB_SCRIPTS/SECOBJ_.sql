--------------------------------------------------------
--  DDL for Table SECOBJ$
--------------------------------------------------------

  CREATE TABLE "SYS"."SECOBJ$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"SECOBJ#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
  GRANT READ ON "SYS"."SECOBJ$" TO "GSMUSER_ROLE";
