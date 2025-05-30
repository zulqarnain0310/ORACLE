--------------------------------------------------------
--  DDL for View DB_FORCED_QUERIES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."DB_FORCED_QUERIES" () AS 
  SELECT CONCAT('FPQ-', query_id) NAME  ,
          query_id ,
          TEXT TEXT  ,
          plan_id forced_plan_id  ,
          NULL hints  
     FROM qpi_RBL_MISDB_PROD.db_query_plans 
    WHERE  is_forced_plan = 1
   UNION ALL 
   SELECT NAME ,
          Q.query_id ,
          query_text TEXT  ,
          NULL forced_plan_id  ,
          hints 
     FROM sys.plan_guides pg
            LEFT JOIN qpi_RBL_MISDB_PROD.db_queries Q   ON Q.TEXT = pg.query_text
    WHERE  is_disabled = 0
;
