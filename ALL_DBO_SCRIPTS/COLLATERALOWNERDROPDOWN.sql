--------------------------------------------------------
--  DDL for Procedure COLLATERALOWNERDROPDOWN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AS
   v_TimeKey NUMBER(10,0);
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT Timekey 

     INTO v_TimeKey
     FROM SysDataMatrix 
    WHERE  CurrentStatus = 'C';
   OPEN  v_cursor FOR
      SELECT ParameterAlt_Key ,
             ParameterName ,
             'CustomeroftheBank' Tablename  
        FROM DimParameter 
       WHERE  DimParameterName = 'DimYesNo'
                AND EffectiveFromTimeKey <= v_TimeKey
                AND EffectiveToTimeKey >= v_TimeKey ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT CollateralOwnerTypeAltKey ,
             CollOwnerDescription ,
             'OtherOwnerRelationship' Tablename  
        FROM DimCollateralOwnerType 
       WHERE  CollOwnerDescription NOT IN ( 'Primary Customer','Proprietor' )

                AND EffectiveFromTimeKey <= v_TimeKey
                AND EffectiveToTimeKey >= v_TimeKey ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT ParameterAlt_Key ,
             ParameterName ,
             'Relation' Tablename  
        FROM DimParameter 
       WHERE  DimParameterName = 'Relation'
                AND EffectiveFromTimeKey <= v_TimeKey
                AND EffectiveToTimeKey >= v_TimeKey ;
      DBMS_SQL.RETURN_RESULT(v_cursor);

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOWNERDROPDOWN" TO "ADF_CDR_RBL_STGDB";
