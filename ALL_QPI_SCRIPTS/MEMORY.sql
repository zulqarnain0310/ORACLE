--------------------------------------------------------
--  DDL for View MEMORY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."MEMORY" () AS 
  SELECT REPLACE(NVL(type, '-->  TOTAL USED:'), 'MEMORYCLERK_', '') memory  ,
          UTILS.CONVERT_TO_NUMBER(SUM(pages_kb)  / 1024.1 / 1024,6,1) GB  ,
          UTILS.CONVERT_TO_NUMBER(SUM(pages_kb)  / 10.24 / memory_mb(),3,0) perc  
     FROM sys.dm_os_memory_clerks 
     GROUP BY ROLLUP( TYPE )

      HAVING SUM(pages_kb)  / 1024. / 1024 > 0.1
   UNION ALL 
   SELECT '-->  TOTAL AVAILABLE:' memory  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(memory_mb() / 1024., 1),6,1) GB  ,
          100 perc  
     FROM DUAL
;
