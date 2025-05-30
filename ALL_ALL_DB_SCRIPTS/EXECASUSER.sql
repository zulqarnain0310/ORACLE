--------------------------------------------------------
--  DDL for Procedure EXECASUSER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."EXECASUSER" 

/

  GRANT EXECUTE ON "SYS"."EXECASUSER" TO "GSMUSER_ROLE";
  GRANT EXECUTE ON "SYS"."EXECASUSER" TO "GSMADMIN_INTERNAL";
