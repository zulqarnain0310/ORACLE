--------------------------------------------------------
--  DDL for View MEM_PLAN_CACHE_INFO
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."MEM_PLAN_CACHE_INFO" ("CACHED_OBJECT", "MEMORY_GB", "PLAN_COUNT", "USED_PLANS", "REFERENCES") AS 
  SELECT objtype cached_object  ,
          SUM(size_in_bytes / 1024 / 1024 / 1024)  memory_gb  ,
          COUNT(*)  plan_count  ,
          SUM(usecounts)  used_plans  ,
          SUM(refcounts)  references  
     FROM sys.dm_exec_cached_plans 
     GROUP BY objtype
;
