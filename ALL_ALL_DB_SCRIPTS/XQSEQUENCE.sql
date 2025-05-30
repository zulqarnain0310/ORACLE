--------------------------------------------------------
--  DDL for Operator XQSEQUENCE
--------------------------------------------------------

  CREATE OR REPLACE OPERATOR "SYS"."XQSEQUENCE" BINDING
	("SYS"."XMLTYPE") RETURN "SYS"."XMLSEQUENCETYPE"
	   USING "SYS"."XQSEQUENCEFROMXMLTYPE";
  GRANT EXECUTE ON "SYS"."XQSEQUENCE" TO PUBLIC WITH GRANT OPTION;
