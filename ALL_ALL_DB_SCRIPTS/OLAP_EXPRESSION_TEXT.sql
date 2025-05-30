--------------------------------------------------------
--  DDL for Operator OLAP_EXPRESSION_TEXT
--------------------------------------------------------

  CREATE OR REPLACE OPERATOR "SYS"."OLAP_EXPRESSION_TEXT" BINDING
	(RAW, VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "SYS"."OLAP_SRF_T"
	   USING "OLAP_TEXT_SRF";
  GRANT EXECUTE ON "SYS"."OLAP_EXPRESSION_TEXT" TO PUBLIC;
