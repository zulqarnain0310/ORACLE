--------------------------------------------------------
--  DDL for View DB_QUERY_PLANS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."DB_QUERY_PLANS" ("TEXT", "PARAMS", "QUERY_TEXT_ID", "PLAN_ID", "QUERY_ID", "COMPATIBILITY_LEVEL", "QUERY_PLAN_HASH", "COUNT_COMPILES", "IS_PARALLEL_PLAN", "IS_FORCED_PLAN", "QUERY_PLAN", "QUERY_HASH") AS 
  SELECT Q.TEXT ,
          Q.params ,
          Q.query_text_id ,
          p.plan_id ,
          p.query_id ,
          p.compatibility_level ,
          p.query_plan_hash ,
          p.count_compiles ,
          p.is_parallel_plan ,
          p.is_forced_plan ,
          p.query_plan ,
          Q.query_hash 
     FROM sys.query_store_plan p
            JOIN qpi_RBL_MISDB_PROD.db_queries Q   ON p.query_id = Q.query_id
;
