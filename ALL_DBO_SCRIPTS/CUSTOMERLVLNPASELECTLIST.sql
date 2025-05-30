--------------------------------------------------------
--  DDL for Procedure CUSTOMERLVLNPASELECTLIST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" 
--CustomerLvlNPASelectlist '68'
 -- exec CustomerLvlNPASelectlist @CustomerID=N'65'
 --go

(
  --declare
  v_CustomerID IN VARCHAR2 DEFAULT '9987888' 
)
AS
   v_TimeKey NUMBER(10,0);
   v_cursor SYS_REFCURSOR;

BEGIN

   --SET @Timekey =(Select TimeKey from SysDataMatrix where CurrentStatus='C') 
   -- SET @Timekey =(Select LastMonthDateKey from SysDayMatrix where Timekey=@Timekey) 
   SELECT Timekey 

     INTO v_Timekey
     FROM SysDataMatrix 
    WHERE  MOC_Initialised = 'Y'
             AND NVL(MOC_Frozen, 'N') = 'N';
   OPEN  v_cursor FOR
      SELECT A.CustomerID ,
             A.CustomerName ,
             B.AssetClassName AssetClass  ,
             UTILS.CONVERT_TO_VARCHAR2(A.NPADate,10,p_style=>103) NPADate  ,
             A.AdditionalProvision ,
             A.SecurityValue ,
             D.MOCTypeName MOCSource  ,
             C.ParameterName MOCType  ,
             A.MOCReason ,
             UTILS.CONVERT_TO_VARCHAR2(A.MOCDate,10,p_style=>103) MOCDate  ,
             A.MOCBy ,
             A.CreatedBy ,
             a.DateCreated ,
             A.ApprovedByFirstLevel Level1ApprovedBy  ,
             a.DateApprovedFirstLevel Level1ApprovedDate  ,
             A.ApprovedBy Level2ApprovedBy  ,
             A.DateApproved Level2ApprovedDate  
        FROM CustomerLevelMOC_Mod A
               LEFT JOIN DimAssetClass B   ON A.AssetClassAlt_Key = B.AssetClassAlt_Key
             --AND  A.EffectiveFromTimeKey=@TimeKey and A.EffectiveToTimeKey=@TimeKey 

               LEFT JOIN DimMOCType D   ON A.MOCSourceAltkey = D.MOCTypeAlt_Key
               LEFT JOIN ( SELECT EffectiveFromTimeKey ,
                                  EffectiveToTimeKey ,
                                  ParameterAlt_Key ,
                                  ParameterName ,
                                  'MOCType' Tablename  
                           FROM DimParameter 
                            WHERE  DimParameterName = 'MOCType'
                                     AND EffectiveFromTimeKey <= v_TimeKey
                                     AND EffectiveToTimeKey >= v_TimeKey ) C   ON C.ParameterAlt_Key = A.MOCTypeAlt_Key
       WHERE  A.CustomerID = v_CustomerID
                AND A.AuthorisationStatus IN ( 'A' )

                AND A.EffectiveFromTimeKey = v_TimeKey ;
      DBMS_SQL.RETURN_RESULT(v_cursor);--Select MOCSourceAltKey,MOCTypeAlt_Key,* from CustomerLevelpreMOC  --where customerid='9987888'
   --select MOCSourceAltKey,MOCTypeAlt_Key,* from CustomerLevelPostMOC where customerid='9987888'
   --select * from ADVACBASICDETAIL
   --select * from dimassetclass
   --update CustomerLevelpreMOC set MOCSourceAltKey=1 where customerid='9987888'
   --update ADVACBASICDETAIL
   --set EffectiveToTimeKey=49999

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST" TO "ADF_CDR_RBL_STGDB";
