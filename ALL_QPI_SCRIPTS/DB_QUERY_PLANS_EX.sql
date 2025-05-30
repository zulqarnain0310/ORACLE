--------------------------------------------------------
--  DDL for View DB_QUERY_PLANS_EX
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."DB_QUERY_PLANS_EX" () AS 
  SELECT Q.TEXT ,
          Q.params ,
          Q.query_text_id ,
          p.* ,
          Q.query_hash 
     FROM sys.query_store_plan p
            JOIN qpi_RBL_MISDB_PROD.db_queries Q   ON p.query_id = Q.query_id
;
