--------------------------------------------------------
--  DDL for Procedure GETSPTABLEDEPENDENCY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" /*
AUTHOR - MAMTA (DF627)
DATE - 25-06-24
PURPOSE - FOR RETRIEVING THE DETAILS OF THE SP AND ITS DEPENDENCIES 
*/ CREATE PROC "dbo" . "GetSPTableDependency" AS BEGIN DROP TABLE IF  --SQLDEV: NOT RECOGNIZED
AS
   v_cursor SYS_REFCURSOR;

BEGIN

   -- Drop temporary tables if they exist
   IF tt_ColumnDetail ;  --SQLDEV: NOT RECOGNIZED
   ; TABLE IF  --SQLDEV: NOT RECOGNIZED
   -- Create temporary table tt_ColumnDetail
   IF tt_SPTableInfo ;  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_ColumnDetail;
   UTILS.IDENTITY_RESET('tt_ColumnDetail');

   INSERT INTO tt_ColumnDetail ( 
   	SELECT DISTINCT SpName ,
                    MIN(UTILS.CONVERT_TO_NUMBER(IsAllColumnsFound,10,0))  IsAllColumnsFound  
   	  FROM RBL_MISDB_PROD.SpTableDependencyDtls 
   	 WHERE  UTILS.CONVERT_TO_VARCHAR2(ProcessDateTime,200) = utils.dateadd('DD', -1, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200))
   	  GROUP BY SpName );
   -- Create temporary table tt_SPTableInfo
   DELETE FROM tt_SPTableInfo;
   UTILS.IDENTITY_RESET('tt_SPTableInfo');

   INSERT INTO tt_SPTableInfo ( 
   	SELECT MainDBName ,
           ServerName ,
           ServerType ,
           ReferencedDBName ,
           ReferencedSchemaName ,
           ReferencedTableName ,
           ReferencedColumnName ,
           SpName ,
           CASE 
                WHEN IsCallerDependent = 1 THEN 'Referenced Table Name is the SP Name'   END NestedSPName  ,
           CASE 
                WHEN IsUpdate = 0
                  AND IsSelect = 0 THEN 'NA'
                WHEN IsUpdate = 0
                  AND IsSelect = 1 THEN 'SELECT'
                WHEN IsUpdate = 1
                  AND IsSelect = 0 THEN 'UPDATE'
                WHEN IsUpdate = 1
                  AND IsSelect = 1 THEN 'INUP'   END SPType  ,
           UTILS.CONVERT_TO_VARCHAR2('',4000) ColumnInfo  ,
           SpCreatedDate ,
           SpModifiedDate ,
           TableCreatedDate ,
           TableModifiedDate ,
           ProcessDateTime 
   	  FROM RBL_MISDB_PROD.SpTableDependencyDtls 
   	 WHERE  UTILS.CONVERT_TO_VARCHAR2(ProcessDateTime,200) = utils.dateadd('DD', -1, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200)) );
   -- Update ColumnInfo in tt_SPTableInfo based on tt_ColumnDetail
   MERGE INTO tt_SPTableInfo S
   USING (SELECT S.ROWID row_id, CASE 
   WHEN C.IsAllColumnsFound = 0 THEN 'ALL COLUMNS MIGHT NOT BE DISPLAYED SO PLEASE CHECK SP TOO'
   WHEN C.IsAllColumnsFound = 1 THEN 'ALL COLUMNS ARE DISPLAYED'   END AS ColumnInfo
   FROM tt_SPTableInfo S
          JOIN tt_ColumnDetail C   ON S.SpName = C.SpName ) src
   ON ( S.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET ColumnInfo = src.ColumnInfo;
   -- Select data from tt_SPTableInfo
   OPEN  v_cursor FOR
      SELECT * 
        FROM tt_SPTableInfo 
        ORDER BY SpName ;
      DBMS_SQL.RETURN_RESULT(v_cursor);-- Drop temporary tables
   TABLE IF  --SQLDEV: NOT RECOGNIZED
   IF tt_ColumnDetail ;  --SQLDEV: NOT RECOGNIZED
   ; TABLE IF  --SQLDEV: NOT RECOGNIZED
   IF tt_SPTableInfo ;  --SQLDEV: NOT RECOGNIZED

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."GETSPTABLEDEPENDENCY" TO "ADF_CDR_RBL_STGDB";
