--------------------------------------------------------
--  DDL for Operator OLAP_EXPRESSION_DATE
--------------------------------------------------------

  CREATE OR REPLACE OPERATOR "SYS"."OLAP_EXPRESSION_DATE" BINDING
	(RAW, VARCHAR2) RETURN DATE
	  WITH INDEX CONTEXT, SCAN CONTEXT "SYS"."OLAP_SRF_T"
	   USING "OLAP_DATE_SRF";
  GRANT EXECUTE ON "SYS"."OLAP_EXPRESSION_DATE" TO PUBLIC;
