--------------------------------------------------------
--  DDL for Procedure CUSTNPAMOCMASTERDOWNLOAD_08112021
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 --CollateralMasterDownload

AS
   v_TimeKey NUMBER(10,0);
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT Timekey 

     INTO v_Timekey
     FROM SysDataMatrix 
    WHERE  CurrentStatus = 'C';
   OPEN  v_cursor FOR
      SELECT ParameterName ,
             'MOCType' Tablename  
        FROM DimParameter 
       WHERE  DimParameterName = 'MOCType'
                AND EffectiveFromTimeKey <= v_Timekey
                AND EffectiveToTimeKey >= v_Timekey ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT AssetClassAlt_Key ,
             AssetClassName ,
             CASE 
                  WHEN AssetClassName = 'SUB-STANDARD' THEN 'If  SUB-STANDARD then NPA Date Mandatory , date format DD/MM/YYYY'
                  WHEN AssetClassName = 'DOUBTFUL I' THEN 'If  DOUBTFUL I then NPA Date Mandatory , date format DD/MM/YYYY'
                  WHEN AssetClassName = 'LOS' THEN 'If  LOS I then NPA Date Mandatory , date format DD/MM/YYYY'
             ELSE ' '
                END NPADate  ,
             'AssetClass' Tablename  
        FROM DimAssetClass 
       WHERE  EffectiveFromTimeKey <= v_Timekey
                AND EffectiveToTimeKey >= v_Timekey
                AND AssetClassAlt_Key NOT IN ( 4,5 )
    ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT MOCTypeName ,
             'MOCSource' TableName  
        FROM DimMOCType 
       WHERE  EffectiveFromTimeKey <= v_Timekey
                AND EffectiveToTimeKey >= v_Timekey ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT SourceName SourceSystem  ,
             'SourceSystem' TableName  
        FROM DIMSOURCEDB 
       WHERE  EffectiveFromTimeKey <= v_Timekey
                AND EffectiveToTimeKey >= v_Timekey ;
      DBMS_SQL.RETURN_RESULT(v_cursor);

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTNPAMOCMASTERDOWNLOAD_08112021" TO "ADF_CDR_RBL_STGDB";
