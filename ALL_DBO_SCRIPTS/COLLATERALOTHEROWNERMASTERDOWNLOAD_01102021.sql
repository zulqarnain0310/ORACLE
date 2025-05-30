--------------------------------------------------------
--  DDL for Procedure COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" 
AS
   v_TimeKey NUMBER(10,0);
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT Timekey 

     INTO v_Timekey
     FROM SysDataMatrix 
    WHERE  CurrentStatus = 'C';
   OPEN  v_cursor FOR
      SELECT CollateralOwnerTypeAltKey ,
             CollOwnerDescription ,
             'OtherOwnerDetails' TableName  
        FROM DimCollateralOwnerType 
       WHERE  EffectiveFromTimeKey <= v_TimeKey
                AND EffectiveToTimeKey >= v_TimeKey
        ORDER BY CollateralOwnerTypeAltKey ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   --select RelationshipAuthorityCodeAlt_Key,RelationshipAuthorityCodeName,'Relationshipmaster' as TableName from DimRelationshipAuthorityCode A
   --where A.EffectiveFromTimeKey<=@TimeKey
   --AND A.EffectiveToTimeKey >=@TimeKey
   --order by RelationshipAuthorityCodeAlt_Key
   OPEN  v_cursor FOR
      SELECT AddressCategory_Key ,
             AddressCategoryName ,
             'AddressCategory' TableName  
        FROM DimAddressCategory 
       WHERE  EffectiveFromTimeKey <= v_TimeKey
                AND EffectiveToTimeKey >= v_TimeKey
        ORDER BY AddressCategory_Key ;
      DBMS_SQL.RETURN_RESULT(v_cursor);

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."COLLATERALOTHEROWNERMASTERDOWNLOAD_01102021" TO "ADF_CDR_RBL_STGDB";
