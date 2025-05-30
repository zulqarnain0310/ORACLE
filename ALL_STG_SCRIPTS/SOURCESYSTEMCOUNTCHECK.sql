--------------------------------------------------------
--  DDL for Procedure SOURCESYSTEMCOUNTCHECK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" 
AS
   v_cursor SYS_REFCURSOR;

BEGIN

   OPEN  v_cursor FOR
      SELECT REPLACE(DataTemplates, 'TXN', 'TRANSACTION') DataTemplates  ,
             SRC_Count SourceCount  ,
             STG_Count StagingCount  
        FROM ( SELECT (CASE 
                            WHEN TableName LIKE '%01%' THEN 'FINACLE ' || REPLACE(TABLENAME, '_SOURCESYSTEM01_STG', ' ')
                            WHEN TableName LIKE '%02%' THEN 'INDUS ' || REPLACE(TABLENAME, '_SOURCESYSTEM02_STG', ' ')
                            WHEN TableName LIKE '%03%' THEN 'ECBF ' || REPLACE(TABLENAME, '_SOURCESYSTEM03_STG', ' ')
                            WHEN TableName LIKE '%04%' THEN 'MIFIN ' || REPLACE(TABLENAME, '_SOURCESYSTEM04_STG', ' ')
                            WHEN TableName LIKE '%05%' THEN 'GANASEVA ' || REPLACE(TABLENAME, '_SOURCESYSTEM05_STG', ' ')
                            WHEN TableName LIKE '%06%' THEN 'VisionPlus ' || REPLACE(TABLENAME, '_SOURCESYSTEM06_STG', ' ')
                      ELSE TableName
                         END) DataTemplates  ,
                      SRC_Count ,
                      STG_COUNT 
               FROM TABLE_AUDIT 
                WHERE  EXT_Date = '07/20/2021'
                         AND SRC_Count > 0 ) x
       WHERE  DataTemplates NOT LIKE '%_STG%'
        ORDER BY DataTemplates ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   -------------------------------------------Only Source Count
   OPEN  v_cursor FOR
      SELECT REPLACE(DataTemplates, 'TXN', 'TRANSACTION') DataTemplates  ,
             SRC_Count SourceCount  
        FROM ( SELECT (CASE 
                            WHEN TableName LIKE '%01%' THEN 'FINACLE ' || REPLACE(TABLENAME, '_SOURCESYSTEM01_STG', ' ')
                            WHEN TableName LIKE '%02%' THEN 'INDUS ' || REPLACE(TABLENAME, '_SOURCESYSTEM02_STG', ' ')
                            WHEN TableName LIKE '%03%' THEN 'ECBF ' || REPLACE(TABLENAME, '_SOURCESYSTEM03_STG', ' ')
                            WHEN TableName LIKE '%04%' THEN 'MIFIN ' || REPLACE(TABLENAME, '_SOURCESYSTEM04_STG', ' ')
                            WHEN TableName LIKE '%05%' THEN 'GANASEVA ' || REPLACE(TABLENAME, '_SOURCESYSTEM05_STG', ' ')
                            WHEN TableName LIKE '%06%' THEN 'VisionPlus ' || REPLACE(TABLENAME, '_SOURCESYSTEM06_STG', ' ')
                      ELSE TableName
                         END) DataTemplates  ,
                      SRC_Count ,
                      STG_COUNT 
               FROM TABLE_AUDIT 
                WHERE  EXT_Date = '07/20/2021'
                         AND SRC_Count > 0 ) x
       WHERE  DataTemplates NOT LIKE '%_STG%'
        ORDER BY DataTemplates ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT SourceSystem ,
             CustomerID ,
             UCIC_ID 
        FROM CUSTOMER_ALL_SOURCE_SYSTEM 
       WHERE  UCIC_ID IS NULL ;
      DBMS_SQL.RETURN_RESULT(v_cursor);

EXCEPTION WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('NO DATA FOUND');
            WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."SOURCESYSTEMCOUNTCHECK" TO "ADF_CDR_RBL_STGDB";
