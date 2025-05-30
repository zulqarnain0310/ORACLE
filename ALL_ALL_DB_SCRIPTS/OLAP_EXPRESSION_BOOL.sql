--------------------------------------------------------
--  DDL for Operator OLAP_EXPRESSION_BOOL
--------------------------------------------------------

  CREATE OR REPLACE OPERATOR "SYS"."OLAP_EXPRESSION_BOOL" BINDING
	(RAW, VARCHAR2) RETURN NUMBER
	  WITH INDEX CONTEXT, SCAN CONTEXT "SYS"."OLAP_SRF_T"
	   USING "OLAP_BOOL_SRF";
  GRANT EXECUTE ON "SYS"."OLAP_EXPRESSION_BOOL" TO PUBLIC;
