--------------------------------------------------------
--  DDL for Operator OLAP_EXPRESSION
--------------------------------------------------------

  CREATE OR REPLACE OPERATOR "SYS"."OLAP_EXPRESSION" BINDING
	(RAW, VARCHAR2) RETURN NUMBER
	  WITH INDEX CONTEXT, SCAN CONTEXT "SYS"."OLAP_SRF_T"
	   USING "OLAP_NUMBER_SRF";
  GRANT EXECUTE ON "SYS"."OLAP_EXPRESSION" TO PUBLIC;
