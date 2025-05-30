--------------------------------------------------------
--  DDL for Procedure CUSTOMERLVLNPASELECTLIST_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" 
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

  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERLVLNPASELECTLIST_04122023" TO "ADF_CDR_RBL_STGDB";
